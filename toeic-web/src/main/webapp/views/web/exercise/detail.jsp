<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><fmt:message key="label.exercise.paractice" bundle="${lang}"/></title>
</head>
<body>
<form action="" method="get" id="formUrl">
    <div class="row">
        <div class="span12">
            <ul class="thumbnails">
                <li class="span12">
                    <div class="thumbnail" id="result" style="display: flex; flex-direction: column">
                        <br/>
                        <c:forEach items="${items.listResult}" var="item">
                            <div class="title">
                                <b>${item.question}</b>
                            </div>
                            <div style="display: flex; justify-content: flex-start; margin-top: 20px;">
                                <c:if test="${item.image != null}">
                                    <div>
                                        <img src="<c:url value="/fileupload/${item.image}"/>" width="300px"
                                             height="150px">
                                    </div>
                                </c:if>
                                <div style="display: flex; flex-direction: column; align-items: flex-start; justify-content: space-around; margin-left: 65px;">
                                    <c:if test="${item.audio != null}">
                                        <div>
                                            <audio controls>
                                                <source src="<c:url value="/fileupload/${item.audio}"/>"
                                                        type="audio/mpeg">
                                            </audio>
                                        </div>
                                    </c:if>
                                    <div >
                                        <div class="radio-inline">
                                            <input type="radio" name="answerUser" value="A"/>
                                                ${item.option1}
                                        </div>
                                        <div class="radio-inline">
                                            <input type="radio" name="answerUser" value="B"/>
                                                ${item.option2}
                                        </div>
                                        <div class="radio-inline">
                                            <input type="radio" name="answerUser" value="C"/>
                                                ${item.option3}
                                        </div>
                                        <div class="radio-inline">
                                            <input type="radio" name="answerUser" value="D"/>
                                                ${item.option4}
                                        </div>
                                    </div>
                                    <input type="hidden" name="exerciseId" value="${item.exercise.exerciseId}"
                                           id="exerciseId"/>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="row block-check-answer">
        <input type="hidden" name="page" id="page" value="${items.page}"/>
        <input type="button" class="btn btn-info" value="Xem đáp án" id="btnConfirm"/>
        <input type="button" class="btn btn-info" value="Làm lại" id="btnAgain" style="margin-left: 26px;"/>
    </div>
    <!--Pagination-->
    <div class="row">
        <div class="span12">
            <ul id="pagination-demo" class="pagination-sm"></ul>
        </div>
    </div>
</form>
<script>
    var totalPages = ${items.totalPages};
    var startPage = ${items.page};
    $(document).ready(function () {
        $('#btnConfirm').click(function () {
            if ($('input[name=answerUser]:checked').length > 0) {
                $('#formUrl').submit();
            } else {
                alert("Bạn chưa chọn đáp án");
            }
        });
        $('#btnAgain').click(function () {
            var exerciseId = $('#exerciseId').val();
            window.location = "/bai-tap-thuc-hanh.html?page=" + startPage + "&exerciseId=" + exerciseId + "";
        });
    });
    $('#pagination-demo').twbsPagination({
        totalPages: totalPages,
        startPage: startPage,
        visiblePages: 0,
        onPageClick: function (event, page) {
            if (page != startPage) {
                $('#page').val(page);
                var exerciseId = $('#exerciseId').val();
                window.location = "/bai-tap-thuc-hanh.html?page=" + page + "&exerciseId=" + exerciseId + "";
            }
        }
    });
    $('#formUrl').submit(function (e) {
        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: '/ajax-bai-tap-dap-an.html',
            data: $(this).serialize(),
            dataType: 'html',
            success: function (response) {
                $('#result').html(response);
            },
            error: function (response) {
                console.log(response);
            }
        });
    });
</script>
</body>
</html>
