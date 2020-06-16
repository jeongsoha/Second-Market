<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
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
	font-size:15px;
}

.btn3{
    width: 100px;
    background-color: #fff;
    border: 1px solid #80EB1C;
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
.btn3:hover {
  /*   background-color: #74C043; */
  	background-color: #80EB1C;
    color:#fff;
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

</style>

<meta charset="UTF-8">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

</head>
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
		<h2>게시글보기</h2>
   <table align="center" class="table table-condensed">
      <colgroup>
         <col width="15%"/>
         <col width="35%"/>
         <col width="15%"/>
         <col width="35%"/>
      </colgroup>
      <caption><h2>신고게시판</h2></caption>
      <tbody>
         <tr>
            <th style=text-align:center; scope="row">글번호</th>
            <td>${map.REPORT_NUM }
            <input type="hidden" id="REPORT_NUM" name="REPORT_NUM" value="${map.REPORT_NUM }"></td>
            <th style=text-align:center; scope="row">조회수</th>
            <td>${map.REPORT_COUNT }</td>
         </tr>
         <tr>
            <th style=text-align:center; scope="row">작성자</th>
            <td>${map.MEM_ID }</td>
            <th style=text-align:center; scope="row">작성일</th>
            <td>${map.REPORT_DATE }</td>
         </tr>
         <tr>
           <th style=text-align:center; scope="row">신고대상</th>
           <td>${map.REPORT_GOODS_SELLER_ID }
           <th style=text-align:center; scope="row">신고할상품번호</th>
           <td>${map.REPORT_PRONUM }</td>
         </tr>
         <tr>
            <th style=text-align:center; scope="row">제목</th>
            <td>${map.REPORT_TITLE }</td>
            <th style=text-align:center; scope="row">신고사유</th>
            <td>${map.REPORT_TYPE }
            <c:if test="${session_MEM_INFO.MEM_LEVEL eq '2'}">
            <form id="frm" name="frm">
            <input type="hidden" id="IDX" name="IDX" value="${map.MEM_ID}">
            <input type="hidden" id="IDX2" name="IDX2" value="${map.GOODS_SELLER_ID}">
            
	            <select name="REPORT_STATUS" id="REPORT_STATUS">
	               <option value="처리대기">대기</option>
	               <option value="신고접수">접수</option>
	               <option value="허위신고">무죄</option>
	               <option value="처리완료">완료</option>
	            </select><a href="#this" class="btn" id="handle">처리 </a>
	      		</form>
      		</c:if>
            
            
         </tr>
         <tr>
            <td colspan="4" height=auto; style="vertical-align:top;"><pre style="overflow:hidden;  white-space: pre-wrap">${map.REPORT_CONTENT }</pre></td>
         </tr>
      </tbody>
   </table>
   
   <div align="right">
   <a href="#this" id="list"><button class="btn3">목록으로</button></a>
   <c:if test="${session_MEM_ID eq map.MEM_ID && session_MEM_ID ne null}">
   	<a href="#this" id="delete"><button class="btn3">삭제하기</button></a>
   </c:if>
   </div>
   </div>
</div>
   
   
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
      $(document).ready(function(){
         $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openBoardList();
         });
         
         $("#delete").on("click", function(e){ //삭제하기 버튼
            e.preventDefault();
            fn_deleteBoard();
         });
         $("#handle").on("click", function(e){ //처리
             e.preventDefault();
             fn_report_status();
          });
      });
      
      function fn_openBoardList(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/community/reportList' />");
         comSubmit.submit();
      }
      
      function fn_deleteBoard(){
    	 var idx="${map.REPORT_NUM}";
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/community/reportDelete' />");
         comSubmit.addParam("REPORT_NUM",idx);
         comSubmit.submit();
      }
      
      function fn_report_status(){
          var comSubmit = new ComSubmit("frm");
          var idx="${map.REPORT_NUM}";
          comSubmit.setUrl("<c:url value='/community/reportDetail/reportHandle'/>");
          comSubmit.addParam("REPORT_NUM",idx);
          comSubmit.submit();         
       }
   </script>
</body>
</html>