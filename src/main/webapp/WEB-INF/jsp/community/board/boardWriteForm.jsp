<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>

<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

#vertical_tab-container{
	float:right;
	margin:auto 350px auto auto;
	clear:both;
	font-family: 'Nanum Gothic';
	font-size:15px;
}

#main-container{
   width:1100px;
   align:center;
   margin:auto 410px auto 410px;
   clear:both;
   font-family: 'Nanum Gothic';
}


</style>

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
			<form id="frm" name="frm" enctype="multipart/form-data">
				<table class="table table-condensed">
					<colgroup>
						<col width="10%">
						<col width="*" />
						<col width="10%">
						<col width="15%">
					</colgroup>
					<tbody>
						<tr>
							<td>제목</td>
							<td style="background-color: #fff;"><input type="text"
								id="BOARD_TITLE" name="BOARD_TITLE" style="width: 95%" /></td>
							<td>작성자</td>
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
				<div align="right">
					<a href="#this" class="btn" id="write"><button
							class="bttn-bordered bttn-xs bttn-primary">작성하기</button></a> <a
						href="#this" class="btn" id="list"><button
							class="bttn-bordered bttn-xs bttn-primary">목록으로</button></a>
				</div>
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