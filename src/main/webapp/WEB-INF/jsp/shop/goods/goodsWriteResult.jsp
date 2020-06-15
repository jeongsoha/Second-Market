<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<style type="text/css">
#main-container
{
   min-height: 400px;
   margin: 0 0 0 125px;
   padding: 20px;
   background-color: #fff;

}
</style>
<body>
<div id="content">

	<div id="main-container">
      <h1 align="center"> 상품 등록이 완료되었습니다.</h1>
      <br/><br/>
      <p align="center">
        <a href="#this" class="btn" name="goods" id="goods">상품으로</a>
		<a href="#this" class="btn" id="list">목록으로</a>

	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	
	$("a[name='goods']").on("click", function() { //제목 
		fn_goodsDetail($(this));
	});
	
	$("#list").on("click", function(){ //목록으로 버튼
		fn_openGoodsList();
	});
	/* 
	$(document).on("click", "[id=='list']", function () {
		e.preventDefault();
		fn_openGoodsList();
	});
	 */
});	
	
	
	function fn_openGoodsList(){
		console.log("???????")
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/shop/allGoodsList' />");
		comSubmit.submit();
	}
	
	function fn_goodsDetail(obj) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/shop/goodsDetail' />");
		comSubmit.addParam("GOODS_NUM", "${IDX}");
		comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
		comSubmit.submit();
	}
	
</script>
</body>
</html>