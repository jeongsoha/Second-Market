<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/inform.css'/>" />
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
	           url: '/nnS/inform/confirm',
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
	           url: '/nnS/inform',
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

<!--  Header 영역 / 마이페이지 , 내상점이 아닌 기본에 쓰임-->
<div class="header_area">
   <h1><a href="/nnS/main" title="nnS#"><img class="main_image" src="<c:url value="/resources/images/SkinImg/mainlogo.png"/>" alt="nnS#"/></a></h1>   
   <div class="search_main">
      <div class="search_inner">
         <form action="/nnS/shop" method="post">
            <fieldset>
               
               <select name="searchType">
                 <option value="n">-----</option>
                 <option value="title">상품명</option>
                 <option value="content">내용</option>
                 <option value="brand">브랜드</option>
                </select>
               <input type="text" class="txt" placeholder="Search" name="keyword"/>&nbsp;
               <input type="submit" value="검색" class="search_btn" onClick="onSearch()"/>
            </fieldset>
         </form>
      </div>
   </div>
   <div class="top_menu">
      <ul>
         <c:if test="${session_MEM_ID == null }">
         <li><a href="${contextPath}/nnS/loginForm" class="log">로그인</a></li> 
         <li><a href="${contextPath}/nnS/joinForm">회원가입</a> </li>
         <li><a href="${contextPath}/nnS/findId">ID/PW찾기</a> </li>
         
         </c:if>
         <c:if test="${session_MEM_ID != null }">
         <li><p style="font-color:#666; font-size:12px;">${session_MEM_ID}&nbsp;님</p></li>   
            <c:if test="${session_MEM_ID == 'admin' }">
               <li><a href="/nnS/admin">관리자페이지</a></li>    
            </c:if>
         <li><a href="${contextPath}/nnS/logout" class="log">로그아웃</a></li> 
         <li><a href="${contextPath}/nnS/myPage">마이페이지</a></li>
         <li><a href="${contextPath}/nnS/myshop">내상점</a></li> 
         </c:if>
      </ul>
      
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

<!-- 내상점 / 커뮤니티 창일 경우에 띄워주는 메뉴 시작 -->
<%-- <c:if test="${session_shopAndCommunity}"> --%>
   <div class="tab_cate">    
      <div class="tabs_area">  
         <ul class="tabs">
            <li><a href="/nnS/shop/allGoodsList" class="tab_a1"><span>쇼핑몰</span></a></li>
            <li><a href="/nnS/community/noticeList" class="tab_a2"><span>커뮤니티</span></a></li>
         </ul>
      </div>
   </div>
<%-- </c:if> --%>
<!--//메뉴 끝-->