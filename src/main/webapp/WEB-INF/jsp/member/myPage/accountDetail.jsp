<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">

</head>
<style type="text/css">

 .form-control {
        
        height: auto;
        
       
        padding: 10px;
        font-size: 16px;
        align : right;
       
   }
   
</style>

<body onload="begin()" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
      <div style="border-radius:20px; background-color:#fff; margin-top:50px;">
      
      
      <div id="con">
      
    
	<div style= "padding: 0px 0px 0px 500px;" >
		<ul style="display:inline-block; margin-left:200px ">
			<li style="display:inline-block" class="selected"><a href="accountDetail" >회원정보</a></li>
		 |	<li style="display:inline-block" ><a href="pwModifyForm">비밀번호 변경</a></li>
       	 | <li style="display:inline-block"><a href="deleteAccount">회 원 탈 퇴</a></li>
       	 | <li style="display:inline-block"><a href="reportList">내 신고 내역</a></li>
       	 | <li style="display:inline-block"><a href="qnaList">내 문의 내역</a></li>
	</ul>
	</div>
	   
	   
	   <div id="main-container" style="width:1000px; padding: 0px 0px 0px 390px;">
            <div  style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;">회 원 정 보 확 인</h2>
            </div>
            <div>
            	  아 이 디<div class="form-control">${map.MEM_ID } </div><br>
               	 이 름 <div class="form-control">${map.MEM_NAME } </div><br>
				  생 년 월 일<div class="form-control">생년월일 ${map.MEM_BIRTH }</div><br>
			   	성 별<div class="form-control">${map.MEM_GEN }</div><br>
			   	이 메 일<div class="form-control">${map.MEM_EMAIL }</div><br>
				휴 대 전 화<div class="form-control">${map.MEM_PHONE }</div><br>
			   	주 소<div class="form-control">${map.MEM_ADD1 }</div><br>
            </div>
         
            <div class="card-body">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="수정 하러 가기" onclick="ch_info();" style="background-color:#26a69a;">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="취소" onclick="fn_openBoardList();" style="background-color:#26a69a;">
				<span id="pwc"></span>
				<br>
            </div>
       
       </div>
         
         
         
         </div>
      </div>
      
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

function ch_info(){
	document.location.href= "/second/myPage/accountModifyForm";   
}

function fn_openBoardList() {
	document.location.href= "/second/sample/openBoardList"; 
}

$(document).ready(function() {

	//Default Action
	$(".goodsTab_content").hide(); //Hide all content
	$("ul.goodsTabs li:first").addClass("active").show(); //Activate first goodsTab
	$(".goodsTab_content:first").show(); //Show first goodsTab content
	
	//On Click Event
	$("ul.goodsTabs li").click(function() {
		$("ul.goodsTabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected goodsTab
		$(".goodsTab_content").hide(); //Hide all goodsTab content
		var activegoodsTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active goodsTab + content
		$(activegoodsTab).fadeIn(); //Fade in the active content
		return false;
	});

});

function back(){
	history.go(-1);
}
</script>
</body>
</html>