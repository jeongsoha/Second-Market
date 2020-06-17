<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">

<style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
body {
    margin: 0;
    padding: 0;
}
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

.an_style{
    width: 90px;
    height: 30px;
    border: 1px solid #000;
    text-align: center;
    background-color: #e7e7e7;
    border-radius: 5px;
    color: #000;
    padding-top: 3px;
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
    <a href="noticeList"><button class="tab_menu_btn" type="button">공지사항</button></a>
    <a href="boardList"><button class="tab_menu_btn on" type="button">자유게시판</button></a>
    <a href="reportList"><button class="tab_menu_btn" type="button">신고게시판</button></a>
    <a href="qnaList"><button class="tab_menu_btn" type="button">Q&A게시판</button></a>
  </div>
  </div>
	
		<div id="main-container">
		 <h2>게시글작성</h2>
			<table align="center" class="table table-condensed">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tr>
					<th scope="row">글번호</th>
					<td>${map.BOARD_NUM }<input type="hidden" id="BOARD_NUM"
						name="BOARD_NUM" value="${map.BOARD_NUM }"></td>
					<th scope="row">조회수</th>
					<td>${map.BOARD_COUNT }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.MEM_ID }</td>
					<th scope="row">작성일</th>
					<td>${map.BOARD_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">${map.BOARD_TITLE }</td>
				</tr>
				<tr>
					<td colspan="4" height=auto; style="vertical-align: top;"><pre
							style="overflow: hidden; white-space: pre-wrap">${map.BOARD_CONTENT }</pre></td>
				</tr>
			</table>
			
			<br />
			<div align="center">
			<p class="an_style">댓글</p>
			</div>
			<div align="center">
			<form id="frm" name="frm" enctype="multipart/form-data">
				<c:if test="${session_MEM_ID != NULL}">
					<div width="100%" style="float: left;">
						<textarea id="COMMENTS_CONTENT" name="COMMENTS_CONTENT" rows="6" cols="113"></textarea>
						<div align="right" style="float:right; margin-left: 25px;" >
							<a href="#this" id="cWrite" name="cWrite" class="btn">코멘트달기 <br></a>
						</div>
						<input type="hidden" id="COMMENTS_TYPE" name="COMMENTS_TYPE" value="3"/>
						<input type="hidden" id="COMMENTS_PARENT" name="COMMENTS_PARENT" value="${map.BOARD_NUM }"/>
						<input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_INFO.MEM_ID }"/>
					</div>
					<br/>
				</c:if>
			</form>
			</div>
			
			<table id="commentTable" class="tbl_type" style="margin-top:130px;">
				<tbody>

					<!-- 스크립트를 통해 댓글에 대한 정보가 담김 -->

				</tbody>
			</table>
			<div id="PAGE_NAVI" align="center"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		
		<div align="right">
				<br /> <a href="#this" id="list"><button class="btn">목록으로</button></a>
				<c:if test="${session_MEM_INFO.MEM_ID == map.MEM_ID && session_MEM_INFO.MEM_ID ne null}">
					<a href="#this" id="modify"><button class="btn">수정하기</button></a>
				</c:if>
				<c:if
					test="${session_MEM_INFO.MEM_ID == map.MEM_ID || session_MEM_INFO.MEM_LEVEL == '2'}">
					<a href="#this" id="delete"><button class="btn">삭제하기</button></a>
				</c:if>
			</div>
	</div>
</div>
</body>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectCommentList(1);
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
			$("#cWrite").on("click", function(e){
				e.preventDefault();
				fn_writeComment();
			});
			/* $("a[name='cDelete']").on("click", function(e){
				e.preventDefault();
				fn_deleteComment();
			}); */
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/boardList' />");
			comSubmit.submit();
		}
		
		function fn_openBoardModify(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/boardModifyForm' />");
			comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
			comSubmit.submit();
		}
	
		function fn_deleteBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/boardDelete' />");
			comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
			comSubmit.submit();
			
		}
		function fn_writeComment(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/community/boardDetail/commentWrite'/>");
			comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
			
			// 댓글 내용 필요
	         if(!$("#COMMENTS_CONTENT").val()){
	             alert("내용를 입력해주세요.");
	             $("#COMMENTS_CONTENT").focus();
	             return false;
	         }

			
			comSubmit.submit();			
		}

		function fn_deleteComment(num){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/boardDetail/commentDelete'/>");
			comSubmit.addParam("COMMENTS_NUM", num);
			comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
			comSubmit.submit();			
		}

		function fn_selectCommentList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/community/boardDetail/commentList' />");
			comAjax.setCallback("fn_selectCommentListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("COMMENTS_TYPE", 3);
			comAjax.addParam("COMMENTS_PARENT", $("#BOARD_NUM").val());
			comAjax.ajax();
		}

		function fn_selectCommentListCallback(data) {
			var total = data.TOTAL;
			var body = $('#commentTable');
			body.empty();
			if (total == 0) {
				var str = "<tr align='center'>" + "<td colspan='5'>댓글이 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					recordCount : 15,
					eventName : "fn_selectCommentList"
					
				};
				gfn_renderPaging(params);
				
				var str = ""
				str += "<tr style='text-align: center; background-color: #f1f1f1;'><td width='10%'><b>작성자</b></td><td width='*'><b>내용</b></td><td width='30%'><b>작성일</b></td><td width='5%'></td></tr>";
				
				$.each(data.list,
				function(key, value) {
					str += "<tr style='text-align: center'>"
							+ "<td>"
							+ value.MEM_ID
							+ "</td>"
							+ "<td>"
							+ value.COMMENTS_CONTENT
							+ "</td>" + "<td>" + new Date(value.COMMENTS_DATE).toLocaleString() + "</td>" + "<td>";
					if('${session_MEM_ID}' == value.MEM_ID){
						str += "<a href='#this' name='cDelete' onClick='fn_deleteComment("+value.COMMENTS_NUM+")'> 삭제 </a>"
							+ "<input type='hidden' id='NOTICE_NUM' name='NOTICE_NUM' value=" + value.COMMENTS_PARENT + ">"
							
					}
					str += "</td>" + "</tr>";
								});
				body.append(str);
			}
		}
	</script>
</html>


