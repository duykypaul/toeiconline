<%--
  Created by IntelliJ IDEA.
  User: CACLV
  Date: 7/16/2019
  Time: 2:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="formUrl" value="/admin-guideline-listen-edit.html" />
<html>
<head>
    <title><title><fmt:message key="label.guideline.listen.list" bundle="${lang}"/></title></title>
    <style>
        .error{
            color: red;
            font-size: small;
        }
    </style>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#"><fmt:message key="label.home" bundle="${lang}"/></a>
                </li>
                <li class="active"><fmt:message key="label.guideline.listen.edit" bundle="${lang}"/></li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-block alert-${alert}">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                                ${messageResponse}
                        </div>
                    </c:if>
                    <form action="${formUrl}" method="post" enctype="multipart/form-data" id="formEdit" >
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                <fmt:message key="label.guideline.listen.title" bundle="${lang}"/>
                            </label>
                            <div class="col-sm-9">
                                <input type="text" name="pojo.title" id="title" value="${item.pojo.title}"/>
                            </div>
                        </div>
                        <br />
                        <br />
                        <br />
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                <fmt:message key="label.grammarguideline.upload.image" bundle="${lang}"/>
                            </label>
                            <div class="col-sm-9">
                                <input type="file" name="file" id="uploadImage"/>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group" id="formViewImage" >
                            <label class="col-sm-3 control-label no-padding-right">
                                <fmt:message key="label.grammarguideline.upload.image.view" bundle="${lang}"/>
                            </label>
                            <div class="col-sm-9">
                                <c:if test="${not empty item.pojo.image}">
                                    <c:set var="image" value="/fileupload/listenguideline/${item.pojo.image}"/>
                                </c:if>
                                <img src="${image}" id="viewImage" width="150px" height="150px">
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                <fmt:message key="label.guideline.listen.content" bundle="${lang}"/>
                            </label>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <c:if test="${not empty item.pojo.content}">
                                    <c:set var="content" value="${item.pojo.content}"/>
                                </c:if>
                                <textarea name="pojo.content" cols="80" rows="10" id="listenGuideLineContent">${content}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="submit" class="btn btn-white btn-warning btn-bold" value="<fmt:message key="label.done" bundle="${lang}"/>" />
                            </div>
                        </div>
                        <c:if test="${not empty item.pojo.listenGuideLineId}">
                            <input type="hidden" name="pojo.listenGuideLineId" value="${item.pojo.listenGuideLineId}" />
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var editor = '';
    var listenGuideLineId = '';
    var setHideFormViewImage = false;
    <c:if test="${not empty item.pojo.listenGuideLineId}">
        listenGuideLineId = ${item.pojo.listenGuideLineId}

    </c:if>
    <c:if test="${empty item.pojo.listenGuideLineId}">
        setHideFormViewImage = true;
    </c:if>
    $(document).ready(function() {
        editor = CKEDITOR.replace('listenGuideLineContent');
        if(setHideFormViewImage){
            if($('#uploadImage').val() == ""){
                $('#formViewImage').hide();
            }
        }
        validateData();
        $('#uploadImage').change(function () {
            readURL(this, 'viewImage');
            $('#formViewImage').show();
        });
    });
    function validateData(){
        $('#formEdit').validate({
            ignore: [],
            rules: [],
            messages: []
        });
        $("#title" ).rules( "add", {
            required: true,
            messages: {
                required: '<fmt:message key="label.empty" bundle="${lang}"/>'
            }
        });
        if (listenGuideLineId == ''){
            $("#uploadImage" ).rules( "add", {
                required: true,
                messages: {
                    required: '<fmt:message key="label.empty" bundle="${lang}"/>'
                }
            });
        }
        $("#listenGuideLineContent" ).rules( "add", {
            required: function () {
                CKEDITOR.instances.listenGuideLineContent.updateElement();
            },
            messages: {
                required: '<fmt:message key="label.empty" bundle="${lang}"/>'
            }
        });
    }
    function readURL(input, viewImage) {
        if(input.files && input.files[0]){
            var reader = new FileReader();
            reader.onload = function (ev) {
                $('#' + viewImage).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>
