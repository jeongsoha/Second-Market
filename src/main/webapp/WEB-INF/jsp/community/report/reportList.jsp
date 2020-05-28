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
         <li class="selected"><a href="reportList"><img src="./../resources/images/tab_report.png" width="100" height="30"></a></li>
         <li><a href="qnaList"><img src="./../resources/images/tab_qna.png" width="100" height="30"></a></li>
	</ul>
	</div> 
	<div id="main-container">
		<img src="./../resources/images/commu_rtitle.png" width="200" height="70"> 
	<table border="1" align="center" class="tbl_type">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="25%" />  
			<col width="10%" />
		</colgroup>  
		<caption><h2>신고게시판</h2></caption>
		<form action="/nnS/community/reportList" method="post">
	      <select name="search" id="search">
	                  <option value="0">전체보기</option>
	               <option value="1" <c:out value="${search eq '1' ? 'selected' :''}"/>>처리대기</option>
	               <option value="2" <c:out value="${search eq '2' ? 'selected' :''}"/>>신고접수</option>
	               <option value="3" <c:out value="${search eq '3' ? 'selected' :''}"/>>허위신고</option>
	               <option value="4" <c:out value="${search eq '4' ? 'selected' :''}"/>>처리완료</option>
	      </select>
	      <input type="submit" value="분류" class="search_btn" onClick="onSearch()"/>
	    </form>
		<thead>
			<tr>
				<th scope="col"><img src="./../resources/images/commu_num.png" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_title.png" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_writer.png" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_date.png" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_status.png" height="25"></th>
				<th scope="col"><img src="./../resources/images/commu_rid.png" height="25"></th>
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
			comSubmit.setUrl("<c:url value='/community/reportWriteForm' />");
			comSubmit.submit();
		}
	
		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/reportDetail' />");
			comSubmit.addParam("REPORT_NUM", obj.parent().find("#REPORT_NUM").val());
			comSubmit.submit();
		}
		 function fn_selectBoardList(pageNo) {
			var comAjax = new ComAjax();
			
			comAjax.setUrl("<c:url value='/community/reportListPaging' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("search", $('#search').val());
			comAjax.ajax();
		}

		function fn_selectBoardListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='7'>조회된 결과가 없습니다.</td>"
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
									var si = "";
		                            if(value.REPORT_GOODS_SELLER_ID == null){
		                               si = " ";
		                            }else{
		                               si = value.REPORT_GOODS_SELLER_ID;
		                            }
									str     += "<tr style=\"text-align: center\">"
											+ "<td>"
											+ value.REPORT_NUM
											+ "</td>"
											+ "<td class='title'>"
											+ "<a href='#this' name='title'>"
											+ value.REPORT_TITLE
											+ "</a>"
											+ "<input type='hidden' id='REPORT_NUM' value=" + value.REPORT_NUM + ">"
											+"</td>" + "<td>" + value.MEM_ID
											+ "</td>" + "<td>" + new Date(value.REPORT_DATE).toLocaleString()
											+ "</td>" + "<td>" + value.REPORT_STATUS
											+ "</td>" + "<td>" + si
											+ "</td>" + "<td>" + value.REPORT_COUNT
											+ "</td>" + "</tr>";
								});
				body.append(str);

				/*$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openBoardDetail($(this));
				});*/
			}
		} 
	</script>
</body>
</html>