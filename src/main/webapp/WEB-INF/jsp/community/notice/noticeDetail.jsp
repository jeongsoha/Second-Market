<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">

<style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

#main-container{
   width:1100px;
   align:center;
   font-family: 'Nanum Gothic';
	font-size:15px;
}

#content{
	width:1120px;
	margin-left:50px;
}

button {
  background:none;
  border:0;
  outline:0;
  cursor:pointer;
}
.tab_menu_container {
  display:flex;
}
.tab_menu_btn {
  width:80px;
  height:40px;
  transition:0.3s all;
}
.tab_menu_btn.on {
  border-bottom:2px solid #df0000;
  font-weight:700;
  color:#df0000;
}
.tab_menu_btn:hover {
  color:#df0000;
}
.tab_menu_container{
	float:right;
	font-family: 'Nanum Gothic';
	margin-bottom:50px;
}

</style>

</head>
<body>
<div id="content">
	
  <div class="tab_wrap">
  <div class="tab_menu_container">
    <a href="noticeList"><button class="tab_menu_btn on" type="button">공지사항</button></a>
    <a href="boardList"><button class="tab_menu_btn" type="button">자유게시판</button></a>
    <a href="reportList"><button class="tab_menu_btn" type="button">신고게시판</button></a>
    <a href="qnaList"><button class="tab_menu_btn" type="button">Q&A게시판</button></a>
  </div>
  </div>
	<div id="main-container">
		<h2>게시글보기</h2>
	<table align="center" class="table table-condensed">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption><h2>공지사항</h2></caption>
		<tbody>
			<tr>
				<th style=text-align:center; scope="row">글번호</th>
				<td>${map.NOTICE_NUM }
				<input type="hidden" id="NOTICE_NUM" name="NOTICE_NUM" value="${map.NOTICE_NUM }"></td>
				<th style=text-align:center; scope="row">조회수</th>
				<td>${map.NOTICE_COUNT }</td>
			</tr>
			<tr>
				<th style=text-align:center; scope="row">작성자</th>
				<td>관리자</td>
				<th style=text-align:center; scope="row">작성일</th>
				<td>${map.NOTICE_DATE }</td>
			</tr>
			<tr>
				<th style=text-align:center; scope="row">제목</th>
				<td colspan="3">${map.NOTICE_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4" height="auto" style="vertical-align:top;"><pre style="overflow:hidden;  white-space: pre-wrap">${map.NOTICE_CONTENT }</pre></td>
			</tr>
		</tbody>
	</table>
	<div align="right">
		<a href="#this" id="list"><button class="btn">목록으로</button></a>
	  <c:if test="${session_MEM_ID == 'admin' }">  
 		<a href="#this" id="modify"><button class="btn">수정하기</button></a>
		<a href="#this" id="delete"><button class="btn">삭제하기</button></a>
		</c:if>
	</div>
	</div>
	</div>
	
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#modify").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openBoardModify();
			});
		
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/noticeList' />");
			comSubmit.submit();
		}
		
		function fn_openBoardModify(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/noticeModifyForm' />")
			comSubmit.addParam("NOTICE_NUM", $("#NOTICE_NUM").val());
			comSubmit.submit();
		}
	
		function fn_deleteBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/noticeDelete' />");
			comSubmit.addParam("NOTICE_NUM", $("#NOTICE_NUM").val());
			comSubmit.submit();
		}
	</script>
</body>
</html>


















