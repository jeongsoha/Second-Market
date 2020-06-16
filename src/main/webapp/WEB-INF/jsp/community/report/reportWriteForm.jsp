<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>

<style type="text/css">

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

#main-container{
   width:1100px;
   align:center;
   font-family: 'Nanum Gothic';
   font-size:15px;
}
.search_box1 {
    width: 150px;
    height: 30px;
    border: 0.1em solid #000;
}
#content{
	width:1120px;
	margin-left:50px;
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

<meta charset="UTF-8">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<body>
<div id="content">
   
  <div class="tab_wrap">
  <div class="tab_menu_container">
    <a href="noticeList"><button class="tab_menu_btn" type="button">공지사항</button></a>
    <a href="boardList"><button class="tab_menu_btn" type="button">자유게시판</button></a>
    <a href="reportList"><button class="tab_menu_btn on" type="button">신고게시판</button></a>
    <a href="qnaList"><button class="tab_menu_btn" type="button">Q&A게시판</button></a>
  </div>
  </div>
   
   <div id="main-container">
 	<h2>게시글작성</h2>
   <form id="frm" name="frm" enctype="multipart/form-data">
      <table class="table table-condensed">
         <colgroup>
            <col width="10%">
            <col width="*"/>
            <col width="10%">
            <col width="15%">
         </colgroup>
         <tbody>
         	<br/>
         	<tr>
         		<td style="font-weight:bold; vertical-align: middle;">신고게시글</td>
         		<td style="background-color:#fff;">${GOODS_NUM}
            		<input type="hidden" id="REPORT_PRONUM" name="REPORT_PRONUM" value="${GOODS_NUM}"></td>
         		</td>
         		<td style="font-weight:bold;vertical-align: middle;">신고사유</td>
         		<td style="background-color:#fff;">
            		<select id="REPORT_TYPE" name="REPORT_TYPE" class="search_box1">
					<!-- <option value="choice">선택</option>-->
					<option value="거래사기">거래사기</option>
					<option value="언어폭력">언어폭력</option>
					<option value="기타">기타</option>
					</select>
            	</td>
         	</tr>
         	
         	<tr>
         		<td style="font-weight:bold; ">제목</td>
         		<td colspan="3" style="background-color:#fff;"><input type="text" id="REPORT_TITLE" name="REPORT_TITLE" style="width:100%"/>
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