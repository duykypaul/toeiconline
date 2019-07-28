<%--
  Created by IntelliJ IDEA.
  User: CACLV
  Date: 7/27/2019
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><fmt:message key="label.home" bundle="${lang}"/></title>
</head>
<body>
<div class="row">
    <div class="span9">
        <!--Blog Post-->
        <div class="blog-post">
            <h2>${item.pojo.title}</h2>
            <div>${item.pojo.content}</div>
            <a class="btn btn-primary" href="<c:url var="urlList" value="/danh-sach-huong-dan-nghe.html"/>"><fmt:message key="label.list.back" bundle="${lang}"/></a>
        </div>
        <!--===============-->
    </div>
</div>
</body>
</html>
