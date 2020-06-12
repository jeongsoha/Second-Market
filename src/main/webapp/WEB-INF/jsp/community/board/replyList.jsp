<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<table style="width:700px"> 
<!-- 댓글 목록 -->
<c:forEach var="row" items="${list}">
<tr>
<td>
${row.userName}(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
<br>
${row.replytext}
<hr>
</td>
</tr>
</c:forEach>

<!-- 페이징 처리 -->
<tr>
<td>
<!-- 현재 페이지 블럭이 1보다 크면 처음으로 이동 -->
<c:if test="${replyPager.curBlock>1}">
<a href ="javascript:list:Reply('1')">[처음]</a>
</c:if>
<!-- 현재 페이지 블럭이 1보다 크면 이전 페이지 블럭으로 이동 -->
<c:if test="${replyPager.curBlock >1}">
<a href="javascript:listReply('${replyPager.prevPage}')">[이전]</a>
</c:if>
<!-- 페이지 블럭 처음부터 마지막 블럭까지 1씩 증가 하는 페이지  -->
<c:forEach var="num" begin="${replyPager.blockGegin}"
	end="${replyPager.blockEnd}">
	<c:choose>
	<c:when test="${num==replyPager.cuePage}">
	${num}&nbsp;
	</c:when>
	<c:otherwise>
	<a href ="javascript:listReply('${num}')">${num}</a>&nbsp;
	</c:otherwise>
	</c:choose>
	</c:forEach>
	
	<!-- 현재 페이지 블러기 전체 페이지 블럭보다 작거나 같으면 다음페이로 이동  -->
	<c:if test="${replyPager.curBlock <= replyPager.totBlock}">
	<a href ="javascript:listReply('${replyPager.totPage}')">[끝]</a>
	</c:if>
	</td>
	</tr>

</table>

</body>
</html>