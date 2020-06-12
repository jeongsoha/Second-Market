<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>

<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);


#vertical_tab-container{
	float:right;
	clear:both;
	margin:50px 350px auto auto;
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
.content{
	margin:auto 410px auto auto;
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
	<h3 style=font-weight:bold;>게시글작성</h3>
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
         		<td style="background-color:#fff;"><input type="text" id="NOTICE_TITLE" name="NOTICE_TITLE" style="width:95%"/></td>
         		<td style=text-align:center;>작성자</td>
         		<td style="background-color:#fff;">${session_MEM_INFO.MEM_ID }<input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEM_INFO.MEM_NUM }"/></td>
         		<input type="hidden" id="IDX" name="IDX" value="">
         		
         	</tr>
         	<tr>
         		
         		<td colspan="4" class="view_text"  style="background-color:#fff;">
                  <textarea rows="20" cols="100" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT"></textarea>
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
<script type="text/javascript">
      var gfv_count=1;
      $(document).ready(function(){
         $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openNoticeList();
         });
         
         $("#write").on("click", function(e){ //작성하기 버튼 시 동작되도록
            e.preventDefault();
            fn_insertNotice();
         });
      });
      
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
      
      function fn_insertNotice(){    // 작성하기 누르면 #write 타고와서 동작
         var comSubmit = new ComSubmit("frm");
         comSubmit.setUrl("<c:url value='/community/noticeWrite' />");
         
         // 게시글 제목 필요
         if(!$("#NOTICE_TITLE").val()){
             alert("제목를 입력해주세요.");
             $("#NOTICE_TITLE").focus();
             return false;
         }

    	  // 게시글 내용 필요
           if(CKEDITOR.instances.NOTICE_CONTENT.getData() =='' 
                 || CKEDITOR.instances.NOTICE_CONTENT.getData().length ==0){
             alert("내용을 입력해주세요.");
             $("#NOTICE_CONTENT").focus();
             return false;
         }
 
         
         comSubmit.submit();
      }
   </script>
   
   
</body>
</html>