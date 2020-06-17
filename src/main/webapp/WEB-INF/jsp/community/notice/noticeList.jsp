<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
 
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

a{
   color: #000;
   text-decoration: none;
}
.btn{
    width: 100px;
    background-color: #fff;
    border: 1px solid #80EB1C;
    color: #000;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius: 10px;
}

#main-container{
   width:1100px;
   align:center;   
   font-family: 'Nanum Gothic';
   font-size:15px;
}

#content{
	width:1120px;
	margin-left:50px;
}
body {
    margin: 0;
    padding: 0;
}
button {
  background:none;
  border:0;
  outline:0;
  cursor:pointer;
}
.tab_menu_container {
  display:flex;
}
.tab_menu_btn {
  width:80px;
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
	font-family: 'Nanum Gothic';
}


</style>

</head>
<body> 
<div id="content">
	
	<div class="tab_wrap">
  <div class="tab_menu_container">
    <a href="noticeList"><button class="tab_menu_btn on" type="button">공지사항</button></a>
    <a href="boardList"><button class="tab_menu_btn" type="button">자유게시판</button></a>
    <a href="reportList"><button class="tab_menu_btn" type="button">신고게시판</button></a>
    <a href="qnaList"><button class="tab_menu_btn" type="button">Q&A게시판</button></a>
  </div>
  </div>
  
	<div id="main-container">
	<h2>공지사항</h2>
	<table align="center" class="table table-striped table-condensed">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="25%" />  
			<col width="10%" />
		</colgroup>
		<caption><h2>공지사항2</h2></caption>
		<thead>
			<tr>
				<th style=text-align:center; scope="col">글번호</th>
				<th style=text-align:center; scope="col">제목</th>
				<th style=text-align:center; scope="col">작성자</th>
				<th style=text-align:center; scope="col">작성일</th>
				<th style=text-align:center; scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<!-- 스크립트를 통해 게시글에 대한 정보가 담김 -->
		</tbody>
	</table>
	<div id="PAGE_NAVI" align="center" style="background-color:white;">
	
		<!-- 페이징 정보가 담김 b1--></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		<div align="right">
			<c:if test="${session_MEM_ID == 'admin' }">  
				<a href="noticeWriteForm"><button type="button" class="btn">글쓰기</button></a>
	  	 	</c:if>
		</div>
		
	</div>
	
	
</div>



	<br />	

	<script type="text/javascript">
		$(document).ready(function() {
			console.log('1111');///1찍
			fn_selectBoardList(1);
			$("#write").on("click", function(e) { //글쓰기 버튼
			
				e.preventDefault();
				fn_openBoardWrite();
			
			});
			console.log('1112');///2찍
			
			$("a[name='title']").on("click", function(e) { //제목 
				console.log('1116');
				e.preventDefault();
				console.log('1119');
				fn_openBoardDetail($(this));
			});
			console.log('1113');///3찍
		});
		
		function fn_openBoardWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/noticeWriteForm' />");
			comSubmit.submit();
		}
	
		function fn_openBoardDetail(obj) {
			<!-- 디스 달리면 이게 동작 안하는지 파악하자. b1-->
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/noticeDetail' />");
			comSubmit.addParam("NOTICE_NUM", obj.parent().find("#NOTICE_NUM").val());
			comSubmit.submit();
		}
		function fn_selectBoardList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/community/noticeListPaging' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}

		function fn_selectBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr align=\"center\">" + "<td colspan='5'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					recordCount : 15,
					eventName : "fn_selectBoardList"
					
				};
				gfn_renderPaging(params);

				var str = "";
				
				$.each(data.list,
				function(key, value) {
					str += "<tr style=\"text-align: center\">"
							+ "<td>"
							+ value.NOTICE_NUM
							+ "</td>"
							+ "<td class='title'>"
							+ "<a href='#this' name='title' >"
							+ value.NOTICE_TITLE
							+ "</a>"
							+ "<input type='hidden' id='NOTICE_NUM' value=" + value.NOTICE_NUM + ">"
							+ "</td>" + "<td>" + '관리자'
							+ "</td>" + "<td>" + new Date(value.NOTICE_DATE).toLocaleString()
							+ "</td>" + "<td>" + value.NOTICE_COUNT
							+ "</td>" + "</tr>";
								});
				body.append(str);

				$("a[name='title']").on("click", function(e) { //페이징 처리 후 제목 클릭 시 디테일 진입
					e.preventDefault();
					fn_openBoardDetail($(this));
				});
			}
		}
	</script>
</body>
</html>