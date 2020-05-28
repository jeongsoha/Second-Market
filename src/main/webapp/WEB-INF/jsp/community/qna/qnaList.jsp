<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
</head>
<body>
<div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li><a href="noticeList"><img src="./../resources/images/tab_notice.png" width="100" height="30"></a></li>
         <li><a href="boardList"><img src="./../resources/images/tab_board.png" width="100" height="30"></a></li>
         <li><a href="reportList"><img src="./../resources/images/tab_report.png" width="100" height="30"></a></li>
         <li class="selected"><a href="qnaList"><img src="./../resources/images/tab_qna.png" width="100" height="30"></a></li>
        </ul>
   </div>
   <div id="main-container">
   
	<img src="./../resources/images/commu_qtitle.png" width="200" height="70">
	<table class="tbl_type">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><img src="./../resources/images/commu_num.png" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_title.png" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_writer.png" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_date.png" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_re.png" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_hit.png" height="25"></th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	
	<div id="PAGE_NAVI" align="center"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />

	<br />
	<div align="right">
	<c:if test="${session_MEM_INFO.MEM_ID != NULL }">
		<a href="#this"  class="btn" id="write"><button class="bttn-bordered bttn-xs bttn-primary"><img src="./../resources/images/commu_wbtn.png"></button></a>
	</c:if>
	</div>
	</div>
	</div>
    <br/>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
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
			comSubmit.setUrl("<c:url value='/community/qnaWriteForm' />");
			comSubmit.submit();
		}
	
		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/qnaDetail' />");
			comSubmit.addParam("QNA_NUM", obj.parent().find("#QNA_NUM").val());
			comSubmit.submit();
		}
	    function fn_selectBoardList(pageNo) {
			var comAjax = new ComAjax();
			
			comAjax.setUrl("<c:url value='/community/qnaListPaging' />");
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
				var str = "<tr align=\"center\">" + "<td colspan='6'>조회된 결과가 없습니다.</td>"
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
				$.each(
								data.list,
								function(key, value) {
									str     += "<tr style=\"text-align: center\">"
											+ "<td>"
											+ value.QNA_NUM
											+ "</td>"
											+ "<td class='title'>"
											+ "<a href='#this' name='title'>"
											+ value.QNA_TITLE
											+ "</a>"
											+ "<input type='hidden' id='QNA_NUM' value=" + value.QNA_NUM + ">"
											+ "</td>" + "<td>" + value.MEM_ID
											+ "</td>" + "<td>" + new Date(value.QNA_DATE).toLocaleString()
											+ "</td>" + "<td>" + value.QNA_YORN
											+ "</td>" + "<td>" + value.QNA_COUNT
											+ "</td>" + "</tr>";
								});
				body.append(str);

				/* $("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openBoardDetail($(this));
				}); */
			}
		} 
	</script>
</body>
</html>