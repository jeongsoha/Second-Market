<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

  <script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
 
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
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
	<img src="./../resources/images/form_t2.png" width="100" height="30">
   <form id="frm" name="frm" enctype="multipart/form-data">
      <table class="tbl_type">
         <colgroup>
            <col width="15%">
            <col width="*"/>
         </colgroup>
         <tbody>
         	<br/>
         	<tr>
         		<td><img src="./../resources/images/form_title.png"></td>
         		<td style="background-color:#fff;"><input type="text" id="NOTICE_TITLE" name="NOTICE_TITLE" style="width:95%" value="${map.NOTICE_TITLE}"/></td>
         
         
         		<td> (게시글번호 : ${map.NOTICE_NUM }
				<input type="hidden" id="NOTICE_NUM" name="NOTICE_NUM" value="${map.NOTICE_NUM }">)</td>
         
         
         		<td><img src="./../resources/images/form_writer.png"></td>
         		<td style="background-color:#fff;">${session_MEM_INFO.MEM_ID } (회원번호 : ${session_MEM_INFO.MEM_NUM } )<input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEM_INFO.MEM_NUM }"/></td>
         	</tr>
         	<tr>
         		
         		<td colspan="4" class="view_text"  style="background-color:#fff;">
                  <textarea rows="20" cols="100" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT">${map.NOTICE_CONTENT}</textarea>
               </td>
         	</tr>
         </tbody>
      </table>
      <br/><br/>
      <center>
	      <a href="#write" class="btn" id="write"><button class="bttn-bordered bttn-xs bttn-primary">작성하기</button></a>
	      <a href="#list" class="btn" id="list"><button class="bttn-bordered bttn-xs bttn-primary">목록으로</button></a>
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