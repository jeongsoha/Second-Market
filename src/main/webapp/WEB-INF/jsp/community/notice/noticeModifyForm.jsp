<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

  <script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
 
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);


#vertical_tab-container{
	float:right;
	clear:both;
	margin:auto 350px auto auto;
	font-family: 'Nanum Gothic';
	font-size:15px;
	margin-top:50px;
}

#main-container{
   width:900px;
   align:center;
   margin:auto 450px auto auto;
   border-top: 1px solid #fff;  
   border-right: 1px solid #fff;     
   border-left: 1px solid #fff; 
   border-bottom: 1px solid #fff;
   clear:both;
   font-family: 'Nanum Gothic';
	font-size:15px;
}


</style>

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
	<h3 style=font-weight:bold;>게시글수정</h3>
   <form id="frm" name="frm" enctype="multipart/form-data">
      <table class="table table-condensed">
         <colgroup>
            <col width="15%">
            <col width="*"/>
         </colgroup>
         <tbody>
         	<br/>
         	
         	<tr>
         		<td style=text-align:center;>제목</td>
         		<td style="background-color:#fff;"><input type="text" id="NOTICE_TITLE" name="NOTICE_TITLE" style="width:80%" value="${map.NOTICE_TITLE}"/></td>
         
         
         		<td> (게시글번호 : ${map.NOTICE_NUM }
				<input type="hidden" id="NOTICE_NUM" name="NOTICE_NUM" value="${map.NOTICE_NUM }">)</td>
         
         
         		<td style=text-align:center;>작성자</td>
         		<td style="background-color:#fff;">${session_MEM_INFO.MEM_ID } (회원번호 : ${session_MEM_INFO.MEM_NUM } )<input type="hidden" id="MEM_NUM" name="MEM_NUM" style="width:20%" value="${session_MEM_INFO.MEM_NUM }"/></td>
         	</tr>
         	
         	<tr>
         		<td colspan="4" class="view_text"  style="background-color:#fff;">
                  <textarea rows="20" style="width:100%;" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT">${map.NOTICE_CONTENT}</textarea>
               </td>
         	</tr>
         	
         </tbody>
      </table>
      <br/><br/>
      <center>
	      <a href="#write" id="write"><button class="btn btn-primary">작성하기</button></a>
	      <a href="#list" id="list"><button class="btn btn-primary">목록으로</button></a>
      </center>
   </form>
   
   
   
  </div>
</div>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
		var gfv_count = '${fn:length(list)+1}';
      
      $(document).ready(function(){
         $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openNoticeList();
         });
         
         $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_insertNotice();
         });
      });
      
   /* 가려놓으면 수정 시 CK툴 등장하지 않음 */   
   	$(function(){
	  		CKEDITOR.replace('NOTICE_CONTENT',{
	              width:'100%',
	              height:'600px',
	  			filebrowserUploadUrl: '${pageContext.request.contextPath }/ckeditor/fileupload'
	  		});
	  	});
      
      function fn_openNoticeList(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/community/noticeList' />");
         comSubmit.submit();
      }
      
      function fn_insertNotice(){
         var comSubmit = new ComSubmit("frm");
         comSubmit.setUrl("<c:url value='/community/noticeModify' />");
         
      // 게시글 제목 필요
         if(!$("#NOTICE_TITLE").val()){
             alert("제목를 입력해주세요.");
             $("#NOTICE_TITLE").focus();
             return false;
         }
         // 게시글 내용 필요
         if(!$("#NOTICE_CONTENT").val()){
             alert("내용을 입력해주세요.");
             $("#NOTICE_CONTENT").focus();
             return false;
         }
         
         comSubmit.submit();
      }
   </script>
   
   
</body>
</html>