<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="EUC-KR">

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
</style>
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<style>
td {
	font-size:15px;
	text-align: center;
}

table {
	border-color: #dfdfdf;
	
}



</style>
<title>문의 답글 등록</title>
</head>
<body>
	<table border="1" bordercolor="#dfdfdf">
		<tr style="height: 70px;">
		<td style="width:150px">${cMap.MEM_ID }</td>
			<td colspan="2" style="width:250px">${cMap.COMMENTS_DATE }</td>
			
			<c:choose> 
				<c:when test="${cMap.COMMENTS_REPLY == 'N'}">
					<td style="width:100px">답변대기</td>
				</c:when>
				<c:when test="${cMap.COMMENTS_REPLY == 'Y'}">
					<td style="width:100px">답변완료</td>
				</c:when>
			</c:choose>

		</tr>
		<tr>

			<td colspan="3" style="height:200px; background-color: #f6f6f6; text-align: left; padding-left: 30px;"> 
				<div style="border:1px solie red;"> ${cMap.COMMENTS_CONTENT}
				</div>	
			</td>

			
			<td>
				<a href="#this" id="cDelete" name="cDelete" style="font-size: 15px;">문의삭제 
				<input type="hidden" id="COMMENTS_NUM" name="COMMENTS_NUM" value="${cMap.COMMENTS_NUM }">
				<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${cMap.COMMENTS_PARENT }">
				</a>
			</td>
		</tr>
		<tr></tr>
	</table>
	<br></br>
	<table>
		<c:choose> 
			<c:when test="${cMap.COMMENTS_REPLY == 'N' && session_MEM_INFO.MEM_ID == G_MEM_ID}" >
				<form id="frm" name="frm">

					<tr style="height: 70px;">
						<td style="width: 180px;">${session_MEM_INFO.MEM_ID}</td>
						<td style="height:150px;text-align: left;"><textarea name='COMMENTS_CONTENT' id='COMMENTS_CONTENT' rows='5' cols='120' style='resize: none;'></textarea></td>
						<td style="text-align: right;"><a href="#this" id="rcWrite" name="rcWrite" class="btn">답글등록</a>
							<input type="hidden" id="COMMENTS_TYPE" name="COMMENTS_TYPE" value="1">
							<input type="hidden" id="COMMENTS_PARENT" name="COMMENTS_PARENT" value="${cMap.COMMENTS_PARENT }">
							<input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_INFO.MEM_ID }">
							<input type="hidden" id="COMMENTS_RNUM" name="COMMENTS_RNUM" value="${cMap.COMMENTS_NUM }">
						</td>
					</tr>
				</form>
			</c:when>
		</c:choose>
	</table>
	<table border="1" bordercolor="#dfdfdf">
		<c:choose>
			<c:when test="${cMap.COMMENTS_REPLY == 'Y'}">
	      		<tr style="height: 70px;">
					<td style="width: 150px; width: 390px;">답변 : ${rMap.MEM_ID}</td>
					<td colspan="2">${rMap.COMMENTS_DATE}</td>
					
					<td style="width: 260px;">
					<c:if test="${session_MEM_INFO.MEM_ID == G_MEM_ID}">
						<a href="#this" id="rcDelete" name="rcDelete">답글삭제
						<input type="hidden" id="REPLY_NUM" name="REPLY_NUM" value="${rMap.COMMENTS_NUM }">
						<input type="hidden" id="COMMENTS_RNUM" name="COMMENTS_RNUM" value="${cMap.COMMENTS_NUM }">
						<input type="hidden" id="G_MEM_ID" name="G_MEM_ID" value="${G_MEM_ID }">
						</a>
					</c:if>
					</td>
					
				</tr>
				<tr style="background-color: #f6f6f6;">
					<td colspan="4" style="height:150px; text-align: left; padding-left: 30px;">${rMap.COMMENTS_CONTENT}</td>
				</tr>
			</c:when>
		</c:choose>
	</table>
	
	
	<div align="center" style="margin: 20px;">
		<a href="#this" id="goGoodsDetail" name="goGoodsDetail" class="btn" style="width: 180px;">상품페이지로 이동
		<input type="hidden" id="H_GOODS_NUM" name="H_GOODS_NUM" value="${cMap.COMMENTS_PARENT }">
		</a>
	</div>
</body>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){ 
			$("#goGoodsDetail").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_goGoodsDetail();
			});
			
			$("#rcWrite").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_replyWriteComment();
			});
			$("#cDelete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteComment();
			});
			$("#rcDelete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deletereplyComment();
			});
		});

		function fn_goGoodsDetail(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail'/>");
			comSubmit.addParam("GOODS_NUM", $("#H_GOODS_NUM").val());
			comSubmit.submit();
		}
		
		function fn_replyWriteComment(){
			var comSubmit = new ComSubmit("frm");

			var idq = "${cMap.MEM_ID }"; // (유진 추가) 상품 답글 알람을 위한 변수
			
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/commentReplyWrite'/>");
			comSubmit.addParam("COMMENTS_NUM", $("#COMMENTS_NUM").val());
			comSubmit.addParam("G_MEM_ID", "${G_MEM_ID}");
			comSubmit.addParam("idq",idq);//(유진 추가)댓글 쓴이가 알람을 받기위해 넣는다
			
			
			// 댓글 내용 필요
	         if(!$("#COMMENTS_CONTENT").val()){
	             alert("내용를 입력해주세요.");
	             $("#COMMENTS_CONTENT").focus();
	             return false;
	         }
			
			comSubmit.submit();
		}
		
		function fn_deleteComment(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/commentDelete'/>");
			comSubmit.addParam("COMMENTS_NUM", $("#COMMENTS_NUM").val());
			comSubmit.addParam("GOODS_NUM", $("#GOODS_NUM").val());
			comSubmit.submit();
		}
		
		function fn_deletereplyComment(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/commentReplyDelete'/>");
			comSubmit.addParam("REPLY_NUM", $("#REPLY_NUM").val());
			comSubmit.addParam("COMMENTS_RNUM", $("#COMMENTS_RNUM").val());
			comSubmit.addParam("G_MEM_ID", "${G_MEM_ID}");
			comSubmit.submit();
		}
	</script>
</html>




