<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/layout.css'/>" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
   		clear:both;
   }
   
   #h1{
   		float:left;
   		width:30%;
   		margin: 30px 0px 15px 0px;
   		display: inline;
   		
   }
   
   #h2{
   		float:left;
   		width:30%;
   		margin: 100px 0px 85px 100px; 
   		display: inline;
   }
   
   #menubar{
   		float:left;
   		width:30%;
   		display: inline;
   }
   
   #menu{
   		width:100%;
   		margin: 10px 10px 10px auto;
   		clear:both;
   		float:right;
   }
   
   #h3{
   		float:right;
   		display: inline;
   }
   
   #h4{
   		float:right;
   		display: inline;
   }
   
   #h5{
   		float:right;
   		display: inline;
   }
   
   #h6{
   		float:right;
   		display: inline; 
   }
   
   #h7{
   		float:right;
   		display: inline; 
   }
   
   #header{
   		width:100%;
   		height:20px;
   		background-color:#2db400;
   }
   
   
   .green_window {
		display: inline-block;
		width: 366px; height: 34px;
		border: 3px solid #2db400;
		background: white;
	}
	
	.input_text {
		width: 348px; height: 21px;
		margin: 6px 0 0 9px;
		border: 0;
		line-height: 21px;
		font-size: 16px;
		outline: none;
	}
	
	.sch_smit {
		width: 54px; height: 35px;
		margin: 0; border: 0;
		vertical-align: top;
		background: #22B600;
		color: white;
		font-weight: bold;
		border-radius: 1px;
		cursor: pointer;
	}
	
	.sch_smit:hover {
		background: #56C82C;
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
	              
	              
	               <span class='green_window'>
						<input type='text' class='input_text' placeholder="Search" maxlength="20"  />
					</span>
					
					<button type='submit' class='sch_smit' onClick="onSearch()">검색</button>
					
	            </fieldset>
	         </form>

	         
	      </div>
	      </div>
	      
<!-- 드롭메뉴 -->	      
	      <div class="container" id="menubar">
		  <p>Click!</p>
		  <div class="panel-group">
		    <div class="panel panel-default">
		    
		      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" href="#collapse1">Collapsible list group</a>
			        </h4>
		      </div>
		      
		      <div id="collapse1" class="panel-collapse collapse">
			        <ul class="list-group">
			          <li class="list-group-item">One</li>
			          <li class="list-group-item">Two</li>
			          <li class="list-group-item">Three</li>
			        </ul>
		        <div class="panel-footer">Footer</div>
		      </div>
		      
		    </div>
		  </div>
		</div>
	      
	      
</div>

















