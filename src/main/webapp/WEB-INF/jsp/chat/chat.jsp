<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>chating</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
td{
	margin:0 0 0 10px
}
td img
{
	width:250px; 
	height:250px;
	margin:10px 10px 10px 0px; 
	border:3px solid #000; 
}
   html {
      height: 100%;
   }
   
   body {
        background:white;
   }
   body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{
   font-family:'Nanum Gothic',sans-serif;
   font-size:14px;
   color:#666;
   font-weight:400;}
   }
   #main-container{
   width:1100px;
   align:center;
   font-family: 'Nanum Gothic';
   font-size:15px;
}
   
</style>

<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
html, body, div, span, applet, object, iframes, h1, h2, h3, h4, h5, h6,
   p, blockquote, pre, a, abbr, acronym, address, big, quotes, code, del,
   dfn, em, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, u,
   i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
   caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
   details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
   output, ruby, section, summary, time, mark, audio, video {
   margin: 0;
   padding: 0;
   border: 0;
   
   do: inherit;
   vertical-align: baseline;
}
article, aside, details, figcaption, figure, footer, header, hgroup,
   menu, nav, section {
   display: block;
}
blockquote, q {
   quotes: none;
}
blockquote : before, blockquote : after, q : before, q : after {
   content: '';
   content: none;
}
table {
   border-collapse: collapse;
   border-spacing: 0;
}
/*css 초기화*/
.card {
   float:left;
   height: 400px;
   width: 25%;
   border-radius: 15px;
   display: inline-block;
   margin-top: 30px;
   margin-left: 50px;
   margin-bottom: 30px;
   position: relative;
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   overflow: hidden;
}
.card-header {
   -webkit-transition: 0.5s; /*사파리 & 크롬*/
    -moz-transition: 0.5s;  /*파이어폭스*/
    -ms-transition: 0.5s;   /*인터넷 익스플로러*/
    -o-transition: 0.5s;  /*오페라*/
    transition: 0.5s;
   width: 100%;
   height: 270px;
   border-radius: 15px 15px 0 0;
   background-image: url("resources/images/no_image.png");
   background-size: 100% 280px;
   background-repeat: no-repeat;   
}
 

h1 {
    font-size: 22px;
    font-weight: bold;
}
.card-body {
}
.card-body-header{
   line-height: 25px;
   margin: 10px 20px 0px 20px;
}
.card-body-description  {
    opacity: 0;
    color: #757B82;
    line-height: 25px;
    -webkit-transition: .2s ease-in-out; /*사파리&크롬*/
    -moz-transition: .2s ease-in-out; /*파이어폭스*/
    -ms-transition: .2s ease-in-out; /*익스플로러*/
    -o-transition: .2s ease-in-out; /*오페라*/
    transition : .2s ease-in-out;
    overflow: hidden;
   height: 180px;
   margin: 5px 20px;
}
 
}



.reg_date {
	margin-left: 15px;
   float: ;
}
/*메뉴버튼*/
button {
  background:none;
  border:0;
  outline:0;
  cursor:pointer;
}

.tab_menu_btn {
  width:120px;
  height:40px;
  transition:0.3s all;
}
.tab_menu_btn.on {
  border-bottom:2px solid #df0000;
  font-weight:700;
  color:#df0000;
}
.tab_menu_btn:hover {
  color:#df0000;
}
.tab_menu_container{
	float:right;
	margin-right:100px;
	font-family: 'Nanum Gothic';
	font-size:20px;
	font-weight:700;
	margin-bottom:10px;
}

.tab_menu_container button{
	font-family: 'Nanum Gothic';
	font-size:17px;
	font-weight:700;
	margin-bottom:10px;
}

	.main-container{
		float:right;
	    clear:both;
	    margin-right:100px;
	    font-family: 'Nanum Gothic';
	}
	
	/*채팅입력창*/	
	#messages{
		width:auto;
		margin-left:50px;
	}
		
	
		#menu{
		clear:both;
		/* margin:0px auto 100px auto; */
		 
	}
	
	#con{
		margin: auto 100px auto 100px;
	}
	#dot{
		margin:0px auto;
	}
a{
	font-size:12px;
	color: #000;
}
</style>


</head>
<body>
    
      
     <div class="tab_menu_container">
        <button type="button" onclick="openSocket();">[채팅 입장]</button>
        <button type="button" onclick="send();">[메시지 발송]</button>
        <button type="button" onclick="closeSocket();">[채팅 나가기]</button>
    </div>
    <div class="main-container">
        <input type="text" id="sender" value="${session_MEM_ID}" style="display: none;">
        <input type="text" style="border:2px solid #bcbcbc;width:300px" id="messageinput" name="messageinput" value="" placeholder="메시지를 입력해주세요.1">
    </div>
	
    <div class="card align-middle" style="overflow:auto;border-radius:20px; background-color:#fff; margin-top:-50px; margin-left:150px;width:50%; height:500px;">
    <!-- Server responses get written here 채팅내용 보여지는 란-->
    <div id="messages"></div>
    </div> 

    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages=document.getElementById("messages");
        
        function openSocket(){
        	session_chk();
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                writeResponse("== 현재 채팅방에 입장한 상태입니다. ==");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws=new WebSocket("ws://localhost:8080/second/echo.do");
           
            ws.onopen=function(event){
                if(event.data===undefined) return;
                
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("== 왁자지껄 채팅방을 나갔습니다. ==");
            }
        }

     
        	
        $('#messageinput').keydown(function(event) {
     	//입력창에 커서가 올라간 상태에서 엔터키를 누르면
       	  if (event.keyCode == '13') {
       		
      		send();
      	    //alert('엔터를 누르셨습니다.');
      	  }
      	  
      	});

        
        function send(){
        	if(ws==undefined || ws.readyState==WebSocket.CLOSED){
                writeResponse("== 채팅입장 후 대화가 가능합니다. ==");
                return;
                
            } else if(document.getElementById("messageinput").value == ""){
                writeResponse("== 작성내용이 없습니다. ==");
                return ;
                
            }

            var text=document.getElementById("sender").value+","+document.getElementById("messageinput").value;
            
            ws.send(text);
            text = "";

          	document.getElementById("messageinput").value="";
        }
        
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            messages.innerHTML+="<br/>"+text;
        }

        function session_chk(){
			if("${session_MEM_ID}" == null || "${session_MEM_ID}" == "" ){

				alert("로그인 후 채팅 참여가 가능합니다.");

				location.href = '/second/loginForm';
				return false;
			}else{
				return true;
			}
		}

		
  </script>
</body>
</html>
 