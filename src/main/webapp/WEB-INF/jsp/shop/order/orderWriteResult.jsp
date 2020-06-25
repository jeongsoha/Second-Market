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
	width: 100%;
	height: 200px;
	resize:none;
	margin-top: 20px;
	margin-bottom: 10px;
}
.text_type{
	width: 100%;
    height: 40px;
    font-size: 15px;
}
.box_notice{
	height: 90px;
    background-color: #c8f2a0;
    padding-top: 1px;
    width: 80%;
    margin-top: 20px;
    margin-left: 120px;
}
.div_dil{
	border-radius:20px;
	border: 2px solid #dfdfdf;
}
</style>
</head>
<body>
<div id="content">
	<div id="main-container">
	<div class="div_dil">
		<div class="box_notice">
			<h1 align="center">주문이 완료되었습니다.</h1>
		</div>
		<div style="text-align:center; padding: 20px;">
			<h2 style="color:#666; display:inline-block;">고객님의 주문번호는</h2>
			<h2 style="color:#E02F1B; display:inline-block;">${order.ORDERS_NUM}</h2>
			<h2 style="color:#666; display:inline-block;">입니다.</h2>
		</div>	
		<h4 align="center" style="padding-bottom: 20px; color: #888;">판매자의 주문 확인 후 발송됩니다. <br>주문내역 및 배송조회는 마이페이지에서 가능합니다.</h4>
	</div>
		<br>
		<table>
				<tr style="border-top: 2px solid #ccc;border-bottom: 1px solid #dfdfdf;">
					<th>상품정보</th>
					<td>${orderG.GOODS_TITLE}</td>
				</tr>
				<tr style="border-bottom: 1px solid #dfdfdf;">
					<th>구매일자</th>
					<td>${orderG.ORDER_TIME}</td>
				</tr>
				<tr style="border-bottom: 1px solid #dfdfdf;">
					<th>상품번호</th>
					<td>${orderG.GOODS_NUM}</td>
				</tr>
				<tr style="border-bottom: 1px solid #dfdfdf;">
					<th>결제금액</th>
					<td>${orderG.GOODS_PRICE}</td>
				</tr>
		</table>
		<br></br>
		<table>
				<tr style="border-top: 2px solid #ccc;border-bottom: 1px solid #dfdfdf;">
					<th>이름</th>
					<td colspan="2">${orderM.MEM_NAME}</td>
				</tr>
				<tr style="border-bottom: 1px solid #dfdfdf;">
					<th>휴대전화</th>
					<td colspan="2">${orderM.MEM_PHONE}</td>
				</tr>
				<tr style="border-bottom: 1px solid #dfdfdf;"> 
					<th>배송주소</th>
					<td>
						<input type="button" id="searchAddr" name="searchAddr" >
						${order.ORDERS_DADD1}
					</td>
					<td>
						<input type="button" id="searchAddr" name="searchAddr" >
						${order.ORDERS_DADD2}
					</td>
				</tr>

				<tr style="border-bottom: 1px solid #dfdfdf;">
					<th>배송 메모</th>
					<td colspan="2">${order.ORDERS_DMEMO }</td>
				</tr>
				<tr style="border-bottom: 1px solid #dfdfdf;">
					<th>결제수단</th>
					<td align="left" colspan="2">
						카카오페이 <input type="radio" id="ORDER_PAY" name="ORDER_PAY" value="kakaopay" checked="checked">
					</td>
				</tr>
		</table>
		<p align="center">
			<input type="button" id="main" name="main" value="메인으로" class="btn" style="height: 40px;">
			<input type="button" id="list" name="list" value="주문내역" class="btn" style="height: 40px;">
		</p>
	</div>
</div>
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

$(document).ready(function(){
	$("#list").on("click", function(e){ //목록으로 버튼
		e.preventDefault();
		fn_openGoodsList();
	});
	
	$("#main").on("click", function(e){ //수정하기 버튼
		e.preventDefault();
		fn_goMain();
	});
	
});

function fn_openGoodsList(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/myshop' />");
	comSubmit.submit();
}

function fn_goMain(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/shop/allGoodsList' />");
	comSubmit.submit();
}
</script>
</body>
</html>