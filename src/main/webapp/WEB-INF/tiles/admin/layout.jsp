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



<title>second#</title>
</head>
<body>
	<div id="header">
		<tiles:insertAttribute name="header"/><!-- // header -->
	</div>
	 	
	<!-- container --> 
		<tiles:insertAttribute name="body"/><!-- // container -->
		
	<!-- footer --> 
	<tiles:insertAttribute name="footer"/><!-- // footer -->

</body>
</html>