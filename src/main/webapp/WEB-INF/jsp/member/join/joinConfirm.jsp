<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JoinConfirm</title>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

#container {
   width: 1000px;
   height: 350px;
   background: #eaedca;
   font-family: 'Nanum Gothic';
   margin-left: 350px;
   margin-top: 200px;
   padding: 80px;
   margin-bottom: 350px;
   align: center;
}

#logo {
   width: 90px;
   height: 90px;
   margin-left: 30px;
   display: inline-block;
}

#error {
   font-size: 70px;
   margin-left: 30px;
   display: inline-block;
   font-family: 'Nanum Gothic';
}

#content {
   font-size: 18px;
   margin-left: 30px;
   font-family: 'Nanum Gothic';
}

#main {
   font-size: 18px;
   margin-left: 30px;
}
</style>

</head>

<body>

   <div id="container">

      <div id="content" align="center">
         <img src="/second/resources/images/welcome2.jpg" /> <br> <br>
         <br>
         <br>
         <b style="font-size: 30px;">회원가입이 </b><b
            style="color: #47C83E; font-size: 30px;">정상적으로</b><b
            style="font-size: 30px;"> 완료되었습니다.</b><br>
         <br>

      </div>

      <p align="center">

         <input type="button" id="goLogin" name="goLogin" value="로그인"
            onclick="location.href='/second/loginForm'" /> <input type="button"
            id="goMain" name="goMain" value="메인으로"
            onclick="location.href='/second/shop/allGoodsList'" />
      </p>
</body>
</html>