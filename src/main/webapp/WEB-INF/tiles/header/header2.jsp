<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/inform.css'/>" />
<style>
a {color:#666;}
</style>
<script type="text/javascript">
   
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
<!-- header_area 마이페이지 / 내상점에 쓰임-->
<div class="header_area" align="center">
	<h1><a href="/second/main" title="second"><img src="/second/resources/images/SkinImg/mainlogo2.png" alt="second" style="width:200px;" align="center"/></a></h1>		

	<div class="top_menu">
		<ul>
			<c:if test="${session_MEM_ID == null }">
			<li><a style="color:#666;" href="${contextPath}/second/loginForm" class="log">로그인</a></li> 
			<li><a style="color:#666;" href="${contextPath}/second/joinForm">회원가입</a> </li>
			<li><a style="color:#666;" href="${contextPath}/second/findId">ID/PW찾기</a> </li>
			</c:if>
			<c:if test="${session_MEM_ID != null }">
			<li><p style="font-color:#666; font-size:12px;">${session_MEM_ID}&nbsp;님</p></li>	
				<c:if test="${session_MEM_ID == 'admin' }">
					<li><a style="color:#666;" href="/second/admin">관리자페이지</a></li> 	
				</c:if>
			<li><a style="color:#666;" href="${contextPath}/second/logout" class="log">로그아웃</a></li> 
			<li><a style="color:#666;" href="${contextPath}/second/myPage">마이페이지</a></li>
			<li><a style="color:#666;" href="${contextPath}/second/myshop">내상점</a></li> 
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

	
</div><!-- // header_area -->

