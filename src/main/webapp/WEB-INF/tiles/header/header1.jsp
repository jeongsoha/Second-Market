<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/layout.css'/>" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 

  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>

<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<style type="text/css">
   @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
   
   
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
         margin-left: 100px;
         clear:both;
   }
   
   #h1{
         float:left;
         width:24%;
         margin: 3px 0px 15px 70px;
         display: inline;
   }
   
   #h2{
         float:left;
         width:30%;
         margin: 15px 0px 10px 20px; 
         display: inline;
   }
   
   #menubar{
         float:left;
         width:130px;
         margin: 14px 0px 5px -10px; 
         display: inline;
         font-size: 12px;
   }
   
   #menu{
         width:100%;
         margin: 1px 10px 10px auto;
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
         margin: 3px 110px 0 0;
         font-size: 12px;
   }
   
   #h5{
         float:left;
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
         height:25px;
         /*background:linear-gradient(to bottom right, #2db400, #77E56F); */
         background:#80EB1C;
         position: relative;
         zoom: 1;
         min-width:1300px;
   }
   
  
   
   
   .green_window {
      display: inline-block;
      width: 250px; height: 34px;
      margin-left:0px;
      border: 1px solid #80EB1C;
      background: white;
      border-radius: 5px;
   }
   
   .input_text {
   width: 240px;
      height: 21px;
      margin: 3px 0px 103px 3px;
      border: 0;
      line-height: 21px;
      font-size: 16px;
      outline: none;
   }
   
   .sch_smit {
      width: 54px; height: 35px;
      margin: 0; border: 0;
      vertical-align: top;
      background: #80EB1C;
      color: white;
      font-weight: bold;
      border-radius: 1px;
      cursor: pointer;
   }
   
   .sch_smit:hover {
      background: #56C82C;
   }
   
   #input_text{
   	    text-indent: 5px;
    	font-size: 15px;
    	background: #fff;
   }
   #bell{
      width:55px;
      height:55px;
   }
	.dropbtn {
	    background-color: #80EB1C;
	    /* 	    padding: 16px; */
	    font-size: 16px;
	    border: none;
	    cursor: pointer;
	    height: 24px;
	}
	.dropdown {
       /*  float:left; */
	    position: relative;
	    display: inline-block;
	  
	}
	.dropdown-content {
		 float:left;
	    display: none;
	    position: absolute;
	    background-color: #f9f9f9;
	    min-width: 260px;
	    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	    z-index: 2;
	}
	.dropdown-content a {
		float:left;
	    color: black;
	    padding: 12px 16px;
	    text-decoration: none;
	    display: block;
	}
	.dropdown-content a:hover {
		float:left;
	    background-color: #f1f1f1;
	    z-index: 2;
	}
	.dropdown:hover .dropdown-content {
	    display: block;
	}
	.dropdown:hover .dropbtn {
	    /*
	    background-color: #3e8e41;
	    */
	} 
	
.shopbtn {	
	width:80px;
	height: 35px;
    background-color: #fff;
    border:1px solid #80EB1C;
    color:#000;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius:20px;
}
.shopbtn:hover {
  /*   background-color: #74C043; */
  	background-color: #80EB1C;
    color:#fff;
}
.imgser1{
	float:left;
	margin-right:-5px;
	margin-top:-10px;
	clear:both;
}
.imgser2{
	float:left;
	margin-right:-5px;
	margin-top:-8px;
	clear:both;
}
.imgser3{
	float:left;
	margin-right:5px;
	margin-top:-8px;
	clear:both;
}
.a_menu{
	font-size: 15px;
	vertical-align: middle;
	font-weight: bold;
}
.d_menu{
	clear: both;
    float: left;
    width: 40%;
    margin-top: 23px;
}




*{
        margin: 0; padding: 0;
      }
      .slide{
        width: 1000px;
      	
        height: 250px;
        overflow: hidden;
		position: absolute;
   		margin: auto 100px; /* 배너위치 조정*/
      }
      .slide ul{
        width: 5000px;
        position: absolute;
        top:0;
        left:0;
        font-size: 0;
      }
      .slide ul li{
        display: inline-block;
      }
      #back{
        position: absolute;
        top: 100px;
        left: 0;
        cursor: pointer;
        z-index: 1;
        height: 40px;
    	width: 40px;
      }
      #next{
        position: absolute;
        top: 100px;
        right: 0;
        cursor: pointer;
        z-index: 1;
        height: 40px;
    	width: 40px;
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
              timeout: 3000000, //3000
              complete: setTimeout(function() { poll(); }, 10000000) //10000
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

      
      

      $(document).ready(function(){
          var imgs;
          var img_count;
          var img_position = 1;

          imgs = $(".slide ul");
          img_count = imgs.children().length;

          //버튼을 클릭했을 때 함수 실행
          $('#back').click(function () {
            back();
          });
          $('#next').click(function () {
            next();
          });

          function back() {
            if(1<img_position){
              imgs.animate({
                left:'+=1000px'
              });
              img_position--;
            }
          }
          function next() {
            if(img_count>img_position){
              imgs.animate({
                left:'-=1000px'
              });
              img_position++;
            }
          }


          //이미지 끝까지 가면 버튼 사라지기


          //첫 이미지로 돌아오기


        });
</script>


<!-- 초록색 줄 -->
<div id="header" >

<div id="menu">
	<!-- 비로그인 시 -->
    <div id="h4"> 
         <c:if test="${session_MEM_ID == null }">
            <a href="${contextPath}/second/loginForm" class="log">로그인</a>  &nbsp;&nbsp;
            <a href="${contextPath}/second/joinForm">회원가입</a>              &nbsp;&nbsp;
            <a href="${contextPath}/second/findId">ID/PW찾기</a>             &nbsp;&nbsp;
         </c:if>
    </div>
    <!-- 로그인 시 -->
    <div id="h4">
         <c:if test="${session_MEM_ID != null }">
         <c:if test="${session_MEM_ID == 'admin' }">
             <a href="/second/admin">관리자페이지</a> &nbsp;&nbsp;
          </c:if>
               <a href="${contextPath}/second/logout" class="log">로그아웃</a> &nbsp;&nbsp;
               <a href="${contextPath}/second/myPage">마이페이지</a>           &nbsp;&nbsp;
               <a href="${contextPath}/second/myshop">내상점</a>              &nbsp;&nbsp;
         </c:if>
       </div>
       
 		
 <!-- 로그인o -->
    
             <div id="h7"> 
                   <c:if test="${session_MEM_ID != null }">
                    <a href="#" style="font-color:#666; font-size:12px;" class="tab_a1"><span>${session_MEM_ID}&nbsp;님</span></a>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>
                    
                   <!-- 로그인 o  알림버튼 -->      
     
        <c:if test="${session_MEM_ID != null}">
   		  <div class="dropdown">
       		 <button class="dropbtn"><img style="width:24px; height:22px;" src="<c:url value="/resources/images/ring.png"/>"/></button>
     			<div class="dropdown-content">
        		      <table id="inform">
        		         <tbody>
      			           </tbody>
    		          </table>
       		   </div>
       		   &nbsp;&nbsp;&nbsp;
    	 </div>
       </c:if>
         </div>
</div></div>

    <div class="header_box">
		<!-- second로고 -->
   
   <div class="header_area" id="h1">
      <a href="/second/shop/allGoodsList" title="second#"><img class="main_image" src="<c:url value="/resources/images/logo6.png"/>" 
      		style="display: block; max-width:250px; margin-left: 0px;" alt="second#"/></a>
   </div>
   
   
<!-- 검색창 -->

       <div class="search_main" id="h2">
         <div class="search_inner">

         
            <form action="/second/shop" method="post">
             
               <fieldset>
                                 
               <span class='green_window'>
                <input type='text' class='input_text' placeholder="Search" maxlength="20"  name="keyword" id="keyword" value="${keyword}"  />
				<input type="hidden" id="searchType" value="all" />
				
               </span>
               <button type='submit' class='sch_smit' onClick="onSearch()">검색</button>
              
               
               </fieldset>
            </form>

            
         </div>
         </div>
<!--          
드롭메뉴         
         <div class="container" id="menubar">
         
            <div class="panel-group">
              <div class="panel panel-default">
                <div class="panel-heading" style="height: 35px;color: #a5a5a5;">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" href="#collapse1">Category</a>
                  </h4>
                </div>

                <div id="collapse1" class="panel-collapse collapse">
                  <ul class="list-group">
                     <li class="list-group-item"><a href="/second/shop/allGoodsList">의류</a></li>
                     <li class="list-group-item"><a href="/second/shop/allGoodsList">전자기기</a></li>
                     <li class="list-group-item"><a href="/second/shop/allGoodsList">악세서리</a></li>
                     <li class="list-group-item"><a href="/second/shop/allGoodsList">기타</a></li>
                  </ul>
                  <div class="panel-footer"><a href="/second/community/qnaList">Q&A</a></div>
                </div>
              </div>
            </div>
      </div>
       -->

 		
      <!-- 로그인 o,x -->
         <div class="tab_cate" id="h5" style="width: 350px; padding : 0 15px ;">    

              <div style="float: left;width: 30%; height:35px; margin-top: 23px;">
                 <a href="/second/shop/allGoodsList" class="a_menu"> <img style="width:50px;" class="imgser1" src="<c:url value="/resources/images/sell1.png"/>"/>
                 	쇼핑몰</a>  
              </div>
              <div style="float: left;width: 30%; height:35px; margin-top: 23px;">
                 <a href="/second/community/noticeList" class="a_menu"><img style="width:40px;" class="imgser2" src="<c:url value="/resources/images/sell2.png"/>"/>
                 	게시판</a>  
              </div>
      		 <div style="float: left;width: 40%; height:35px; margin-top: 23px;">
                 <a href="/second/chat" class="a_menu"><img style="width:40px;" class="imgser3" src="<c:url value="/resources/images/sell3.png"/>"/>
                 	왁자지껄</a>  
              </div>
         </div>
                  
   <br><br><br>
   

  <div class="slide">
      <img id="back" src="<c:url value="/resources/images/back.png"/>" alt="" width="100">
      <ul>
        <li><img src="<c:url value="/resources/images/ka01.png"/>" alt="" width="1000" height="250" style="border:2px dashed #ccc;"></li>
        
        <li><img src="<c:url value="/resources/images/ka02.png"/>" alt="" width="1000" height="250" style="border:2px dashed #ccc;"></li>
        <li><img src="<c:url value="/resources/images/ka03.png"/>" alt="" width="1000" height="250" style="border:2px dashed #ccc;"></li>
        <li><img src="<c:url value="/resources/images/ka04.png"/>" alt="" width="1000" height="250" style="border:2px dashed #ccc;"></li>
        <li><img src="<c:url value="/resources/images/ka05.png"/>" alt="" width="1000" height="250" style="border:2px dashed #ccc;"></li>
      </ul>
      <img id="next" src="<c:url value="/resources/images/next.png"/>" alt="" width="100">
    </div>
    
      </div>