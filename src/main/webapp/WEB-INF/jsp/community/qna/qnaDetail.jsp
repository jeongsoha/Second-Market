<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<body>
<div id="content">
   <div id="vertical_tab-container">
  
      <ul>
      
         <li><a href="noticeList"><img src="./../resources/images/tab_notice.png" width="100" height="30"></a></li>
         <li><a href="boardList"><img src="./../resources/images/tab_board.png" width="100" height="30"></a></li>
         <li><a href="reportList"><img src="./../resources/images/tab_report.png" width="100" height="30"></a></li>
         <li class="selected"><a href="qnaList"><img src="./../resources/images/tab_qna.png" width="100" height="30"></a></li>
        </ul>

   </div>
   <div id="main-container">
		<img src="./../resources/images/form_t3.png" width="100" height="30">
    <form id="frm" name="frm">
	<table class="tbl_type" align="center">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="*"/>
		</colgroup>
		
		<tbody>
			<tr>
				<th scope="row"><img src="./../resources/images/commu_num.png" height="25"></th>
				<td>${map.QNA_NUM }
				<th scope="row"><img src="./../resources/images/commu_hit.png" height="25"></th>
				<td>${map.QNA_COUNT }</td>
			</tr>
			<tr>
				<th scope="row"><img src="./../resources/images/commu_writer.png" height="25"></th>
				<td>${map.MEM_ID }</td>
				<th scope="row"><img src="./../resources/images/form_type.png" height="25"></th>
				<td>${map.QNA_TYPE }</td>
			</tr>
			<tr>
				<th scope="row"><img src="./../resources/images/commu_title.png" height="25"></th>
				<td>${map.QNA_TITLE }</td>
				<th scope="row"><img src="./../resources/images/commu_date.png" height="25"></th>
				<td>${map.QNA_TIME }</td>
			</tr>
			<tr>
				<td colspan="4" height="600px" style="vertical-align:top;"><pre style="overflow:hidden;  white-space: pre-wrap">${map.QNA_CONTENT }</pre></td>
			</tr>
			<tr>
				<th scope="row">첨부파일</th>
				<td colspan="3">
					<c:forEach var="row" items="${list }">
						<div>
							<input type="hidden" id="FILES_NUM" value="${row.FILES_NUM }">
							<a href="#this" name="file">${row.FILES_ORGNAME }</a>
							(${row.FILES_SIZE}kb)
						</div>
					</c:forEach>
				</td>
			</tr>
		</tbody>
	</table>
	    <c:choose>
	    <c:when test="${fn:length(asList)>0 }">
	    <c:forEach items="${asList }" var="answer">
		<div class="answer">
				<p>답변보기</p>
				<table class="hide">
					<tr>
					  <th>작성자</th><td>${answer.MEM_ID }(운영자)</td><th>작성 날짜</th><td>${answer.QNA_DATE }</td>
					</tr>
					<tr><th>제목</th><td>RE: ${answer.QNA_TITLE }</td>
					<tr>
					   <th>내용</th><td><pre>${answer.QNA_CONTENT}</pre></td>
					</tr>
					<tr align="right">
					  <td><a href="#this" class="btn" id="deleteAnswer" name="deleteAnswer">삭제하기</a>
					  <input type="hidden" id="QNA_NUM" value="${answer.QNA_NUM }"></td>
					</tr>
				</table>
		</div>
		</c:forEach>
		</c:when>
		</c:choose>
			
		<div class="answer">
				<p>답변쓰기</p>
				<table class="hide">
					<tr>
					  <th>제목</th>
					  <td><input type="text" id="QNA_TITLE" name="QNA_TITLE"></td>
					</tr>
					<tr>
					  <th>내용</th>
					  <td><textarea rows="20" cols="100" title="내용" id="QNA_CONTENT" name="QNA_CONTENT"></textarea></td>
					</tr>
					<tr align="right">
					 <td><a href="#this" class="btn" id="write">답변달기</a></td>
					</tr> 
				</table>
				
		</div>
	<a href="#this" class="btn" id="list"><button class="bttn-bordered bttn-xs bttn-primary">목록으로</button></a>
	<c:if test="${session_MEM_ID eq map.MEM_ID && session_MEM_ID ne null}">
		<a href="#this" class="btn" id="update"><button class="bttn-bordered bttn-xs bttn-primary">수정하기</button></a>
		<a href="#this" class="btn" id="delete"><button class="bttn-bordered bttn-xs bttn-primary">삭제하기</button></a>
	</c:if>
	</form>
	</div>
	</div>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			$("#write").on("click", function(e){ //답변달기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openBoardUpdate();
			});
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
			$("a[name='deleteAnswer']").on("click", function(e){ //삭제하기 버튼
				e.preventDefault(); 
				fn_deleteAnswerBoard($(this));
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/qnaList' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var idx = "${map.QNA_NUM}";
			var type="${map.QNA_TYPE}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/qnaModifyForm' />");
			comSubmit.addParam("QNA_NUM", idx);
			comSubmit.addParam("QNA_TYPE",type);
			comSubmit.submit();
		}
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			var idx="${map.QNA_NUM}"
			var type="${map.QNA_TYPE}"
			comSubmit.setUrl("<c:url value='/community/qnaDetail/answerWrite' />");
			comSubmit.addParam("QNA_NUM",idx);//QNA_PARENT의 값이된다.
			comSubmit.addParam("QNA_TYPE",type);//어떤 유형에 대한 답변인지 보기위해 넣는다.
			comSubmit.submit();
		}
	
		function fn_deleteBoard(){
			var idx = "${map.QNA_NUM}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/qnaDelete' />");
			comSubmit.addParam("QNA_NUM", idx);
			comSubmit.submit();
			
		}
		function fn_deleteAnswerBoard(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/qnaDetail/answerDelete' />");
			comSubmit.addParam("QNA_NUM", obj.parent().find("#QNA_NUM").val());
			comSubmit.addParam("Q_QNA_NUM", "${map.QNA_NUM}");
			
			comSubmit.submit();
			
		}
		
		//답변글 보기에 쓰는 거 
		//html dom 이 다 로딩된 후 실행된다.
		$(document).ready(function(){
			// menu 클래스 바로 하위에 있는 p 태그를 클릭했을때
			$(".answer>p").click(function(){
				var submenu = $(this).next("table");

				// submenu 가 화면상에 보일때는 위로 접고 아니면 아래로 펼치기
				if( submenu.is(":visible") ){
					submenu.slideUp();
				}else{
					submenu.slideDown();
				}
			});
		});
	</script>
</body>
</html>