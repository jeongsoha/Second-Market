<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>

<meta charset="UTF-8">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<body>
<div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li><a href="noticeList"><img src="./../resources/images/tab_notice.png" width="100" height="30"></a></li>
         <li><a href="boardList"><img src="./../resources/images/tab_board.png" width="100" height="30"></a></li>
         <li class="selected"><a href="reportList"><img src="./../resources/images/tab_report.png" width="100" height="30"></a></li>
         <li><a href="qnaList"><img src="./../resources/images/tab_qna.png" width="100" height="30"></a></li>
      </ul>
   </div>
   <div id="main-container">
 	<img src="./../resources/images/form_t.png" width="100" height="30">
   <form id="frm" name="frm" enctype="multipart/form-data">
      <table class="tbl_type">
         <colgroup>
            <col width="10%">
            <col width="*"/>
            <col width="10%">
            <col width="15%">
         </colgroup>
         <tbody>
         	<br/>
         	<tr>
         		<td><img src="./../resources/images/form_preport.png"></td>
         		<td style="background-color:#fff;">${GOODS_NUM}
            	<input type="hidden" id="REPORT_PRONUM" name="REPORT_PRONUM" value="${GOODS_NUM}"></td>
         		</td>
         		<td><img src="./../resources/images/form_reason.png"></td>
         		<td style="background-color:#fff;">
            		<select id="REPORT_TYPE" name="REPORT_TYPE">
					
					<!-- <option value="choice">선택</option>-->
					
					<option value="거래사기">거래사기</option>

					<option value="언어폭력">언어폭력</option>

					<option value="기타">기타</option>

				</select>
            	</td>
         		
         	</tr>
         	
         	<tr>
         		<td><img src="./../resources/images/form_title.png"></td>
         		<td style="background-color:#fff;"><input type="text" id="REPORT_TITLE" name="REPORT_TITLE" style="width:95%"/>
         			<input type="hidden" id="REPORT_NUM" name="REPORT_NUM">
         		</td>
         	</tr>
         	<tr>
         		<td colspan="4" class="view_text"  style="background-color:#fff;">
                  <textarea rows="20" cols="100" title="내용" id="REPORT_CONTENT" name="REPORT_CONTENT"></textarea>
               </td>
         	</tr>
         </tbody>
      </table>
      
      <br/><br/>
      <center>
      <a href="#this" class="btn" id="write"><button class="bttn-bordered bttn-xs bttn-primary">작성하기</button></a>
      <a href="#this" class="btn" id="list"><button class="bttn-bordered bttn-xs bttn-primary">목록으로</button></a>
      </center>
   </form>
   
   
   
  </div>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
      var gfv_count=1;
      $(document).ready(function(){
         $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openReportList();
         });
         
         $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_insertReport();
         });
      });
      
      $(function(){
	  		CKEDITOR.replace('REPORT_CONTENT',{
	              width:'100%',
	              height:'600px',
	  			filebrowserUploadUrl: '${pageContext.request.contextPath }/ckeditor/fileupload'
	  		});
	  	});
      
      function fn_openReportList(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/community/reportList' />");
         comSubmit.submit();
      }
      
      function fn_insertReport(){
         var comSubmit = new ComSubmit("frm");
         comSubmit.setUrl("<c:url value='/community/reportWrite' />");
         
         // 게시글 제목 필요
         if(!$("#REPORT_TITLE").val()){
             alert("제목를 입력해주세요.");
             $("#REPORT_TITLE").focus();
             return false;
         }
    	  // 게시글 내용 필요
         if(CKEDITOR.instances.REPORT_CONTENT.getData() =='' 
                 || CKEDITOR.instances.REPORT_CONTENT.getData().length ==0){
             alert("내용을 입력해주세요.");
             $("#REPORT_CONTENT").focus();
             return false;
         }
         
         comSubmit.submit();
      }
   </script>
   
   
</body>
</html>