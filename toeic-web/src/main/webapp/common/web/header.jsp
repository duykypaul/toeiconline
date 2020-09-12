<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="logoutUrl" value="/logout.html">
    <c:param name="action" value="logout"/>
</c:url>
<c:url var="loginUrl" value="/login.html">
    <c:param name="action" value="login"/>
</c:url>
<!--HEADER ROW-->
<div id="header-row">
    <div class="container">
        <div class="row">
            <!--LOGO-->
            <div class="span3">
                <div style="width: 50px; height: 50px">
                    <a class="brand" href="#">
                        <img src="http://3.bp.blogspot.com/-bJ1NAjQqg4k/U7Jz92vfmpI/AAAAAAAAASs/h8vhdvF5a9I/s1600/Toeic-Listening.png" alt=""/>
                    </a>
                </div>
            </div>
            <!-- /LOGO -->

            <!-- MAIN NAVIGATION -->
            <div class="span9">
                <div class="navbar pull-right">
                    <div class="navbar-inner">
                        <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar"><span
                                class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a>
                        <div class="nav-collapse collapse navbar-responsive-collapse">
                            <ul class="nav">
                                <li class="active"><a href="home.html">Trang chủ</a></li>
                                <c:if test="${not empty login_name}">
                                    <li><a><strong>Hi, ${login_name}</strong></a></li>
                                    <li><a href="${logoutUrl}"><fmt:message key="label.logout" bundle="${lang}"/></a>
                                    </li>
                                </c:if>
                                <c:if test="${empty login_name}">
                                    <li><a href="${loginUrl}"><fmt:message key="label.login" bundle="${lang}"/></a></li>
                                </c:if>

                            </ul>
                        </div>

                    </div>
                </div>
            </div>
            <!-- MAIN NAVIGATION -->
        </div>
    </div>
</div>
<!-- /HEADER ROW -->
