<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
               <h2 class="card-title text-center" style="color:#113366;"><img src="/nnS/resources/images/mypage_infochange.png"></h2>
            </div>
            <form id="accountModifyForm" method="post">
            <div class="card-body">
            	
              <img src="/nnS/resources/images/mypage_id.png"> <div class="form-control">${map.MEM_ID } </div><br>
               <img src="/nnS/resources/images/mypage_name.png"> <div class="form-control">${map.MEM_NAME } </div><br>
			   <img src="/nnS/resources/images/mypage_birth.png"><div class="form-control">생년월일 ${map.MEM_BIRTH }</div><br>
			  <img src="/nnS/resources/images/mypage_gen.png"><div class="form-control">${map.MEM_GEN }</div><br>
			   <img src="/nnS/resources/images/mypage_email.png"><input type="text" id="MEM_EMAIL" name="MEM_EMAIL" class="form-control" placeholder="${map.MEM_EMAIL }"><br>
		       <img src="/nnS/resources/images/mypage_phone.png"><input type="text" id="MEM_PHONE" name="MEM_PHONE" class="form-control" placeholder="${map.MEM_PHONE }"><br>
			   <img src="/nnS/resources/images/mypage_zip.png"><input type="text" id="MEM_ZIP" name="MEM_ZIP" class="form-control" placeholder="${map.MEM_ZIP }"><br>
			   		 <input type="button" onclick="zipcode()" value="우편번호 찾기"><br>
			   <img src="/nnS/resources/images/mypage_add.png"><input type="text" id="MEM_ADD1" name="MEM_ADD1" class="form-control" placeholder="${map.MEM_ADD1 }"><br>
			   <img src="/nnS/resources/images/mypage_add2.png"><input type="text" id="MEM_ADD2" name="MEM_ADD2" class="form-control" placeholder="${map.MEM_ADD2 }"><br>	
            </div>
         
            <div class="card-body">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="수정하기" onclick="fn_check();" style="background-color:#26a69a;">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="취소" onclick="back();" style="background-color:#26a69a;">
				<span id="pwc"></span>
				<br>
            </div>
            </form>
         </div>
         </div>
      </div>
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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

    if(!$("#MEM_ZIP").val()){
        alert("우편번호를 입력해주세요.");
        $("#MEM_ZIP").focus();
        return false;
     }
    if(!$("#MEM_ADD1").val()){
        alert("집주소 입력해주세요.");
        $("#MEM_ADD1").focus();
        return false;
     }
    if(!$("#MEM_ADD2").val()){
        alert("상세주소를 입력해주세요.");
        $("#MEM_ADD2").focus();
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