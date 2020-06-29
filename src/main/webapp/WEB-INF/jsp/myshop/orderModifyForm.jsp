<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<meta charset="UTF-8">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
th {
	height: 50px;
	width: 18%;
	padding-right: 20px;
	text-align: right;
    background-color: #f6f6f6;
} 
td {
	padding-left: 20px;
}
.area{
	width: 980px;
	height: 200px;
	resize:none;
	margin-top: 20px;
	margin-bottom: 10px;
}
.text_type{
	width: 500px;
    height: 40px;
    font-size: 15px;
}

</style>
</head>
<body>
<form id="orderModifyForm" method="post">

			<table>
				<tr style="border-top: 2px solid #ccc;border-bottom: 1px solid #dfdfdf;">
					<th>이름</th>
					<td>${map.MEM_NAME}</td>
				</tr>
				<tr style="border-bottom: 1px solid #dfdfdf;">
					<th>휴대전화</th>
					<td><input type="text" id="ORDERS_PHONE" name="ORDERS_PHONE" value="${map.ORDERS_PHONE}" class="text_type"></td>
				</tr>
				<tr style="border-bottom: 1px solid #dfdfdf;">
					<th>배송주소</th>
					<td style="padding: 5px;padding-left: 20px;"> 
						<input type="text"  id="MEM_ZIP" name="MEM_ZIP" class="text_type" placeholder="우편번호" readonly>
						<input type="button" id="searchAddr" name="searchAddr"  onclick="zipcode()" value="우편번호 찾기"><br/>
						 <input type="text" id="ORDERS_DADD1" name="ORDERS_DADD1" value="${map.ORDERS_DADD1}" readonly class="text_type"><br/>
						 <input type="text" id="ORDERS_DADD2" name="ORDERS_DADD2" value="${map.ORDERS_DADD2}" class="text_type"> 
					</td>
				</tr>
				<tr style="border-bottom: 1px solid #dfdfdf;">
					<th>배송 메모</th>
					<td><div><textarea id="ORDERS_DMEMO" name="ORDERS_DMEMO" class="area">${map.ORDERS_DMEMO}</textarea></div></td>
				</tr>
			</table>
			<br>
		<p align="center">
		
		
			<input type="button" class="btn" value="수정하기" style="width:100px; height:60px;" onclick="fn_check();" >
			<input type="button" class="btn" value="취소하기" style="width:100px; height:60px;" onclick="back();">
		</p>
		<!-- <input type="hidden" id="ORDERS_NUM" name="ORDERS_NUM" value="${map.ORDERS_NUM}" /> -->
	</form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

function noEvent() { // 새로 고침 방지 적용
    if (event.keyCode == 116) {
        alert("새로고침을 할 수 없습니다.");
        event.keyCode = 2;
        return false;
    } else if (event.ctrlKey
            && (event.keyCode == 78 || event.keyCode == 82)) {
        return false;
    }
}
document.onkeydown = noEvent;


$(document).ready(function() { //변경 버튼 클릭시
    $("#check").on("click", function(e) {
       e.preventDefault();
       fn_check();
    });
 });
 
 
 function fn_check(orderModifyForm) { 


	 if(!$("#ORDERS_PHONE").val()){
         alert("받는 분의 연락처를 입력해주세요.");
         $("#ORDERS_PHONE").focus();
         return false;
     }
     if(!$("#ORDERS_DADD1").val()){
         alert("배송지를 입력해주세요.");
         $("#ORDERS_DADD1").focus();
         return false;
     }
     if(!$("#ORDERS_DADD2").val()){
         alert("상세 배송주소를 입력해주세요.");
         $("#ORDERS_DADD2").focus();
         return false;
     }
     if(!$("#ORDERS_DMEMO").val()){
         alert("배송 메세지를 입력해주세요.");
         $("#ORDERS_DMEMO").focus();
         return false;
     }

 
    var comSubmit = new ComSubmit("orderModifyForm");
    comSubmit.setUrl("<c:url value='/myshop/orderModify'/>");
  
    comSubmit.addParam("ORDERS_NUM", ${map.ORDERS_NUM});
	
    comSubmit.submit();
 }
 $("#orderModifyForm").on("submit",function(e){
 });



 function back(){
 	history.go(-1);
 }

 
function zipcode() {//우편번호 검색창
	new daum.Postcode({
	oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        popupName: 'postcodePopup' // 팝업창 여러개 생성방지
        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
          
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('MEM_ZIP').value = data.zonecode;
            document.getElementById("ORDERS_DADD1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("ORDERS_DADD2").focus();
           
            
        } else if (data.userSelectedType === 'J'){ // 사용자가 지번 주소를 선택했을 경우(J)
        	 
             alert("도로명 주소를 입력해주세요.");
        	return false;
        }  
    }
  	  }).open();
	  
	}

	
	/* 
	function popup(){
		var url = "/second/kakaoPay";
		console.log(document.getElementById("GOODS_TCOST").value);
		var param = "?orderNum="
				  + document.getElementById("orderNumber").value
				  + "&goodsTcost="
				  + document.getElementById("GOODS_TCOST").value
				  + "&itemName="
				  + document.getElementById("item_name").value
				  + "&memID="
				  + document.getElementById("MEM_ID").value;
				  
		openWin = window.open(url+param, "childForm", "width=570, height=550, resizable = no, scrollbars = no");
	} */
	
	

</script>


</body>
</html>