<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/inform.css'/>" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<style>
a {color:#666;}
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

<!-- 검색창!!!! -->

	<!--  Header 영역 / 마이페이지 , 내상점이 아닌 기본에 쓰임-->
	<div class="header_area">
	   <h1><a href="/second/sample/openBoardList" title="second#"><img class="main_image" src="<c:url value="/resources/images/second.png"/>" alt="second#"/></a></h1>   
	   
	                 
	         <!-- --------- -->

<!-- 로그인 xxx -->
 		 
         <c:if test="${session_MEM_ID == null }">
	         <a href="${contextPath}/second/loginForm" class="log">로그인</a>
	         <a href="${contextPath}/second/joinForm">회원가입</a> 
	         <a href="${contextPath}/second/findId">ID/PW찾기</a>
         </c:if>
         
<!-- 로그인ooo -->
         
         <c:if test="${session_MEM_ID != null }">
	     <p style="font-color:#666; font-size:12px;">${session_MEM_ID}&nbsp;님</p>
	       <c:if test="${session_MEM_ID == 'admin' }">
	          <a href="/second/admin">관리자페이지</a>   
	       </c:if>
		         <a href="${contextPath}/second/logout" class="log">로그아웃</a>
		         <a href="${contextPath}/second/myPage">마이페이지</a>
		         <a href="${contextPath}/second/myshop">내상점</a>
         </c:if>

<!-- 로그인 ooo -->
		
		<!-- 내상점 / 커뮤니티 창일 경우에 띄워주는 메뉴 시작 -->
		<%-- <c:if test="${session_shopAndCommunity}"> --%>
		   <div class="tab_cate">    
		      <div class="tabs_area">  
		         <class="tabs">
		            <a href="/second/shop/allGoodsList" class="tab_a1"><span>쇼핑몰</span></a>
		           <a href="/second/community/noticeList" class="tab_a2"><span>커뮤니티</span></a>
		         </class>
		      </div>
		   </div>
		<%-- </c:if> --%>
		
<!-- 로그인 ooo  알림버튼 -->
      
      <c:if test="${session_MEM_ID != null}">
         <div class="dropdown">
         <button class="dropbtn"><img style="width:30px; height:30px;" src="<c:url value="/resources/images/Bell.png"/>"/></button>
            <div class="dropdown-content">
              <table id="inform">
                 <tbody>
                 </tbody>
              </table>
            </div>
       </div>
       </c:if>
       
	   </div>
	</div>
		
<!-- --------- -->
	                
	            </fieldset>
	         </form>
	        
	      </div>
	      

	      
	   </div>
	   <div class="top_menu">
     	 
     	       <nav class="navbar navbar-default">
        <div class="container">
	          <div class="navbar-header">
	            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
	              <span class="sr-only">Toggle navigation</span>
	              <span class="icon-bar"></span>
	              <span class="icon-bar"></span>
	              <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="/second/sample/openBoardList">SECOND MARKET</a>
	          </div>
          
	          <div class="navbar-collapse collapse">
	            <ul class="nav navbar-nav">
<!-- 메뉴들 -->	            
	              <li class="active"><a href="#">메뉴1</a></li>
	              <li><a href="#about">메뉴2</a></li>
	              <li><a href="#contact">메뉴3</a></li>
	              <li><a href="#contact">메뉴4</a></li>
	              <li><a href="#contact">메뉴5</a></li>
	              <li><a href="#contact">메뉴6</a></li>
	              <li><a href="#contact">메뉴7</a></li>
	              <li><a href="#contact">메뉴8</a></li>
	              
	              <li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">드롭메뉴!! <span class="caret"></span></a>
	                <ul class="dropdown-menu" role="menu">
	                  <li><a href="#">Action</a></li>
	                  <li><a href="#">Another action</a></li>
	                  <li><a href="#">Something else here</a></li>
	                  <li class="divider"></li>
	                  <li class="dropdown-header">Nav header</li>
	                  <li><a href="#">Separated link</a></li>
	                  <li><a href="#">One more separated link</a></li>
	                </ul>
	              </li>
	            </ul>
	            
	            <!-- 검색창 -->
	            <div class="search_main">
	      <div class="search_inner">
	         <form action="/second/shop" method="post">
	            <fieldset>
	               
	               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	               
	              <select name="searchType">
	                 <option value="n">-----</option>
	                 <option value="title">상품명</option>
	                 <option value="content">내용</option>
	                 <option value="brand">브랜드</option>
	              </select>
	                <input type="text" class="txt" placeholder="Search" name="keyword"/>&nbsp;
	                <input type="submit" value="검색" class="search_btn" onClick="onSearch()"/>
	                
	                
	          </div><!--/.nav-collapse -->
	   </div>
      </nav>
     	 

<!--//메뉴 끝-->