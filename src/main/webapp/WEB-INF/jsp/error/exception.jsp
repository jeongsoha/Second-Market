<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>board</title>

<style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

#container{
	width:1000px;
	height:350px;
	background:#eeeeee;
	font-family: 'Nanum Gothic';
	margin-left:350px;
	margin-top:200px;
	padding:80px;
	margin-bottom:350px;
	align:center;
}

#logo{
	width:90px;
	height:90px;
	margin-left:30px;
	display:inline-block;
}

#error{
	font-size:70px;
	margin-left:30px;
	display:inline-block;
	font-family: 'Nanum Gothic';
}

#content{
	font-size:18px;
	margin-left:30px;
	font-family: 'Nanum Gothic';
}

#main{
	font-size:18px;
	margin-left:30px;
}

</style>


</head>

<body>


	<div id="container">
		
			<div id="logo">
				<img src="/second/resources/images/404.svg" />
			</div>
			
			<div id="error">
				<b>Error </b><b style="color:#47C83E;">500</b> <b>Not Found</b>
			</div>
			
			<div id="content">
			<br><br><br><b style="font-size:30px;">서비스 </b><b style="color:#47C83E;font-size:30px;">이용에 불편</b><b style="font-size:30px;">을 드려 죄송합니다.</b><br><br>
			<b>데이터를 처리 하는 과정에서 문제가 발생하였습니다.<br>
			관리자에게 문의하여 주십시오.</b>
			</div>
			
			<br><br><br><br>
			<a href="/second/shop/allGoodsList" id="main"><span>메인으로 이동</span></a>
			
		</div>
		
		
</body>
</html>
