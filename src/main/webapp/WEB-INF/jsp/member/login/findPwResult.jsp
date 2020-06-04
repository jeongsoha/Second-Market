<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript">
/* 
닫기
 */
</script>
</head>
<body>

<%-- ${eCheck } --%>

<c:if test="${id.MEM_ID==null || id.MEM_ID==''}">
조회된 아이디가 없습니다.
</c:if>
<c:if test="${id.MEM_ID!=null && id.MEM_ID!=''}">
입력하신 정보로 등록된 아이디는 '${id.MEM_ID}'입니다.
</c:if>
<div class="result" style="display: none">
임시 비밀번호가 입력하신 이메일로 전송되었습니다.<br>
<a href="#" class="btn" onclick="close();">닫기</a>
</div>

</body>
</html>