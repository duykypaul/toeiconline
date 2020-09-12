<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title></title>
</head>
<body>
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
            <div>
                <div class="radio-inline">
                    <input type="radio" name="answerUser" value="A" ${items.answerUser == 'A' ? 'checked':''} />
                        ${item.option1}
                    <c:if test="${items.answerUser != null}">
                        <c:if test="${(item.correctAnswer == 'A')}">
                            <img src="<c:url value="/template/image/correct.png"/>">
                        </c:if>
                        <c:if test="${(items.answerUser == 'A') && (items.checkAnswer == true)}">
                            <img src="<c:url value="/template/image/incorrect.png"/>">
                        </c:if>
                    </c:if>
                </div>
                <div class="radio-inline">
                    <input type="radio" name="answerUser" value="B"${items.answerUser == 'B' ? 'checked':''}/>
                        ${item.option2}
                    <c:if test="${items.answerUser != null}">
                        <c:if test="${(item.correctAnswer == 'B')}">
                            <img src="<c:url value="/template/image/correct.png"/>">
                        </c:if>
                        <c:if test="${(items.answerUser == 'B') && (items.checkAnswer == true)}">
                            <img src="<c:url value="/template/image/incorrect.png"/>">
                        </c:if>
                    </c:if>
                </div>
                <div class="radio-inline">
                    <input type="radio" name="answerUser" value="C" ${items.answerUser == 'C' ? 'checked':''}/>
                        ${item.option3}
                    <c:if test="${items.answerUser != null}">
                        <c:if test="${(item.correctAnswer == 'C')}">
                            <img src="<c:url value="/template/image/correct.png"/>">
                        </c:if>
                        <c:if test="${(items.answerUser == 'C') && (items.checkAnswer == true)}">
                            <img src="<c:url value="/template/image/incorrect.png"/>">
                        </c:if>
                    </c:if>
                </div>
                <div class="radio-inline">
                    <input type="radio" name="answerUser" value="D" ${items.answerUser == 'D' ? 'checked':''}/>
                        ${item.option4}
                    <c:if test="${items.answerUser != null}">
                        <c:if test="${(item.correctAnswer == 'D')}">
                            <img src="<c:url value="/template/image/correct.png"/>">
                        </c:if>
                        <c:if test="${(items.answerUser == 'D') && (items.checkAnswer == true)}">
                            <img src="<c:url value="/template/image/incorrect.png"/>">
                        </c:if>
                    </c:if>
                </div>
            </div>
            <input type="hidden" name="exerciseId" value="${item.exercise.exerciseId}"
                   id="exerciseId"/>
        </div>
    </div>
</c:forEach>
</body>
</html>
