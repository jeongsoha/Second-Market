<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/mypage.css"/>" rel="stylesheet">
</head>

<body onload="begin()" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
      <div class="card align-middle" style="border-radius:20px; background-color:#fff; margin-top:50px;">
      <div id="content">
         <div id="vertical_tab-container">
	         <ul>
	         <li class="selected"><a href="accountDetail"><img src="./../resources/images/mypage_tab1.png" width="100" height="30"></a></li>
	         <li><a href="pwModifyForm"><img src="./../resources/images/mypage_tab2.png" width="100" height="30"></a></li>
	         <li><a href="deleteAccount"><img src="./../resources/images/mypage_tab3.png" width="100" height="30"></a></li>
	         <li><a href="reportList"><img src="./../resources/images/mypage_tab4.png" width="100" height="30"></a></li>
	         <li><a href="qnaList"><img src="./../resources/images/mypage_tab5.png" width="100" height="30"></a></li>
	      </ul>
	   </div>
	   <div id="main-container">
            <div class="card-title" style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;"><img src="/nnS/resources/images/mypage_myinfo.png"></h2>
            </div>
            <div class="card-body">
              <img src="/nnS/resources/images/mypage_id.png"><div class="form-control">${map.MEM_ID } </div><br>
               <img src="/nnS/resources/images/mypage_name.png"> <div class="form-control">${map.MEM_NAME } </div><br>
			  <img src="/nnS/resources/images/mypage_birth.png"><div class="form-control">생년월일 ${map.MEM_BIRTH }</div><br>
			   <img src="/nnS/resources/images/mypage_gen.png"><div class="form-control">${map.MEM_GEN }</div><br>
			   <img src="/nnS/resources/images/mypage_email.png"><div class="form-control">${map.MEM_EMAIL }</div><br>
		       <img src="/nnS/resources/images/mypage_phone.png"><div class="form-control">${map.MEM_PHONE }</div><br>
			   <img src="/nnS/resources/images/mypage_zip.png"><div class="form-control">${map.MEM_ZIP }</div><br>
			   <img src="/nnS/resources/images/mypage_add.png"><div class="form-control">${map.MEM_ADD1 }</div><br>
			   <img src="/nnS/resources/images/mypage_add2.png"><div class="form-control">${map.MEM_ADD2 }</div><br>	
            </div>
         
            <div class="card-body">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="수정 하러 가기" onclick="ch_info();" style="background-color:#26a69a;">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="취소" onclick="back();" style="background-color:#26a69a;">
				<span id="pwc"></span>
				<br>
            </div>
         </div>
         </div>
      </div>
      
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

function ch_info(){
	document.location.href= "/nnS/myPage/accountModifyForm";   
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