<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ include
file="/WEB-INF/include/include-header.jspf" %>
<link
  rel="stylesheet"
  type="text/css"
  href="<c:url value='/resources/css/layout.css'/>"
/>
<link
  rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
/>
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
         margin: 3px 0px 15px 15px;
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
         /* background:linear-gradient(to bottom right, #2db400, #77E56F); */
         background:#80EB1C;
         position: relative;
         zoom: 1;
         min-width:1300px;
   }
   
   
   .green_window {
      display: inline-block;
      width: 350px; height: 34px;
      border: 1px solid #80EB1C;
      background: white;
      border-radius: 5px;
   }
   
   .input_text {
   width: 300px;
      height: 21px;
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
	    z-index: 1;
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
	    background-color: #f1f1f1
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
</style>


<script type="text/javascript">
  var onSearch = function () {
    submit();
  };

  $(document).ready(function () {
    poll();
  });

  function fn_InformConfirm(num) {
    $.ajax({
      url: "/second/inform/confirm",
      type: "GET",
      data: { INFORM_NUM: num },
      dataType: "json",
      success: function (data) {
        console.log("success"), updateCallback(data);
      },
    });
  }
  function updateCallback(data) {
    window.location.reload();
  }

  function poll() {
    $.ajax({
      url: "/second/inform",
      type: "GET",
      data: {},
      dataType: "json",
      success: function (data) {
        console.log("success"), callback(data);
      },
      timeout: 3000000, //3000
      complete: setTimeout(function () {
        poll();
      }, 10000000), //10000
    });
  }

  function callback(data) {
    var total = data.list;
    var body = $("#inform");
    body.empty();
    var str = "";
    if (total == 0) {
      str += "<tr>" + "<td colspan='4'>새로운 알림이 없습니다.</td>" + "</tr>";
      body.append(str);
      //alert(str);
    } else {
      $.each(data.list, function (key, value) {
        str +=
          "<a href='#this'  name='confirm' onClick='fn_InformConfirm(" +
          value.INFORM_NUM +
          ")'> " +
          new Date(value.INFORM_DATE).toLocaleString() +
          "<br/>" +
          value.INFORM_CONTENT +
          "<input type='hidden' id='INFORM_NUM' value=" +
          value.INFORM_NUM +
          ">" +
          "</a>";
      });
     // alert(str);
      body.append(str);
    }
  }
</script>

<!-- 초록색 줄 -->
<div id="header">
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
</div>

  <div class="header_box">
   
		<!-- second로고 -->
   
   <div class="header_area" id="h1">
      <a href="/second/shop/allGoodsList" title="second#"><img class="main_image" src="<c:url value="/resources/images/logo6.png"/>" 
      		style="display: block; max-width:250px; margin-left: 50px;" alt="second#"/></a>
   </div>
   

</div>
