<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>

<meta charset="UTF-8">
<style type="text/css">
#orderDetail-1{
  height:80px;
border:7px solid #ccc;
font-size: 22px;
word-spacing :50px;
padding-left:2em;
/*padding-top:15px;*/
}

#orderDetail-1-1{
/*border:1px solid black;*/
width: 70%;
float:left;
padding-top:15px;
}

#orderDetail-1-btn{
/*border:1px solid black;*/
width: 30%;
float:right;

}

#orderDetail-2{

border:0px solid #ccc;

}
table{
border:0px solid #ccc;
font-size: 22px;

}
th,tr,td{
border:0px solid #ccc;
 height:80px;
  /*background-color:#00ff33;*/
}

#th-solid{
border-top:5px solid black;
border-bottom:1px solid #ccc;

 height:80px;
}
#td-solid{
border-top:5px solid black;
border-bottom:1px solid #ccc;
 height:80px;
  width: 290px;
 
}
#solid-bottom{
border-bottom:1px solid #ccc;

}
h1{
 font-weight: 900;
}
/*img{
max-width:200px;
max-height:160px;
}
*/
</style>
<title>주문 상세정보</title>
</head>
<body>
<%@ include file="/WEB-INF/include/include-body.jspf" %>

<br>
<h1>주문 상세정보</h1><br>
<div id="orderDetail-1">
<div id="orderDetail-1-1">주문일자   ${map.ORDERS_DATE} | 주문번호        ${map.ORDERS_NUM} 
</div> 
<div id="orderDetail-1-btn"><button href="#this" class="btn pull-right" id="list" ><b>목록으로</b></button>
</div>
</div>
<br>
<br>
<div id="orderDetail-2">

<table>
<tr>
<!--<c:forTokens items="${map.GOODS_CONTENT }" delims="<p>" var="item" end="1">
<th rowspan="2"><a href="#this" name="title"><${item} max-width:200px; max-height:160px;></a></th>
</c:forTokens>-->
<c:choose>
							<c:when test="${map.GOODS_THUMBNAIL eq null}">
								<th rowspan="2"><a href="#this" name="title"><img alt="" style="width:200px; height:160px; padding:10px 10px 10px 10px;" src=<c:url value="/resources/images/no_image.png"/>></a></th>
							</c:when>
							<c:otherwise>
								<th rowspan="2"><a href="#this" name="title"><img alt="" style="width:200px; height:160px; padding:10px 10px 10px 10px;" src="${path}${map.GOODS_THUMBNAIL}"></a></th>
							</c:otherwise>
						</c:choose>
<th >상품번호</th>
<th >상품명</th>
<th >상품가격</th>
<th >상품거래지역</th>
</tr>
<tr>
<td><a href="#this" name="title">${map.GOODS_NUM}</a></td>
<td><a href="#this" name="title">${map.GOODS_TITLE}</a></td>
<td><fmt:formatNumber value="${map.GOODS_PRICE}" pattern="#,###"/>원</td>
<td>${map.GOODS_REGION}</td>
</tr>
</table>
</div>
<br>
<br>
<div >
<h1>판매자 정보</h1><br>
<table>

<tr>
<th id="th-solid">판매자ID</th>
<th id="th-solid">판매자 이름</th>
<th id="th-solid">판매자 이메일</th>
<th id="th-solid">판매자 연락처</th>
</tr>
<tr>
<td id="solid-bottom">${map.MEM_ID}</td>
<td id="solid-bottom">${map.MEM_NAME}</td>
<td id="solid-bottom">${map.MEM_EMAIL}</td>
<td id="solid-bottom">${map.MEM_PHONE}</td>
</tr>
</table>
</div>
<br>
<br>
<div id="orderDetail-2">
<h1>결제금액/배송지 정보</h1><br>
<table>
<tr>
<th id="th-solid">구매자ID</th><td id="td-solid">${map.ORDERS_ID}</td>
<th id="th-solid">구매자 이름</th><td id="td-solid">${map.ORDERS_NAME}</td>
<th id="th-solid">구매자 연락처</th><td id="td-solid">${map.ORDERS_PHONE}</td>
</tr>

<tr>
<th id="solid-bottom">배송주소</th>
<td id="solid-bottom" colspan="3" >${map.ORDERS_DADD1}</td>
<td id="solid-bottom" colspan="2">${map.ORDERS_DADD2}</td>
</tr>
<tr>
<th id="solid-bottom">배송메모</th><td id="solid-bottom" colspan="5" > ${map.ORDERS_DMEMO} </td>
</tr>
<tr>
<th id="solid-bottom" >송장번호  </th><c:choose>
	<c:when test="${map.ORDERS_DELE_NUM != null}"><td id="solid-bottom">${map.ORDERS_DELE_NUM}</td>
	</c:when>
		<c:otherwise>
		<td id="solid-bottom" >배송 준비 중 입니다.</td>
		</c:otherwise>
		</c:choose><th id="solid-bottom" >결제수단</th><td id="solid-bottom"> ${map.ORDERS_PAY}</td><th id="solid-bottom">결제금액</th><td id="solid-bottom"><fmt:formatNumber value="${map.ORDERS_PRICE}" pattern="#,###"/>원</td>
</tr>


</table>
<c:choose>
	<c:when test="${map.ORDERS_DELE_NUM == null && session_MEM_ID == map.ORDERS_ID}">
<button href="#this" class="btn pull-right" id="orderUpdate" ><b>배송지변경</b></button>

</c:when>
<c:otherwise>
		</c:otherwise>
		</c:choose>
</div>

</body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ 
				e.preventDefault();
				fn_myshopList();
			});

			$("a[name='title']").on("click", function(e) { 
				e.preventDefault();
				fn_goodsDetail($(this));
			});

			$("#orderUpdate").on("click", function(e){ 
				e.preventDefault();
				fn_orderModifyForm($(this));
			});
			
	});
		
		function fn_myshopList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myshop' />");
			comSubmit.submit();
		}
		function fn_goodsDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail' />");
			comSubmit.addParam("GOODS_NUM", ${map.GOODS_NUM});
			
			comSubmit.submit();
		}
		function fn_orderModifyForm(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myshop/MyOrderInfo' />");
			comSubmit.addParam("ORDERS_NUM", ${map.ORDERS_NUM});
			
			comSubmit.submit();
		}
		
	</script>
</html>