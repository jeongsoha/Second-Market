<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<p align="center">
이메일 인증이 완료되었습니다.
<br/>
<input type="button" id="goLogin" name="goLogin" value="로그인" onclick="location.href='/second/loginForm'"/>
<input type="button" id="goMain" name="goMain" value="메인으로" onclick="location.href='/second/shop/allGoodsList'"/>
</p>


</body>
</html>