<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){

/* 	댓글 목록 불러오기 */
	listReply("1");

	/* 댓글 쓰기 버튼 클릭 이벤트 */
	$("#btnReply").click(function(){
	var replytext=$("#replytext").val();
	var bno = "$(#bto.bno)"
/* 		비밀댓글 체크 여부 */
 	var secretReply="n";

/*  	태그.is(속성) 체크여부 */
 	 if(%("#secretReply".is(":checked")){
	secretReply="y";
	 }
	 /* 비밀댓글 파라미더 추가 */
	 var param ="replytext="+replytext+"&bno="+bno+"&secretReply="+secretReply+;
 	$.ajax({
type :"post",
url : "${path}/reply/insert",
data : param,
success : function(){
	alert("댓글이 등록 되었습니다.");
	lustReply("1");
}
 	 	})


		})

 		 /* 게시글 목록 이벤트 */
 		 $("#btnList").click(function(){
 	 		 location.href="${path}/board/list?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
 	 		 
 	 		 });

	 /* 게시글 삭제  */
	 $("#btnDelete").click(function(){
		 if(confirm("삭제 하시겠습니까?")){
		document.form1.action="${path}/board/delete";
		document.form1.submit();
			 }
		 });

	 /* 게시글 수정  */
	 $("#btnUpdate").click(function(){
		 var title = $("#title").val();
		 var content =$("#content").val();

		 if(titlw==""){
			alert("제목을 입력 하세요.");
			document.form1.title.focus();
			return;
				 }
		 if(content==""){
			alert("내용을 입력 하세요.");
			document.form1.content.focus();
			return;
			 }

		 document.form1.action="${path}/board/update"
		/* 폼에 입력한 데이터를 서버로 전송 */
			 document.form1.submit();
		 });
});

	/* Controller방식  */
	/* 댓글 목록 */
	function listReply(num){
		$.ajax({
		type : "get",
		url : "${path}/reply/list?bno=${dto.bno}&curPage="+num+,
		success : function(result){
			/* responseText가 result에 저장됨 */
$("#listReply").html(result);
			}

			});
		}


 /* RestController방식(Json) */
 function listReply2(){
$.ajax({
	type : "get",
	url : "${patg}/reply/listJson?bno=${dto.bno}",
	success : function(result){
		consol.log(result);
		var output = "<table>";
		for(var i in result){
		output += "<tr>"
		output +="<td>"+result[i].userName;
		output += "("+changDate(result[i].regdate)+")<br>";
		output += result[i].replytext+"<br>";
		output +=  "<tr>";
			}
		output +="</table>";
		$("#listReply").html(output);
		}	
	});
	 }

/* 	날짜 변환 함수 작성 */
  function changeDate(date){
	 date = new Date(parseInt(date));
	 year = date.getFullYear();
	 month = date.getMonth();
	 day = date.getDate();
	hour = date.getHours();
	 minute = date.getMinute();
	second = date.getSeconds();
	strDate =tear+"-"+month+"-"+day+"-"+hour+":"+minute+":"+second+;
	return strDate;
	 }

</script>
<style>
a{
   color: #000;
   text-decoration: none;
}
</style>

</head>
<body>
<h2>게시글 보기</h2>
<form name="form1" method="post">
<div>
작성 일자  : <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/>
</div>
<div>
조회수 : $dto.viewcnt}
</div>
<div>
제목
<input name="title" id="title" size="80" value="${dto.title}" placeholder="제목을 입력해주세요.">
</div>

<div>
내용
<textarea rows="4" cols="80" name="content" id="content" placeholder="내용을 입력해주세요.">${dto.content}</textarea>
</div>

<div>
이름
<input name="writer" id="writer"  value="${dto.writer}" placeholder="이름은 입력해 주세요.">${dto.writer}
</div>

<div style="wridth:650px; text-align: center;">
<!-- 게시물 번호 히든 처리 -->
<input name="hidden" id="bno" size="80" value="${dto.bno}">

<!-- 본인이 쓴 게시물만 수정, 삭제 -->
<c:if test ="${sessionScope.userId == dto.writer}">
<button type="button" id="btnUpdate">수정</button>
<button type="button" id="btnDelete">삭제</button>
</c:if>

	<!-- 상세보기 화면에서 게시글 목록화면으로 이동 -->
	<button type="button" id="btnList">목록</button>
	<hr>
	</div>
</form>

<div style="width:650px; text-align:center;">
<br>

<!-- 로그인한 회원에게만 댓긋 작성폼 보이게 -->
<c:if test="${sessionScope.userId !=null}">
<textarea row="5" cols="80" id="replytext" placeholder="댓글을 작성해주세요."></textarea>
<br>
<!-- 비밀댓글 체크박스 -->
<input type="checkbox" id="secretReply">비밀댓글
<button type="button" id="btnReply">댓글 작성</button>
</c:if>
<hr>
</div>

<!-- 댓글 목록 출력할 위치  -->
<div id="listReply"></div>
<!-- <div id="replyList"></div> -->



</body>
</html>