<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">

<style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

a{
   color: #000;
   text-decoration: none;	
}

.btn{
    width: 100px;
    background-color: #fff;
    border-size: 3px;
    border-color: #80EB1C;
    color: #000;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius: 10px;
}
#main-container{
   width:1100px;
   align:center;
   font-family: 'Nanum Gothic';
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
.search_box1 {
    width: 150px;
    height: 30px;
    border: 0.1em solid #000;
}
</style>

<body>
<div id="content">
     <div class="tab_wrap">
		  <div class="tab_menu_container">
		    <a href="noticeList"><button class="tab_menu_btn" type="button">공지사항</button></a>
		    <a href="boardList"><button class="tab_menu_btn" type="button">자유게시판</button></a>
		    <a href="reportList"><button class="tab_menu_btn" type="button">신고게시판</button></a>
		    <a href="qnaList"><button class="tab_menu_btn on" type="button">Q&A게시판</button></a>
		  </div>
  	 </div>
   <div id="main-container">
	<h2>게시글작성</h2>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="table table-condensed">
			<colgroup>
	            <col width="10%">
	            <col width="*"/>
	            <col width="15%">
	            <col width="20%">
			</colgroup>
			<tbody>
				<br/>
				<tr>
	         		<th style="text-align:center; vertical-align: middle;">제목</th>
	         		<td style="background-color:#fff;"><input type="text" id="QNA_TITLE" name="QNA_TITLE" style="width:95%"/></td>
					<th style="text-align:center; vertical-align: middle;" scope="row">유형</th>
					<td style="background-color:#fff;">
					<select name="QNA_TYPE" id="QNA_TYPE" class="search_box1">
						<option value="상품 관련 문의">상품 관련 문의</option>
						<option value="회원 관리 문의">회원 관리 문의</option>
						<option value="게시판 사용 관련 문의">게시판 사용 관련 문의</option>
						<option value="기타 문의">기타 문의</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="4" class="view_text"  style="background-color:#fff;">
						<textarea rows="20" cols="100" title="내용" id="QNA_CONTENT" name="QNA_CONTENT"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<br/><br/>
	<div align="right">
		<a href="#this" id="write"><button class="btn btn-primary">작성하기</button></a>
		<a href="#this" id="list"><button class="btn btn-primary">목록으로</button></a>
	</div>
	</form>
   
   
	
  </div>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
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
	    		CKEDITOR.replace('QNA_CONTENT',{
	                width:'100%',
	                height:'600px',
	    			filebrowserUploadUrl: '${pageContext.request.contextPath }/ckeditor/fileupload'
	    		});
	    	});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/qnaList' />");
			comSubmit.submit();
		}
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/community/qnaWrite' />");
			
			 // 게시글 제목 필요
	         if(!$("#QNA_TITLE").val()){
	             alert("제목를 입력해주세요.");
	             $("#QNA_TITLE").focus();
	             return false;
	         }

	    /*      if(!$("#QNA_CONTENT").val()){
	             alert("제목를 입력해주세요.");
	             $("#QNA_CONTENT").focus();
	             return false; */
	             
	      // 게시글 내용 필요
	         if(CKEDITOR.instances.QNA_CONTENT.getData() =='' 
	                 || CKEDITOR.instances.QNA_CONTENT.getData().length ==0){
	             alert("내용을 입력해주세요.");
	             $("#QNA_CONTENT").focus();
	             return false; 
	         }
			
			comSubmit.submit();
		}
	</script>
	
	
</body>
</html>