<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">

<style type="text/css">
a{
   color: #000;
   text-decoration: none;
}
 @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

#main-container{
   width:1100px;
   align:center;
   font-family: 'Nanum Gothic';
}

#content{
	width:1120px;
	margin-left:50px;
}

/*메뉴버튼*/
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
	margin-bottom:50px;
}
/*메뉴버튼 끝*/

</style>

</head>
<body>
	<div id="content">
		
  <div class="tab_wrap">
  <div class="tab_menu_container">
    <a href="noticeList"><button class="tab_menu_btn" type="button">공지사항</button></a>
    <a href="boardList"><button class="tab_menu_btn on" type="button">자유게시판</button></a>
    <a href="reportList"><button class="tab_menu_btn" type="button">신고게시판</button></a>
    <a href="qnaList"><button class="tab_menu_btn" type="button">Q&A게시판</button></a>
  </div>
  </div>
  
		<div id="main-container">
			<h2>자유게시판</h2>
			<table align="center" class="table table-striped table-condensed">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="15%" />
					<col width="25%" />
					<col width="10%" />
				</colgroup>
				<caption>
					<h2>자유게시판</h2>
				</caption>
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody class="body">
					<!-- 스크립트를 통해 게시글에 대한 정보가 담김 -->
				</tbody>
			</table>
			<br />
			<div id="PAGE_NAVI" align="center"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			<div align="right">
				<c:if test="${session_MEM_INFO.MEM_ID != NULL }">
					<a href="#this" id="write"><button class="btn">글쓰기
						</button></a>
				</c:if>
			</div>
		</div>
	</div>
	<br />


	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_selectBoardList(1);
			$("#write").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});

			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});

		function fn_openBoardWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/boardWriteForm' />");
			comSubmit.submit();
		}

		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/boardDetail' />");
			comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM")
					.val());
			comSubmit.submit();
		}
		function fn_selectBoardList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/community/boardListPaging' />");
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
				var str = "<tr align=\"center\">"
						+ "<td colspan='5'>조회된 결과가 없습니다.</td>" + "</tr>";
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
				$
						.each(
								data.list,
								function(key, value) {
									str += "<tr style=\"text-align: center\">"
											+ "<td>"
											+ value.BOARD_NUM
											+ "</td>"
											+ "<td class='title'>"
											+ "<a href='#this' name='title'>"
											+ value.BOARD_TITLE
											+ "</a>"
											+ "<input type='hidden' id='BOARD_NUM' value=" + value.BOARD_NUM + ">"
											+ "</td>"
											+ "<td>"
											+ value.MEM_ID
											+ "</td>"
											+ "<td>"
											+ new Date(value.BOARD_DATE)
													.toLocaleString() + "</td>"
											+ "<td>" + value.BOARD_COUNT
											+ "</td>" + "</tr>";
								});
				body.append(str);
			}
		}
	</script>
</body>
</html>