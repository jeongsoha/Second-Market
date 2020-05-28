<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/mypage.css"/>" rel="stylesheet">
<script type="text/javascript">

$(document).ready(function() { //변경 버튼 클릭시
    $("#delete").on("click", function(e) {
       e.preventDefault();
       fn_delete();
    });
 });
 
 function fn_delete(deleteAccountForm) { //변경 버튼 클릭시(유효성검증, 데이터입력)
	 var MEM_PW = {MEM_PW : $('#MEM_PW').val()};
     $.ajax({
         url:"<c:url value='/myPage/deletePw'/>",
         type:'get',
         data: MEM_PW,
         success:function(data){              
             if($.trim(data)=="1"){
            	 var comSubmit = new ComSubmit("deleteAccountForm");
            	 comSubmit.setUrl("<c:url value='/myPage/deleteAccountCheck'/>");
            	 comSubmit.submit();  
             }else{
                alert("비밀번호가 틀렸습니다.");
             }
         },
         error:function(){
                 alert("에러입니다");
         }
     });
 };
 
 $("#deleteAccountForm").on("submit",function(e){
 });

</script>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<body onload="begin()" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
      <div class="card align-middle" style="border-radius:20px; background-color:#fff; margin-top:50px;">
      <div id="content">
         <div id="vertical_tab-container">
	         <ul>
	         <li><a href="accountDetail"><img src="./../resources/images/mypage_tab1.png" width="100" height="30"></a></li>
	         <li><a href="pwModifyForm"><img src="./../resources/images/mypage_tab2.png" width="100" height="30"></a></li>
	         <li class="selected"><a href="deleteAccount"><img src="./../resources/images/mypage_tab3.png" width="100" height="30"></a></li>
	         <li><a href="reportList"><img src="./../resources/images/mypage_tab4.png" width="100" height="30"></a></li>
	         <li><a href="qnaList"><img src="./../resources/images/mypage_tab5.png" width="100" height="30"></a></li>
	      </ul>
	   </div>
	   <div id="main-container">
            <div class="card-title" style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;"><img src="/nnS/resources/images/mypage_delete.png"></h2>
            </div>
            <form id="deleteAccountForm" method="post">
            <div class="card-body">
            <p>
            	한 번 탈퇴하시면 회원님의 정보를 복구할 수 없습니다.<br/>신중히 선택해 주시길 바랍니다.
			</p>
               <img src="/nnS/resources/images/mypage_pw.png"><input class="form-control" type="password" id="MEM_PW" name="MEM_PW"><br>
            </div>
         
            <div class="card-body">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="탈퇴하기" id="delete" style="background-color:#26a69a;">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="취소하기" onclick="document.location.href='/nnS/main'" style="background-color:#26a69a;">
				<br>
            </div>
            </form>
         </div>
         </div>
      </div>
</body>
</html>