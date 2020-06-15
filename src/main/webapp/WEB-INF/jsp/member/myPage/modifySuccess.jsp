<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/mypage.css"/>" rel="stylesheet">
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<body onload="begin()" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
      <div >
      <div >
      
	  <div style= "padding: 0px 0px 0px 500px;" >
		<ul style="display:inline-block; margin-left:200px ">
			<li style="display:inline-block" class="selected"><a href="accountDetail" >회원정보</a></li>
		 |	<li style="display:inline-block" ><a href="pwModifyForm">비밀번호 변경</a></li>
       	 | <li style="display:inline-block"><a href="deleteAccount">회 원 탈 퇴</a></li>
       	 | <li style="display:inline-block"><a href="reportList">내 신고 내역</a></li>
       	 | <li style="display:inline-block"><a href="qnaList">내 문의 내역</a></li>
		</ul>
	  </div>
		
	   <div id="main-container" >
            <div class="card-title" style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;">회 원 정 보 변 경 완 료</h2>
            </div>
            <div >
               정보 변경이 완료되었습니다.
			   <span id="pw"></span>
            </div> 
            <div >
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="메인으로" id="gomain" onclick="document.location.href='/second/shop/allGoodsList'" style="background-color:#26a69a;">
				<br>
            </div>
         </div>
         </div>
      </div>
</body>
</html>