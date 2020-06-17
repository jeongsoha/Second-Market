<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/mypage.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">

<style>

 @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
a{
   color: #000;
   text-decoration: none;	
}

.btn3 {	
	width:100px;
    background-color: #fff;
    border:1px solid #80EB1C;
    color:#000;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius:10px;
    height: 30px;
}
.btn3:hover {
  	background-color: #80EB1C;
    color:#fff;
}
    .form-control {
      height: auto;
      padding: 10px;
      font-size: 16px;
      width: 500px;
      text-align: center;
    }

    #main-container {
      width: 1100px;
      align: center;
      font-family: "Nanum Gothic";
      clear: both;
    }

    #content {
      width: 1120px;
      margin-left: 50px;
    }

    button {
      background: none;
      border: 0;
      outline: 0;
      cursor: pointer;
    }
    .tab_menu_container {
      display: flex;
    }
    .tab_menu_btn {
      width: 90px;
      height: 40px;
      transition: 0.3s all;
    }
    .tab_menu_btn.on {
      border-bottom: 2px solid #df0000;
      font-weight: 700;
      color: #df0000;
    }
    .tab_menu_btn:hover {
      color: #df0000;
    }
    .tab_menu_container {
      float: right;
      font-family: "Nanum Gothic";
      margin-bottom: 50px;
    }
    .tab_wrap {
      clear: both;
    }
    
a{
   color: #000;
   text-decoration: none;	
}
</style>

</head>
 <body
    onload="begin()"
    cellpadding="0"
    cellspacing="0"
    marginleft="0"
    margintop="0"
    width="100%"
    height="100%"
    align="center"
  >
    <div style="border-radius: 20px; background-color: #fff; margin-top: 50px;">
      <div id="content">
        <div class="tab_wrap">
          <div class="tab_menu_container">
            <a href="accountDetail"
              ><button class="tab_menu_btn on" type="button">
                회원정보
              </button></a
            >
            <a href="pwModifyForm"
              ><button class="tab_menu_btn" type="button">
                비밀번호 변경
              </button></a
            >
            <a href="deleteAccount"
              ><button class="tab_menu_btn" type="button">회원탈퇴</button></a
            >
            <a href="reportList"
              ><button class="tab_menu_btn" type="button">
                내 신고 내역
              </button></a
            >
            <a href="qnaList"
              ><button class="tab_menu_btn" type="button">
                내 문의 내역
              </button></a
            >
          </div>
        </div>
	   
	   
	   
	   
	   <div id="main-container" style="width: 1000px;padding: 0px 0px 0px 330px;">
	   <div style="width:500px;">
	   
            <div class="card-title" style="margin-top:30px;">
               <h1 style="color:#000">회 원 정 보 확 인</h1>
            </div>
            <form id="accountModifyForm" method="post">
            <div class="card-body">
            	
              	아 이 디 <div class="form-control">${map.MEM_ID } </div><br>
             	 이 름 <input type="text" id="MEM_NAME" name="MEM_NAME" class="form-control" placeholder="${map.MEM_NAME }"><br>
           	   생 년 월 일<input type="text" id="MEM_BIRTH" name="MEM_BIRTH" class="form-control" placeholder="${map.MEM_BIRTH }"><br>
             	성 별	
              <br>&nbsp;&nbsp;
              <input type="radio" id="MEM_GEN_M" name="MEM_GEN" value="남성" checked />&nbsp;&nbsp;남성&nbsp;&nbsp;
             &nbsp;&nbsp; <input type="radio" id="MEM_GEN_F" name="MEM_GEN" value="여성"/>&nbsp;&nbsp;여성&nbsp;&nbsp;	 <br><br>
              
                					
			   이 메 일<input type="text" id="MEM_EMAIL" name="MEM_EMAIL" class="form-control" placeholder="${map.MEM_EMAIL }"><br>
		       	휴대전화<input type="text" id="MEM_PHONE" name="MEM_PHONE" class="form-control" placeholder="${map.MEM_PHONE }"><br>
			   
			   	주소<input type="text" id="MEM_ADD1" name="MEM_ADD1" class="form-control" placeholder="${map.MEM_ADD1 }"><br>
			 
            </div>
         
            <div class="card-body">
            	<input type="button" class="btn3" value="수정하기" onclick="fn_check();" >
            	<input type="button" class="btn3" value="취소" onclick="back();">
				<span id="pwc"></span>
				<br>
				
            </div>
            </form>
         </div>
         </div>
         </div>
      </div>
	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
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

function zipcode() {//우편번호 검색창
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('MEM_ZIP').value = data.zonecode;
                document.getElementById("MEM_ADD1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("MEM_ADD2").focus();
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                alert("도로명 주소를 입력해주세요.");
            	return false;
            }
           
        }
    }).open();
}

$(document).ready(function() { //변경 버튼 클릭시
    $("#check").on("click", function(e) {
       e.preventDefault();
       fn_check();
    });
 });
 
 
 function fn_check(accountModifyForm) { //변경 버튼 클릭시(유효성검증, 데이터입력)
    var chk = $("input[name=agree_required]");

     if(!$("#MEM_NAME").val()){
        alert("이름을 입력해주세요.");
        $("#MEM_NAME").focus();
        return false;
     }

    if(!$("#MEM_BIRTH").val()){
        alert("생년월일을 입력해주세요.");
        $("#MEM_BIRTH").focus();
        return false;
     }

    var MEM_GEN = $('#MEM_GEN_M');
    
    if($(':radio[name="MEM_GEN"]:checked').length < 1){
        alert('성별을 선택해주세요');                        
        MEM_GEN.focus();
        return false;
    }
    if(!$("#MEM_EMAIL").val()){
       alert("이메일을 입력해주세요.");
       $("#MEM_EMAIL").focus();
       return false;
    }
    
    if(!$("#MEM_PHONE").val()){
        alert("휴대전화를 입력해주세요.");
        $("#MEM_PHONE").focus();
        return false;
     }

   
    if(!$("#MEM_ADD1").val()){
        alert("집주소 입력해주세요.");
        $("#MEM_ADD1").focus();
        return false;
     }
 
    var comSubmit = new ComSubmit("accountModifyForm");
    comSubmit.setUrl("<c:url value='/myPage/accountModify'/>");
    comSubmit.submit();
 }
 $("#accountModifyForm").on("submit",function(e){
 });


function back(){
	history.go(-1);
}
</script>
</body>
</html>