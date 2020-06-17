<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<html lang="ko">
<head>
   <meta charset="UTF-8">
<link href="<c:url value="/resources/css/mypage.css"/>" rel="stylesheet">
<style>
a{
   color: #000;
   text-decoration: none;	
}
font {
	color: #000;
}
</style>
</head>
<body>
<div class="card align-middle" style="border-radius:20px; background-color:#fff; margin-top:50px;">
<div id="content">
   <div id="vertical_tab-container">
  <!--  <ul>
     <li><a href="accountDetail"><img src="./../resources/images/mypage_tab1.png" width="100" height="30"></a></li>
     <li><a href="pwModifyForm"><img src="./../resources/images/mypage_tab2.png" width="100" height="30"></a></li>
     <li><a href="deleteAccount"><img src="./../resources/images/mypage_tab3.png" width="100" height="30"></a></li>
     <li class="selected"><a href="reportList"><img src="./../resources/images/mypage_tab4.png" width="100" height="30"></a></li>
     <li><a href="qnaList"><img src="./../resources/images/mypage_tab5.png" width="100" height="30"></a></li>
    </ul> -->
   </div>
   <div id="main-container">
   <img src="./../resources/images/form_t3.png" width="100" height="30">
   <table border="1" align="center" class="tbl_type">
      <colgroup>
         <col width="15%"/>
         <col width="35%"/>
         <col width="15%"/>
         <col width="35%"/>
      </colgroup>
      <caption><h2>신고게시판</h2></caption>
      <p/>
      <tbody>
         <tr>
            <th scope="row"><img src="./../resources/images/commu_num.png" height="25"></th>
            <td>${map.REPORT_NUM }
            <input type="hidden" id="REPORT_NUM" name="REPORT_NUM" value="${map.REPORT_NUM }"></td>
            <th scope="row"><img src="./../resources/images/commu_hit.png" height="25"></th>
            <td>${map.REPORT_COUNT }</td>
         </tr>
         <tr>
            <th scope="row"><img src="./../resources/images/commu_writer.png" height="25"></th>
            <td>${map.MEM_ID }</td>
            <th scope="row"><img src="./../resources/images/commu_date.png" height="25"></th>
            <td>${map.REPORT_DATE }</td>
         </tr>
         <tr>
           <th scope="row"><img src="./../resources/images/report_pid.png" height="25"></th>
           <td>${map.REPORT_GOODS_SELLER_ID }
           <th scope="row"><img src="./../resources/images/report_p.png" height="25"></th>
           <td>${map.REPORT_PRONUM }</td>
         </tr>
         <tr>
            <th scope="row"><img src="./../resources/images/commu_title.png" height="25"></th>
            <td>${map.REPORT_TITLE }</td>
            <th scope="row"><img src="./../resources/images/report_reason.png" height="25"></th>
            <td>${map.REPORT_TYPE }
            <c:if test="${session_MEM_INFO.MEM_LEVEL eq '2'}">
            <form id="frm" name="frm">
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
            <td colspan="4" height="600px" style="vertical-align:top;"><pre style="overflow:hidden;  white-space: pre-wrap">${map.REPORT_CONTENT }</pre></td>
         </tr>
      </tbody>
   </table>
   <a href="#this" class="btn" id="list">목록으로</a>
   <c:if test="${session_MEM_ID eq map.MEM_ID && session_MEM_ID ne null}">
   	<a href="#this" class="btn" id="delete">삭제하기</a>
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
         comSubmit.setUrl("<c:url value='/myPage/reportList' />");
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