<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">

   <style>
   @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
a{
   color: #000;
   text-decoration: none;	
}
html {
      height: 100%;
   }
   
body {
	    background:white;
	    margin: 0;
	    padding: 0;
   }
body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{
   font-family:'맑은 고딕',Malgun Gothic,sans-serif;
   font-size:12px;
   color:#666;
   font-weight:400;}
   
.card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        border:1px solid #ccc;
   }
   
   .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
   }
   
   #log{
   		
   }

   h1 {
    font-size: 20px;
    font-weight: bold;
}
   </style>
   <%-- <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script> --%>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  
</head>
<body onload="begin()" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
   <form name="myform" id="log" action="login" method="post" class="form-signin" style="clear:both">
   
   
      <div class="card align-middle" style="width:30rem; border-radius:10px; height:300px; ">
         <div>
         
            <div class="card-title">
               <p style="font-weight: bold;font-size: 20px;padding-top: 20px;}">로그인</p>
            </div>
            
            <div class="card-body" style="margin-top:20px;">   
               <INPUT type="text" name="MEM_ID" id="MEM_ID" size="30" maxlength="12" class="form-control" placeholder="Your ID"><br>  
            </div>
   
            <div class="card-body" style="margin-top:20px;">
               <INPUT type=password name="MEM_PW" id="MEM_PW" size="30" maxlength="12" class="form-control" placeholder="Password"> <br>
            </div>
         
            <div class="card-body" style="margin-top:20px;">
               <input type="button" class="btn" value="로그인" onclick="fsubmit();">
            </div>
         
            <div align="center" style="margin-top:10px;">
               <label>
                  <input type="checkbox" id ="idSaveCheck" value="idSaveCheck" >&nbsp;아이디저장
               </label>
            </div> 
            
         </div>
      </div>
      
      
      
   </form>
   
   <div align="center">
      <input type="button" value="회원가입" onclick="location.href='/second/joinForm'" class="btn"/>&nbsp;<input type="button" value="ID/PW 찾기" onclick="location.href='/second/findId'" class="btn"/>
    </div>

</body>
<script type="text/javascript">

      function begin(){
         document.myform.MEM_ID.focus();
       }
       function checkIt(){
         if(!document.myform.MEM_ID.value){
           alert("아이디를 입력하지 않으셨습니다.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.MEM_PW.value){
           alert("비밀번호를 입력하지 않으셨습니다.");
           document.myform.passwd.focus();
           return false;
         }

       }
       
       function fsubmit(){
          var id = $("#MEM_ID")[0].value;
          var pw = $("#MEM_PW")[0].value;
          if(id==null || id==''){
             alert("아이디를 입력하세요.");
             return false;
          }
          if(pw==null || pw==''){
             alert("비밀번호를 입력하세요.");
             return false;
          }
          myform.submit();
       }
       
       $(document).ready(function(){
          
          // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
          var userInputId = getCookie("userInputId");
          $("#MEM_ID").val(userInputId);  
          
          if($("#MEM_ID").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
             $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
          }
          
          $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
             if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
                var userInputId = $("#MEM_ID").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
             }else{ // ID 저장하기 체크 해제 시,
                deleteCookie("userInputId");
             }
          });
          
          // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
          $("#MEM_ID").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
             if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
                var userInputId = $("#MEM_ID").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
             }
          });
       });
       
       
        
       function setCookie(cookieName, value, exdays){ //쿠키 저장하는 함수
           var exdate = new Date();
           exdate.setDate(exdate.getDate() + exdays); //설정 일수만큼 현재시간에 만료값으로 지정
           var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
           document.cookie = cookieName + "=" + cookieValue;
       }
        
       function deleteCookie(cookieName){ //쿠키 삭제
           var expireDate = new Date();
           expireDate.setDate(expireDate.getDate() - 1);
           document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
       }
        
       function getCookie(cookieName) { //쿠키 가져오는 함수
           cookieName = cookieName + '=';
           var cookieData = document.cookie;
           var start = cookieData.indexOf(cookieName);
           var cookieValue = '';
           if(start != -1){
               start += cookieName.length;
               var end = cookieData.indexOf(';', start);
               if(end == -1)end = cookieData.length;
               cookieValue = cookieData.substring(start, end);
           }
           return unescape(cookieValue);
       }
   </script>
</HTML>