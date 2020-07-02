<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- 이미지 롤오버효과 스크립트입니다. -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/a.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/reset.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layout.css"/>" />
<style>
body {
    margin: 0;
    padding: 0;
}
</style>

<title>second#</title>
</head>


<body>
<div id="wrapper">
   <!-- header --> 
<div id="container" style="width:100%; height:200px; margin:auto; display:block">
      <tiles:insertAttribute name="header"/><!-- // header -->
   </div>
       
   <!-- container --> 
<div id="container">
      <tiles:insertAttribute name="body"/><!-- // container -->
   </div>
   <!-- footer --> 
<div style="width:100%;  margin:auto; display:block">
      <tiles:insertAttribute name="footer"/><!-- // footer -->
</div>
</div>
</body>
</html>