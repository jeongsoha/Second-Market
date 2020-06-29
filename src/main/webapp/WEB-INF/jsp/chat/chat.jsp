<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>chating</title>
</head>
<body>
    <div>
        <input type="text" id="sender" value="${session_MEM_ID}" style="display: none;">
        <input type="text" id="messageinput">
    </div>
    <div>
        <button type="button" onclick="openSocket();">채팅참여</button>
        <button type="button" onclick="send();">메시지발송</button>
        <button type="button" onclick="closeSocket();">채팅나가기</button>
    </div>
    <!-- Server responses get written here -->
    <div id="messages"></div>
    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages=document.getElementById("messages");
        
        function openSocket(){
        	session_chk();
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                writeResponse("현재 채팅방에 입장한 상태입니다.");
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
        
        function send(){
     
            var text=document.getElementById("sender").value+","+document.getElementById("messageinput").value;
            ws.send(text);
            text="";
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
 