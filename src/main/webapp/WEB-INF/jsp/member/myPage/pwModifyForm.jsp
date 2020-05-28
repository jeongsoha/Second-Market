<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/mypage.css"/>" rel="stylesheet">
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"/>
<script type="text/javascript">
$(document).ready(function() { //비밀번호 일치 확인
    //[1] lblError 레이어 클리어
    $('#MEM_TEMP_PW').keyup(function() {
        //$('#pwr').remove(); // 제거
        $('#pw').text(''); // 제거가 아니라 클리어
           $('#MEM_TEMP_PW2').val('');
    });
    //[2] 암호 확인 기능 구현
    $('#MEM_TEMP_PW2').keyup(function() {
        if ($('#MEM_TEMP_PW').val() != $('#MEM_TEMP_PW2').val()) {
            $('#pw').text(''); // 클리어
            $('#pw').html("암호가 일치하지 않습니다.").css("color", "red");          //레이어에 HTML 출력
        }
        else {
            $('#pw').text(''); // 클리어
            $('#pw').html("암호가 일치합니다.").css("color", "blue");
        }
    });
});

$(document).ready(function() { //id check
    $("#pwchange").on("click", function(e) {
       e.preventDefault();
       fn_pwchangeCheck();
    });
 });

function fn_pwchangeCheck(){ //pw check
    var MEM_PW = {MEM_PW : $('#MEM_PW').val()};
    $.ajax({
        url:"<c:url value='/myPage/pwchangeCheck'/>",
        type:'get',
        data: MEM_PW,
        success:function(data){              
            if($.trim(data)=="1"){
            	var comSubmit = new ComSubmit("pwchangeform");
            	comSubmit.setUrl("<c:url value='/myPage/modifySuccess'/>");
            	comSubmit.submit();
            }else{
               $('#pwc').html("비밀번호가 틀렸습니다.").css("color", "red");
            }
        },
        error:function(){
                alert("에러입니다");
        }
    });
};

$("#pwchangeform").on("submit",function(e){
	
});


</script>
<body onload="begin()" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
      <div class="card align-middle" style="border-radius:20px; background-color:#fff; margin-top:50px;">
      <div id="content">
         <div id="vertical_tab-container">
	         <ul>
	         <li><a href="accountDetail"><img src="./../resources/images/mypage_tab1.png" width="100" height="30"></a></li>
	         <li class="selected"><a href="pwModifyForm"><img src="./../resources/images/mypage_tab2.png" width="100" height="30"></a></li>
	         <li><a href="deleteAccount"><img src="./../resources/images/mypage_tab3.png" width="100" height="30"></a></li>
	         <li><a href="reportList"><img src="./../resources/images/mypage_tab4.png" width="100" height="30"></a></li>
	         <li><a href="qnaList"><img src="./../resources/images/mypage_tab5.png" width="100" height="30"></a></li>
	      </ul>
	   </div>
	   <div id="main-container">
            <div class="card-title" style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;"><img src="/nnS/resources/images/mypage_pwchange.png"></h2>
            </div>
            <form id="pwchangeform" method="post">
            <div class="card-body">
               <img src="/nnS/resources/images/mypage_opw.png"> <input class="form-control" type="password" id="MEM_PW" name="MEM_PW"><br>
               <img src="/nnS/resources/images/mypage_npw.png"> <input class="form-control" type="password" id="MEM_TEMP_PW" name="MEM_TEMP_PW"><br>
			   <img src="/nnS/resources/images/mypage_npwc.png"> <input class="form-control" type="password" id="MEM_TEMP_PW2" name="MEM_TEMP_PW2"><br>
			   <span id="pw"></span>
            </div>
         
            <div class="card-body">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="수정하기" id="pwchange" style="background-color:#26a69a;">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="취소하기" onclick="document.location.href='/nnS/main'" style="background-color:#26a69a;">
				<br>
            </div>
            </form>
         </div>
         </div>
      </div>
</body>
</html>