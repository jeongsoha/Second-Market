<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
</head>
<body>
<div id="content">
	<div id="vertical_tab-container">
	<ul>
		<li class="selected"><a href="noticeList"><img src="./../resources/images/tab_notice.png" width="100" height="30"></a></li>
         <li><a href="boardList"><img src="./../resources/images/tab_board.png" width="100" height="30"></a></li>
         <li><a href="reportList"><img src="./../resources/images/tab_report.png" width="100" height="30"></a></li>
         <li><a href="qnaList"><img src="./../resources/images/tab_qna.png" width="100" height="30"></a></li>
	</ul>
	</div>
	<div id="main-container">
	<img src="./../resources/images/commu_ntitle.png" width="200" height="70"> 
	<table border="1" align="center" class="tbl_type">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="25%" />  
			<col width="10%" />
		</colgroup>
		<caption><h2>공지사항</h2></caption>
		<thead>
			<tr>
				<th scope="col"><img src="./../resources/images/commu_num.png" width="70" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_title.png" width="70" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_writer.png" width="70" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_date.png" width="70" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_hit.png" width="70" height="25"></th>
			</tr>
		</thead>
		<tbody>
			<!-- 스크립트를 통해 게시글에 대한 정보가 담김 -->
		</tbody>
	</table>
	<div id="PAGE_NAVI" align="center"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		<div align="right">
		  	<c:if test="${session_MEM_INFO.MEM_LEVEL == '2' }">
				<a href="#write" class="btn" id="write"><button class="bttn-bordered bttn-xs bttn-primary">글쓰기</button></a>
	  	 	</c:if>  
		</div>
	</div>
	</div>

	<br />	

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
			comSubmit.setUrl("<c:url value='/community/noticeWriteForm' />");
			comSubmit.submit();
		}
	
		function fn_openBoardDetail(obj) {
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
							+ "<a href='#this' name='title'>"
							+ value.NOTICE_TITLE
							+ "</a>"
							+ "<input type='hidden' id='NOTICE_NUM' value=" + value.NOTICE_NUM + ">"
							+ "</td>" + "<td>" + '관리자'
							+ "</td>" + "<td>" + new Date(value.NOTICE_DATE).toLocaleString()
							+ "</td>" + "<td>" + value.NOTICE_COUNT
							+ "</td>" + "</tr>";
								});
				body.append(str);
			}
		}
	</script>
</body>
</html>