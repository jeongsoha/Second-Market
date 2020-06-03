<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/layout.css'/>" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css'>
<link rel="stylesheet" href="css/style.css">

<style type="text/css">
	
   a {
   		color:#666;
   		text-align:right;
   }

   body {
        background:white;
   }
   
   #head{
   		width:100%;
   		margin: 10px auto;
   }
   
   #h1{
   		float:left;
   		width:30%;
   		margin: 30px 0px 15px 0px;   
   		
   }
   
   #h2{
   		float:left;
   		width:30%;
   		margin: 100px 0px 85px 100px; 
   }
   
   #menu{
   		width:100%;
   		margin: 10px 10px 10px auto;
   }
   
   #h3{
   		float:left;
   		display: inline;
   }
   
   #h4{
   		float:left;
   		display: inline;
   }
   
   #h5{
   		float:left;
   		display: inline;
   }
   
   #h6{
   		float:left;
   		display: inline; 
   }
   
   #h7{
   		float:left;
   		display: inline; 
   }
   
   #header{
   		width:100%;
   		height:20px;
   		background-color:#7CCE76;
   }
   
   

</style>


<script type="text/javascript">

   var onSearch = function(){   
      submit();  
   };
   
   $(document).ready(function() {
	      poll();
	     
	   });
	   
	   function fn_InformConfirm(num){
	      $.ajax({
	           url: '/second/inform/confirm',
	           type: 'GET',
	           data: {INFORM_NUM:num},
	           dataType: 'json',
	           success: function(data) {
	               console.log('success'),
	               updateCallback(data);
	           }});
	   }
	   function updateCallback(data){
	      window.location.reload();
	   }
	 
	   function poll() {
	       $.ajax({
	           url: '/second/inform',
	           type: 'GET',
	           data: {},
	           dataType: 'json',
	           success: function(data) {
	               console.log('success'),
	               callback(data);
	           },
	           timeout: 3000,
	           complete: setTimeout(function() { poll(); }, 10000)
	           });
	   };
	   
	   function callback(data){
	      var total = data.list;
	      var body = $("#inform");
	      body.empty();
	      var str = "";
	      if (total == 0) {
	         str += "<tr>" + "<td colspan='4'>새로운 알림이 없습니다.</td>"
	         + "</tr>";
	         body.append(str);
	      } else {
	            $.each(
	            data.list,
	            function(key, value) {
	               str += "<a href='#this'  name='confirm' onClick='fn_InformConfirm("+value.INFORM_NUM+")'> " 
	                  + new Date(value.INFORM_DATE).toLocaleString()
	                  + "<br/>"
	                  + value.INFORM_CONTENT
	                  + "<input type='hidden' id='INFORM_NUM' value=" + value.INFORM_NUM + ">"
	                  + "</a>";
	            });

	            body.append(str);
	      }
	   }

</script>


<div id="header">
	
</div>


<!--  Header 영역 / 마이페이지 , 내상점이 아닌 기본에 쓰임-->
<div id="head">
	<div class="header_area" id="h1">
	   <h1><a href="/second/sample/openBoardList" title="second#"><img class="main_image" src="<c:url value="/resources/images/second.png"/>" style="margin-left: 200px; display: block;" alt="second#"/></a></h1>   
	</div>
<!-- 검색창 -->
		 <div class="search_main" id="h2">
	      <div class="search_inner">

	      
	         <form action="/second/shop" method="post">
	          
	            <fieldset>
	               
	               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	               
	              <select name="searchType">
	                 <option value="n" selected>-----</option>
	                 <option value="title">상품명</option>
	                 <option value="content">내용</option>
	                 <option value="brand">브랜드</option>
	              </select>
	              
	                <input type="text" class="txt" placeholder="검색어를 입력해 주세요" maxlength="20" name="keyword"/>&nbsp;
	                <input type="submit" value="검색" class="search_btn" onClick="onSearch()"/>
	                	                
	            </fieldset>
	         </form>

	         
	      </div>
	      </div>
	      
</div>



<!-- 로그인 xxx -->
<div id="menu">


 	<div id="h3">
         <c:if test="${session_MEM_ID == null }">
	         <a href="${contextPath}/second/loginForm" class="log">로그인</a>  &nbsp;&nbsp;
	         <a href="${contextPath}/second/joinForm">회원가입</a>              &nbsp;&nbsp;
	         <a href="${contextPath}/second/findId">ID/PW찾기</a>             &nbsp;&nbsp;
         </c:if>
    </div>
         
<!-- 로그인ooo -->

         
        <div id="h7"> 
        			  <c:if test="${session_MEM_ID != null }">
					     <a href="#" style="font-color:#666; font-size:12px;" class="tab_a1"><span>${session_MEM_ID}&nbsp;님</span></a>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		
		<div id="h4">
			<c:if test="${session_MEM_ID == 'admin' }">
	          <a href="/second/admin">관리자페이지</a>
	       </c:if>
		         <a href="${contextPath}/second/logout" class="log">로그아웃</a> &nbsp;&nbsp;
		         <a href="${contextPath}/second/myPage">마이페이지</a>           &nbsp;&nbsp;
		         <a href="${contextPath}/second/myshop">내상점</a>              &nbsp;&nbsp;
           </c:if>
     </div>

<!-- 로그인 ooo -->
		
		<!-- 내상점 / 커뮤니티 창일 경우에 띄워주는 메뉴 시작 -->
		<%-- <c:if test="${session_shopAndCommunity}"> --%>
		   <div class="tab_cate" id="h5">    
		      <div class="tabs_area">  
		         <class="tabs">
		            <a href="/second/shop/allGoodsList" class="tab_a1"><span>쇼핑몰</span></a>     &nbsp;&nbsp;
		           <a href="/second/community/noticeList" class="tab_a2"><span>커뮤니티</span></a>  &nbsp;&nbsp;
		         </class>
		      </div>
		   </div>
		<%-- </c:if> --%>
		
<!-- 로그인 ooo  알림버튼 -->
      
      <c:if test="${session_MEM_ID != null}">
         <div class="dropdown" id="h6">
         <button class="dropbtn"><img style="width:30px; height:30px;" src="<c:url value="/resources/images/Bell.png"/>"/></button>
       </div>
       </c:if>
</div>
	   
     	 

<!--//메뉴 끝-->