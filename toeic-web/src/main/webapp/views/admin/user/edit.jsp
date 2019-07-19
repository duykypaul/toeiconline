<%--
  Created by IntelliJ IDEA.
  User: CACLV
  Date: 7/18/2019
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="editUserUrl" value="/ajax-admin-user-edit.html">
    <c:param name="urlType" value="url_edit"/>
</c:url>
<c:choose>
<c:when test="${not empty messageResponse}">
    ${messageResponse}
</c:when>
<c:otherwise>
<div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">
                <c:if test="${item.pojo.userId != null}">
                    <fmt:message key="label.user.edit" bundle="${lang}"/>
                </c:if>
                <c:if test="${item.pojo.userId == null}">
                    <fmt:message key="label.user.add" bundle="${lang}"/>
                </c:if>
            </h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-xs-12">
                    <div class="well">
                        <form id="editUserForm" action="${editUserUrl}" method="post" novalidate="novalidate">
                            <div class="form-group">
                                <input type="text" class="form-control" id="fullName" name="pojo.fullName"
                                       value="${item.pojo.fullName}" required=""
                                       placeholder='<fmt:message key="label.user.fullName" bundle="${lang}"/>'>
                                <span class="help-block"></span>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control" id="username" name="pojo.name"
                                       value="${item.pojo.name}" required=""
                                       placeholder='<fmt:message key="label.user.name" bundle="${lang}"/>'>
                                <span class="help-block"></span>
                            </div>

                            <div class="form-group">
                                <input type="password" class="form-control" id="password" name="pojo.password"
                                       value="${item.pojo.password}" required=""
                                       placeholder='<fmt:message key="label.user.password" bundle="${lang}"/>'>
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <select id="role" name="roleId">
                                    <c:choose>
                                        <c:when test="${item.pojo.userId != null}">
                                            <option value="${item.pojo.roleDTO.roleId}">${item.pojo.roleDTO.name}</option>
                                            <c:forEach items="${item.roleDTOS}" var="itemRole">
                                                <c:if test="${itemRole.roleId != item.pojo.roleDTO.roleId}">
                                                    <option value="${itemRole.roleId}">${itemRole.name}</option>
                                                </c:if>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <option><fmt:message key="label.option.role" bundle="${lang}"/></option>
                                            <c:forEach items="${item.roleDTOS}" var="itemRole">
                                                <option value="${itemRole.roleId}">${itemRole.name}</option>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                                <span class="help-block"></span>
                            </div>
                            <c:if test="${not empty item.pojo.userId}" >
                                <input type="hidden" name="pojo.userId" value="${item.pojo.userId}">
                            </c:if>
                            <input type="hidden" name="crudaction" id="crudactionEdit">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" id="btnSave" class="btn btn-primary"><fmt:message key="label.save"
                                                                                    bundle="${lang}"/></button>
            <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="label.close"
                                                                                            bundle="${lang}"/></button>
        </div>
    </div>
</div>
</c:otherwise>
</c:choose>

