<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
a{
   color: #000;
   text-decoration: none;	
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
	<h2>게시글수정</h2>
   <form id="frm" name="frm" enctype="multipart/form-data">
      <table class="table table-condensed">
         <colgroup>
            <col width="10%">
            <col width="*"/>
            <col width="10%">
            <col width="15%">
         </colgroup>
         <tbody>
         	<tr>
         		<td>제목</td>
         		<td style="background-color:#fff;"><input type="text" id="BOARD_TITLE" name="BOARD_TITLE" style="width:95%" value="${map.BOARD_TITLE}"/>
         		<input type="hidden" id="BOARD_NUM" name="BOARD_NUM" value="${map.BOARD_NUM }"/>
         		<td>작성자</td>
         		<td style="background-color:#fff;">${session_MEM_INFO.MEM_ID }</td>
         	</tr>
         	<tr>
         		
         		<td colspan="4" class="view_text"  style="background-color:#fff;">
                  <textarea rows="20" cols="100" title="내용" id="BOARD_CONTENT" name="BOARD_CONTENT">${map.BOARD_CONTENT }</textarea>
               </td>
         	</tr>
         	
         </tbody>
      </table>
      
      <br/><br/>
      <div align="right">
      <a href="#this" id="write"><button class="btn">작성하기</button></a>
      <a href="#this" id="list"><button class="btn">목록으로</button></a>
      </div>
   </form>
  </div>
</div>

<script type="text/javascript">
		var gfv_count = '${fn:length(list)+1}';
		
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
         comSubmit.setUrl("<c:url value='/community/boardModify' />");
         
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