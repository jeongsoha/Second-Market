<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
결제 성공 

결제일시:     [[${info.approved_at}]]<br/>
주문번호:    [[${info.partner_order_id}]]<br/>
상품명:    [[${info.item_name}]]<br/>
상품수량:    [[${info.quantity}]]<br/>
결제금액:    [[${info.amount.total}]]<br/>
결제방법:    [[${info.payment_method_type}]]<br/>
</body>


<script type="text/javascript">
	window.opener.document.getElementById("check").value = 'true';
   	//window.opener.location.reload();
   	alert("결제가 완료되었습니다. 다시한번 하단의 주문하기 버튼을 눌러주세요.");
    window.close();

</script>
</html>