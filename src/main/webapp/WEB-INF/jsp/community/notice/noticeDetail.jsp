<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
</head>
<body>
<div id="content">
	<div id="vertical_tab-container">
	<ul>
		<li class="selected"><a href="noticeList"><img src="./../resources/images/tab_notice.png" width="100" height="30"></a></li>
         <li><a href="boardList"><img src="./../resources/images/tab_board.png" width="100" height="30"></a></li>
         <li><a href="reportList"><img src="./../resources/images/tab_report.png" width="100" height="30"></a></li>
         <li><a href="qnaList"><img src="./../resources/images/tab_qna.png" width="100" height="30"></a></li>
	</ul>
	</div>
	<div id="main-container">
		<img src="./../resources/images/form_t3.png" width="100" height="30">
	<table border="1" align="center" class="tbl_type">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption><h2>공지사항</h2></caption>
		<tbody>
			<tr>
				<th scope="row"><img src="./../resources/images/commu_num.png" height="25"></th>
				<td>${map.NOTICE_NUM }
				<input type="hidden" id="NOTICE_NUM" name="NOTICE_NUM" value="${map.NOTICE_NUM }"></td>
				<th scope="row"><img src="./../resources/images/commu_hit.png" height="25"></th>
				<td>${map.NOTICE_COUNT }</td>
			</tr>
			<tr>
				<th scope="row"><img src="./../resources/images/commu_writer.png" height="25"></th>
				<td>관리자</td>
				<th scope="row"><img src="./../resources/images/commu_date.png" height="25"></th>
				<td>${map.NOTICE_DATE }</td>
			</tr>
			<tr>
				<th scope="row"><img src="./../resources/images/commu_title.png" height="25"></th>
				<td colspan="3">${map.NOTICE_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4" height="600px" style="vertical-align:top;"><pre style="overflow:hidden;  white-space: pre-wrap">${map.NOTICE_CONTENT }</pre></td>
			</tr>
		</tbody>
	</table>
	<div align="center">
		<a href="#this" class="btn" id="list"><button class="bttn-bordered bttn-xs bttn-primary">목록으로</button></a>
		<c:if test="${session_MEM_ID == 'admin' }">
		<a href="#this" class="btn" id="modify"><button class="bttn-bordered bttn-xs bttn-primary">수정하기</button></a>
		<a href="#this" class="btn" id="delete"><button class="bttn-bordered bttn-xs bttn-primary">삭제하기</button></a>
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


















