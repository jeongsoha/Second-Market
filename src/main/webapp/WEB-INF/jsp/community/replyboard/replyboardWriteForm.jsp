<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>

<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<body>
	<div id="content">
		<div id="vertical_tab-container">
			<ul>
				<li><a href="noticeList"><img
						src="./../resources/images/tab_notice.png" width="100" height="30"></a></li>
				<li class="selected"><a href="boardList"><img
						src="./../resources/images/tab_board.png" width="100" height="30"></a></li>
				<li><a href="reportList"><img
						src="./../resources/images/tab_report.png" width="100" height="30"></a></li>
				<li><a href="qnaList"><img
						src="./../resources/images/tab_qna.png" width="100" height="30"></a></li>
			</ul>
		</div>
		<div id="main-container">
			<img src="./../resources/images/form_t.png" width="100" height="30">
			<form id="frm" name="frm" enctype="multipart/form-data">
				<table class="tbl_type">
					<colgroup>
						<col width="10%">
						<col width="*" />
						<col width="10%">
						<col width="15%">
					</colgroup>
					<tbody>
						<tr>
							<td><img src="/second/resources/images/form_title.png"></td>
							<td style="background-color: #fff;"><input type="text"
								id="BOARD_TITLE" name="BOARD_TITLE" style="width: 95%" /></td>
							<td><img src="/second/resources/images/form_writer.png"></td>
							<td style="background-color: #fff;">${session_MEM_INFO.MEM_ID }<input
								type="hidden" id="MEM_NUM" name="MEM_NUM"
								value="${session_MEM_INFO.MEM_NUM }" /></td>
						</tr>
						<tr>

							<td colspan="4" class="view_text" style="background-color: #fff;">
								<textarea rows="20" cols="100" title="내용" id="BOARD_CONTENT"
									name="BOARD_CONTENT"></textarea>
							</td>
						</tr>
					</tbody>
				</table>

				<br />
				<br />
				<center>
					<a href="#this" class="btn" id="write"><button
							class="bttn-bordered bttn-xs bttn-primary">작성하기</button></a> <a
						href="#this" class="btn" id="list"><button
							class="bttn-bordered bttn-xs bttn-primary">목록으로</button></a>
				</center>
			</form>



		</div>
	</div>
	<script type="text/javascript">
      var gfv_count=1;
      $(document).ready(function(){
         $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openBoardList();
         });
         
         $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_insertBoard();
         });
      });
      
      $(function(){
	  		CKEDITOR.replace('BOARD_CONTENT',{
	              width:'100%',
	              height:'600px',
	  			filebrowserUploadUrl: '${pageContext.request.contextPath }/ckeditor/fileupload'
	  		});
	  	});
      
      function fn_openBoardList(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/community/boardList' />");
         comSubmit.submit();
      }
      
      function fn_insertBoard(){
         var comSubmit = new ComSubmit("frm");
         comSubmit.setUrl("<c:url value='/community/boardWrite' />");
         
      // 게시글 제목 필요
         if(!$("#BOARD_TITLE").val()){
             alert("제목를 입력해주세요.");
             $("#BOARD_TITLE").focus();
             return false;
         }
    	  // 게시글 내용 필요
         if(CKEDITOR.instances.BOARD_CONTENT.getData() =='' 
                 || CKEDITOR.instances.BOARD_CONTENT.getData().length ==0){
             alert("내용을 입력해주세요.");
             $("#BOARD_CONTENT").focus();
             return false;
         }
         
         comSubmit.submit();
      }
   </script>


</body>
</html>