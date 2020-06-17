<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">

</head>

<style type="text/css">
   
   @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

 .form-control {
        
        height: auto;
        
       
        padding: 10px;
        font-size: 16px;
        align : right;
       
   }
   
#main-container{
   width:1100px;
   align:center;
   font-family: 'Nanum Gothic';
   clear:both;
}

#content{
	width:1120px;
	margin-left:50px;
}

button {
  background:none;
  border:0;
  outline:0;
  cursor:pointer;
}
.tab_menu_container {
  display:flex;
}
.tab_menu_btn {
  width:90px;
  height:40px;
  transition:0.3s all;
}
.tab_menu_btn.on {
  border-bottom:2px solid #df0000;
  font-weight:700;
  color:#df0000;
}
.tab_menu_btn:hover {
  color:#df0000;
}
.tab_menu_container{
	float:right;
	font-family: 'Nanum Gothic';
	margin-bottom:50px;
}
.tab_wrap{
	clear:both;
}
   
</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
               $('#pw').html("비밀번호가 틀렸습니다.").css("color", "red");
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
  <div class="tab_wrap">
  <div class="tab_menu_container">
    <a href="accountDetail"><button class="tab_menu_btn" type="button">회원정보</button></a>
    <a href="pwModifyForm"><button class="tab_menu_btn on" type="button">비밀번호 변경</button></a>
    <a href="deleteAccount"><button class="tab_menu_btn" type="button">회원탈퇴</button></a>
    <a href="reportList"><button class="tab_menu_btn" type="button">내 신고 내역</button></a>
    <a href="qnaList"><button class="tab_menu_btn" type="button">내 문의 내역</button></a>
  </div>
  </div>
	      
	   </div>
	   <div id="main-container" style="width:1000px; padding: 0px 0px 0px 300px;">
            <div class="card-title" style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;">비 밀 번 호 변 경</h2><br>
            </div>
            <form id="pwchangeform" method="post">
            <div class="card-body">
              	 기존비밀번호 <input class="form-control" type="password" id="MEM_PW" name="MEM_PW"><br>
              	 새 비밀번호<input class="form-control" type="password" id="MEM_TEMP_PW" name="MEM_TEMP_PW"><br>
			   	새 비밀번호 확인 <input class="form-control" type="password" id="MEM_TEMP_PW2" name="MEM_TEMP_PW2"><br>
			   <span id="pw"></span>
            </div>
         
            <div class="card-body">
            	<input type="button" class="btn btn-success" style="width:80px; height:40px;" value="수정하기" id="pwchange">
            	<input type="button" class="btn btn-success" style="width:80px; height:40px;" value="취소하기" onclick="document.location.href='/second/shop/allGoodsList'">
				<br>
            </div>
            </form>
         </div>
         </div>
      </div>
</body>
</html>