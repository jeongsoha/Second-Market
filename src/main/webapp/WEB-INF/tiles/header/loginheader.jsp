<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/layout.css'/>" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
<<<<<<< HEAD
   
   a {
         color:#666;
         text-align:right;
=======
	
   a {
   		color:#666;
   		text-align:right;
>>>>>>> jyj3-1
   }

   body {
        background:white;
   }
   
   #head{
<<<<<<< HEAD
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
         float:right;
         width:200px;
         margin: 100px 200px 85px 100px; 
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
=======
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
   		float:right;
   		width:200px;
   		margin: 100px 200px 85px 100px; 
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
>>>>>>> jyj3-1
   }
   
   
   .green_window {
<<<<<<< HEAD
      display: inline-block;
      width: 366px; height: 34px;
      border: 3px solid #2db400;
      background: white;
   }
   
   .input_text {
      width: 348px; height: 21px;
      margin: 3px 0px 3px 3px;
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
   
   #bell{
      width:55px;
      height:55px;
   }
=======
		display: inline-block;
		width: 366px; height: 34px;
		border: 3px solid #2db400;
		background: white;
	}
	
	.input_text {
		width: 348px; height: 21px;
		margin: 3px 0px 3px 3px;
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
	
	#bell{
		width:55px;
		height:55px;
	}
>>>>>>> jyj3-1


</style>


<script type="text/javascript">

   var onSearch = function(){   
      submit();  
   };
   
   $(document).ready(function() {
<<<<<<< HEAD
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
=======
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
	         alert(str);
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
	            alert(str);
	            body.append(str);
	      }
	   }
>>>>>>> jyj3-1

</script>


<!-- 초록색 줄 -->

<div id="header">
<<<<<<< HEAD
   
=======
	
>>>>>>> jyj3-1
</div>



<!-- 오른쪽 위 작은 메뉴들 -->

<<<<<<< HEAD
   <div id="menu">
=======
	<div id="menu">
>>>>>>> jyj3-1


<!-- 로그인 o  알림버튼 -->
      
      <c:if test="${session_MEM_ID != null}">
         <div class="dropdown" id="h6">
         <button class="dropbtn"><img style="width:30px; height:30px;" src="<c:url value="/resources/images/Bell.png"/>"/></button>
<<<<<<< HEAD
       </div>
       </c:if>
       
       
<!-- 로그인 x -->
    <div id="h3">
         <c:if test="${session_MEM_ID == null }">
            <a href="${contextPath}/second/loginForm" class="log">로그인</a>  &nbsp;&nbsp;
            <a href="${contextPath}/second/joinForm">회원가입</a>              &nbsp;&nbsp;
            <a href="${contextPath}/second/findId">ID/PW찾기</a>             &nbsp;&nbsp;
=======
                  <div class="dropdown-content">
             			 <table id="inform">
                	 <tbody>
                 </tbody>
              </table>
            </div>
       </div>
       </c:if>
       
   
<!-- 로그인 x -->
 	<div id="h3">
         <c:if test="${session_MEM_ID == null }">
	         <a href="${contextPath}/second/loginForm" class="log">로그인</a>  &nbsp;&nbsp;
	         <a href="${contextPath}/second/joinForm">회원가입</a>              &nbsp;&nbsp;
	         <a href="${contextPath}/second/findId">ID/PW찾기</a>             &nbsp;&nbsp;
>>>>>>> jyj3-1
         </c:if>
    </div>
         
         
<!-- 로그인 o,x -->
<<<<<<< HEAD
      
         <div class="tab_cate" id="h5">    
            <div class="tabs_area">  
               <class="tabs">
                  <a href="/second/shop/allGoodsList" class="tab_a1"><span>쇼핑몰</span></a>     &nbsp;&nbsp;
                 <a href="/second/community/noticeList" class="tab_a2"><span>커뮤니티</span></a>  &nbsp;&nbsp;
               </class>
            </div>
         </div>
         
<!-- 로그인o -->
      
      <div id="h4">
         <c:if test="${session_MEM_ID != null }">
         <c:if test="${session_MEM_ID == 'admin' }">
             <a href="/second/admin">관리자페이지</a>
          </c:if>
               <a href="${contextPath}/second/logout" class="log">로그아웃</a> &nbsp;&nbsp;
               <a href="${contextPath}/second/myPage">마이페이지</a>           &nbsp;&nbsp;
               <a href="${contextPath}/second/myshop">내상점</a>              &nbsp;&nbsp;
         </c:if>
       </div>
=======
		
		   <div class="tab_cate" id="h5">    
		      <div class="tabs_area">  
		         <class="tabs">
		            <a href="/second/shop/allGoodsList" class="tab_a1"><span>쇼핑몰</span></a>     &nbsp;&nbsp;
		           <a href="/second/community/noticeList" class="tab_a2"><span>커뮤니티</span></a>  &nbsp;&nbsp;
		         </class>
		      </div>
		   </div>
		   
<!-- 로그인o -->
		
		<div id="h4">
			<c:if test="${session_MEM_ID != null }">
			<c:if test="${session_MEM_ID == 'admin' }">
	          <a href="/second/admin">관리자페이지</a>
	       </c:if>
		         <a href="${contextPath}/second/logout" class="log">로그아웃</a> &nbsp;&nbsp;
		         <a href="${contextPath}/second/myPage">마이페이지</a>           &nbsp;&nbsp;
		         <a href="${contextPath}/second/myshop">내상점</a>              &nbsp;&nbsp;
		   </c:if>
    	</div>
>>>>>>> jyj3-1
 
 <!-- 로그인o -->
    
             <div id="h7"> 
<<<<<<< HEAD
                   <c:if test="${session_MEM_ID != null }">
                    <a href="#" style="font-color:#666; font-size:12px;" class="tab_a1"><span>${session_MEM_ID}&nbsp;님</span></a>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>
         </div>
=======
        			  <c:if test="${session_MEM_ID != null }">
					     <a href="#" style="font-color:#666; font-size:12px;" class="tab_a1"><span>${session_MEM_ID}&nbsp;님</span></a>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	     				</c:if>
			</div>
>>>>>>> jyj3-1
   
</div>



<div id="head">
<<<<<<< HEAD
   
<!-- second로고 -->
   
   <div class="header_area" id="h1">
      <h1><a href="/second/sample/openBoardList" title="second#"><img class="main_image" src="<c:url value="/resources/images/second.png"/>" style="margin-left: 200px; display: block;" alt="second#"/></a></h1>   
   </div>
         
<!-- 드롭메뉴 -->         
<!-- 
         <div class="container" id="menubar">
         
         
            <div class="panel-group">
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapse1">Category</a>
                  </h4>
                </div>

                <div id="collapse1" class="panel-collapse collapse">
                  <ul class="list-group">
                     <li class="list-group-item"><a href="/second/sample/openBoardList">패션의류</a></li>
                     <li class="list-group-item"><a href="/second/sample/openBoardList">가전제품</a></li>
                     <li class="list-group-item"><a href="/second/sample/openBoardList">패션잡화</a></li>
                     <li class="list-group-item"><a href="/second/sample/openBoardList">뷰티</a></li>
                     <li class="list-group-item"><a href="/second/sample/openBoardList">도서/음반</a></li>
                     <li class="list-group-item"><a href="/second/sample/openBoardList">티켓/쿠폰</a></li>
                  </ul>
                  <div class="panel-footer"><a href="/second/sample/openBoardList">Q&A</a></div>
                </div>
              </div>
            </div>
        
        
      </div>
  -->
         
=======
	
<!-- second로고 -->
	
	<div class="header_area" id="h1">
	   <h1><a href="/second/sample/openBoardList" title="second#"><img class="main_image" src="<c:url value="/resources/images/second.png"/>" style="margin-left: 200px; display: block;" alt="second#"/></a></h1>   
	</div>
	      
<!-- 드롭메뉴 -->	      
<!-- 
	      <div class="container" id="menubar">
	      
	      
				<div class="panel-group">
				  <div class="panel panel-default">
				    <div class="panel-heading">
				      <h4 class="panel-title">
				        <a data-toggle="collapse" href="#collapse1">Category</a>
				      </h4>
				    </div>

				    <div id="collapse1" class="panel-collapse collapse">
				      <ul class="list-group">
				      	<li class="list-group-item"><a href="/second/sample/openBoardList">패션의류</a></li>
				      	<li class="list-group-item"><a href="/second/sample/openBoardList">가전제품</a></li>
				      	<li class="list-group-item"><a href="/second/sample/openBoardList">패션잡화</a></li>
				      	<li class="list-group-item"><a href="/second/sample/openBoardList">뷰티</a></li>
				      	<li class="list-group-item"><a href="/second/sample/openBoardList">도서/음반</a></li>
				      	<li class="list-group-item"><a href="/second/sample/openBoardList">티켓/쿠폰</a></li>
				      </ul>
				      <div class="panel-footer"><a href="/second/sample/openBoardList">Q&A</a></div>
				    </div>
				  </div>
				</div>
		  
		  
		</div>
  -->
	      
>>>>>>> jyj3-1
    </div>
















<<<<<<< HEAD
=======

>>>>>>> jyj3-1
