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

</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/include/include-body.jspf" %>


<div id="content">
	<form  method="post" id="frm" name="frm" enctype="multipart/form-data" onsubmit="return formCheck();">
	<h1 align="center">주문</h1>
	
	<div>
			<table border="1">
				<tr>
					<th style="width: 16.6667%;">상품정보</th>
					<th style="width: 16.6667%;">주문일자</th>
					<th style="width: 16.6667%;">주문번호</th>
					<th style="width: 16.6667%;">구매수량</th>
					<th style="width: 16.6667%;">최종 결제금액</th>
				</tr>
				<tr>
					<td style="width: 16.6667%;">${orderG.GOODS_TITLE}</td>
					<td style="width: 16.6667%;">${orderG.ORDER_TIME}</td>
					<td style="width: 16.6667%;">${orderG.GOODS_NUM}</td>
					<td style="width: 16.6667%;">${orderG.GOODS_PRICE}</td>
					<td style="width: 16.6667%;">${orderG.GOODS_PRICE}</td>
				</tr>
				<tr>
					<th>
						이름
					</th>
					<th>
						휴대전화
					</th>
					<th colspan="5">
						배송주소
					</th>
				</tr>
				<tr>
					<td>
						<input type="text" id="MEM_NAME" name="MEM_NAME" value="${orderM.MEM_NAME}">
					</td>
					<td>
						<input type="text" id="MEM_PHONE" name="MEM_PHONE" value="${orderM.MEM_PHONE}">
					</td>
					<td> 
						우편번호 <input type="text">
						<input type="button" id="searchAddr" name="searchAddr" value="우편번호 찾기"><br/>
						<input type="text" id="ADD1" name="ADD1" size="50" value="">
					</td>
					<td> 
		 <input type="text" id="searchAddr" name="searchAddr" style="width:90%;">
           <input type="button" onclick="zipcode()" value="주소 찾기"><br>
      
					</td>
				</tr>
				<tr>
					<th>
						배송 메모
					</th>
				</tr>
				<tr>
					<th>
						<textarea id="DMEMO" name="DMEMO"></textarea>
					</th>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_ID}">
						<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${orderG.GOODS_NUM}"/>
						<input type="hidden" id="GOODS_PRICE" name="GOODS_PRICE" value="${orderG.GOODS_PRICE}"/>
						<input type="hidden" id="orderNumber" name="orderNumber" value="${orderG.GOODS_NUM}" />
						<input type="hidden" id="GOODS_TCOST" name="GOODS_TCOST" value="${orderG.GOODS_PRICE+orderG.GOODS_DCOST}" />
						<input type="hidden" id="item_name" name="item_name" value="${orderG.GOODS_TITLE}"/>
					</td>
				</tr>
				<tr>
					<th>
						결제수단
					</th>
					<td>
					무통장 / 카드 / 계좌이체 </br> 	
					카카오페이 <input type="radio" id="ORDER_PAY" name="ORDER_PAY" value="kakaopay" checked="checked">
					</td>
					<th>
						결제확인
					</th>
					<td>
						 <input type="hidden" id="check" name="check"/>
						 <div id="test"></div>
						 <script type="text/javascript">
						 if(document.getElementById("check").value == "true"){
							 $("#test").append("결제가 완료되었습니다.");
						 }else{
							 $("#test").append("결제를 먼저 진행해주세요.<a href='#this' class='btn' id='pay_btn'><button class='bttn-bordered bttn-xs bttn-primary'>결제하기</button></a>"); 
						 }
						 </script>
					</td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<th> 
						개인정보 제 3자 제공 동의(필수)
					</th>
				</tr>
				<tr>
						<td>
							<textarea>
세컨드샵 구매회원 약관 동의
1. 회원의 주소 또는 e-mail주소에 도달함으로써 회사의 통지는 유효하고, 회원 정보의 변경/미변경에 대한 책임은 회원에게 있음. (제8조)
2. 약관이 정하는 부정거래 행위를 한 회원에 대하여 제재 조치 가능 예: 직거래, 경매 부정행위, 시스템 부정행위, 결제 부정행위, 재판매 목적의 거래행위 등. (제36조)
3. 세컨드샵은 통신판매중개자로서 판매자와 구매자와의 거래에 관한 분쟁에 개입하지 않으며 어떠한 보증 및 책임도 부담하지 않음. (제6조, 제38조)

전자금융거래 약관 동의
1. 접근매체의 양도∙양수, 대여∙사용위임, 질권설정 기타 담보 제공 및 이의 알선과 접근매체를 제3자에게 누설∙노출, 방치하는 것은 금지됨. (제17조, 제21조, 제23조)
2. 소비자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 통보하지 않는 경우 소비자의 동의 없이 판매자에게 결제대금을 지급할 수 있으며, 회사가 결제대금을 지급하기 전에 소비자가 그 결제대금을 환급 받을 사유가 발생한 경우 이를 소비자에게 환급함. (제19조)
3. 이용자의 선불전자지급수단 잔액이 구매 취소 등의 사유 발생으로 회사가 이용자로부터 환수해야 하는 환수대상액보다 작을 경우 회사는 당해 이용자의 선불전자지급수단을 마이너스로 처리할 수 있음. (제27조)
							</textarea>
						</td>
				</tr>
				<tr>
					<td>
						상기 내용을 확인하였으며 이에 동의합니다.
						<input type="checkbox" id="terms" name="terms">
					</td>
				</tr>	
		</table>
		<p align="right">
			<a href="#this" class="btn" id="submitPay"><button class="bttn-bordered bttn-xs bttn-primary">주문하기</button></a>
		</p>
	</div>
	</form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	$("#pay_btn").on("click", function(e) { // 결제하기 버튼
		e.preventDefault();
		if(fn_formCheck()){
			if(document.getElementById("check").value == "true"){
				alert("이미 결제가 완료되어 주문확인 창으로 이동합니다.");
				fn_orderPay($(this));	
			}else{
				alert("결제가 완료되지 않아 결제창으로 이동됩니다.");
				fn_orderPay($(this));	
				//popup($(this));
			}
		}
	});
	
	$("#submitPay").on("click", function(e) { // 결제하기 버튼
		e.preventDefault();
		if(fn_formCheck()){
			if(document.getElementById("check").value == "true"){
				alert("결제가 완료되어 주문서 확인 창으로 이동됩니다.");
				fn_orderPay($(this));	
			}else{
				alert("결제가 완료되지 않아 결제창으로 이동됩니다.");
				fn_orderPay($(this));	
				//popup($(this));
			}
		}
	});
	
	
	function fn_orderPay() {
		var comSubmit = new ComSubmit("frm");
		var ORDERS_NUM = "${order.ORDERS_NUM}";
		comSubmit.setUrl("<c:url value='/shop/order/orderWrite' />");
		//comSubmit.setUrl("<c:url value='/kakaoPay' />");
		comSubmit.addParam("ORDERS_NUM", ORDERS_NUM);
		comSubmit.submit();	
		}
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

	function fn_formCheck() {
        if(!$("#MEM_ID").val()){
            alert("받는 분의 성함을 입력해주세요.");
            $("#MEM_ID").focus();
            return false;
        }
        if(!$("#MEM_PHONE").val()){
            alert("받는 분의 연락처를 입력해주세요.");
            $("#MEM_PHONE").focus();
            return false;
        }
        if(!$("#ADD1").val()){
            alert("배송지를 입력해주세요.");
            $("#ADD1").focus();
            return false;
        }
        if(!$("#DMEMO").val()){
            alert("배송 메세지를 입력해주세요.");
            $("#DMEMO").focus();
            return false;
        }
        if(!$("#terms:checked").val()){
            alert("동의여부를 확인해주세요.");
            $("#terms").focus();
            return false;
        }
	    
	    return true;
		}
	
	var openWin;
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
	
	
	
	
 	function popup(){ 
	    var IMP = window.IMP; // 생략가능
	    IMP.init('imp07872997'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	    IMP.request_pay({
	        pg : 'kakao',
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : '주문명:결제테스트',
	        amount : Number(document.getElementById("GOODS_TCOST").value),
	        buyer_email : 'iamport@siot.do',
	        buyer_name : $("#MEM_ID").val(),
	        buyer_tel : $("#MEM_PHONE").val(),
	        buyer_addr : $("#ADD1").val(),
	        buyer_postcode : '123-456',
	        m_redirect_url : '/second/payEnd.action'	// 결제 완료 후 보낼 컨트롤러의 메소드명
	    }, function(rsp) {
	        if ( rsp.success ) { // 성공시
	            var msg = '결제가 완료되었습니다.';
	            msg += '고유ID : ' + rsp.imp_uid;
	            msg += '상점 거래ID : ' + rsp.merchant_uid;
	            msg += '결제 금액 : ' + rsp.paid_amount;
	            msg += '카드 승인번호 : ' + rsp.apply_num;
	            document.getElementById("check").value = "true"
	        } else {	 // 실패 시
	            var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	        }

	        alert(msg);
	    });
	};
	
	

</script>


</body>
</html>