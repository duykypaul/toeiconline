<%@include file="/common/taglib.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: CACLV
  Date: 7/13/2019
  Time: 9:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="requestUrl" value="/admin-guideline-listen-list.html"/>
<c:url value="/admin-guideline-listen-edit.html" var="listenGuideLineEditUrl">
    <c:param name="urlType" value="url_edit"/>
</c:url>
<c:url var="formUrl" value="/admin-guideline-listen-list.html"/>
<html>
<head>
    <title><fmt:message key="label.guideline.listen.list" bundle="${lang}"/></title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#"><fmt:message key="label.home" bundle="${lang}"/></a>
                </li>
                <li class="active"><fmt:message key="label.guideline.listen.list" bundle="${lang}"/></li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <%--<a type="button" href="${listenGuideLineEditUrl}">Thêm bài hd nghe</a>--%>
                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-block alert-${alert}">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                                ${messageResponse}
                        </div>
                    </c:if>
                    <form action="${formUrl}" method="get" id="formUrl">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="widget-box table-filter">
                                    <div class="widget-header">
                                        <h4 class="widget-title"><fmt:message key="label.search" bundle="${lang}"/></h4>
                                        <div class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label"><fmt:message
                                                            key="label.guideline.listen.title"
                                                            bundle="${lang}"/></label>
                                                    <div class="col-sm-8">
                                                        <div class="fg-line">
                                                            <input type="text" value="${items.pojo.title}"
                                                                   class="form-control input-sm" name="pojo.title"
                                                                   />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label"></label>
                                                    <div class="col-sm-8">
                                                        <button id="btnSearch" class="btn btn-sm btn-success">
                                                            <fmt:message key="label.search" bundle="${lang}"/>
                                                            <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-btn-controls">
                                    <div class="pull-right tableTools-container">
                                        <div class="dt-buttons btn-overlap btn-group">
                                            <c:url var="addUrl" value="/admin-guideline-listen-edit.html">
                                                <c:param name="urlType" value="url_edit"/>
                                            </c:url>
                                            <a flag="info"
                                               class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                                               href="${addUrl}"
                                               data-toggle="tooltip"
                                               title="<fmt:message key='label.guideline.listen.add' bundle='${lang}'/>">
                                                        <span>
                                                            <i class="fa fa-plus-circle bigger-110 purple"></i>
                                                        </span>
                                            </a>
                                            <button type="button"
                                                    class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                    id="deleteAll" disabled onclick="warningBeforeDeleteMulti()"
                                                    data-toggle="tooltip"
                                                    title="<fmt:message key='label.delete.all' bundle='${lang}'/>">
                                                         <span>
                                                            <i class="fa fa-trash-o bigger-110 pink"></i>
                                                        </span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <fmt:bundle basename="ApplicationResources">
                                <display:table id="tableList" name="items.listResult" partialList="true"
                                               size="${items.totalItems}"
                                               pagesize="${items.maxPageItems}" sort="external"
                                               requestURI="${requestUrl}"
                                               class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                               style="margin: 3em 0 1.5em;">
                                    <display:column title="<fieldset class='form-group'>
                                                                <input type='checkbox' id='checkAll' class='check-box-element'>
                                                                </fieldset>" class="center select-cell"
                                                    headerClass="center select-cell">
                                        <fieldset>
                                            <input type="checkbox" name="checkList"
                                                   id="checkbox_${tableList.listenGuideLineId}"
                                                   value="${tableList.listenGuideLineId}" class="check-box-element"/>
                                        </fieldset>
                                    </display:column>
                                    <display:column property="title" titleKey="label.guideline.listen.title"
                                                    sortable="true" sortName="title"/>
                                    <display:column property="createdDate" titleKey="label.createdDate" sortable="true"
                                                    sortName="createdDate"/>
                                    <display:column property="modifiedDate" titleKey="label.modifiedDate"
                                                    sortable="true" sortName="modifiedDate"/>
                                    <display:column headerClass="col-actions" titleKey="label.action">
                                        <c:url var="editUrl" value="">
                                            <c:param name="urlType" value="url_edit"/>
                                            <c:param name="pojo.listenGuideLineId"
                                                     value="${tableList.listenGuideLineId}"/>
                                        </c:url>
                                        <a class="btn btn-sm btn-primary btn-edit" href="${editUrl}"
                                            data-toggle="tooltip"
                                           title="<fmt:message key='label.guideline.listen.edit' bundle='${lang}'/>"><i
                                                class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                        <a class="btn btn-sm btn-danger btn-cancel" onclick="warningBeforeDelete(${tableList.listenGuideLineId})"
                                            data-toggle="tooltip" title="<fmt:message key='label.guideline.listen.delete' bundle='${lang}'/>">
                                           <i class="fa fa-trash" aria-hidden="true"></i>
                                        </a>
                                    </display:column>
                                </display:table>
                            </fmt:bundle>
                        </div>
                        <input type="hidden" name="urlType" id="urlType" value="url_list"/>
                        <input type="hidden" name="crudaction" id="crudaction"/>
                        <input type="hidden" name="checkList" id="checkList"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#btnSearch').click(function () {
            $('#formUrl').submit();
        });
    });
    function warningBeforeDeleteMulti() {
        showAlertBeforeDelete(function () {
            $('#crudaction').val('redirect_delete');
            $('#checkList').prop("name", false);
            $('#formUrl').submit();
        });
    }
    function warningBeforeDelete(listenGuideLineId) {
        showAlertBeforeDelete(function () {
            $('#crudaction').val('redirect_delete');
            $('#checkList').val('' +listenGuideLineId+'');
            $('#formUrl').submit();
        });
    }
</script>
</body>
</html>
