<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/mypage.css"/>" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 

<style type="text/css">

 @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
a{
   color: #000;
   text-decoration: none;	
}
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
  width:90px;
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
.search_box1 {
    width: 100px;
    height: 30px;
    border: 0.1em solid #000;
}
</style>
</head>
<body>

<div id="content">
<!-- <div class="card align-middle" style="border-radius:20px; background-color:#fff; margin-top:50px;"> -->
   
	 <div class="tab_wrap">
  <div class="tab_menu_container">
    <a href="accountDetail"><button class="tab_menu_btn" type="button">회원정보</button></a>
    <a href="pwModifyForm"><button class="tab_menu_btn" type="button">비밀번호 변경</button></a>
    <a href="deleteAccount"><button class="tab_menu_btn" type="button">회원탈퇴</button></a>
    <a href="reportList"><button class="tab_menu_btn on" type="button">내 신고 내역</button></a>
    <a href="qnaList"><button class="tab_menu_btn" type="button">내 문의 내역</button></a>
  </div>
  </div>
   
   <div id="main-container">
		<h2>신고게시판</h2>
	<table  align="center" class="table table-striped table-condensed">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="25%" />  
			<col width="10%" />
		</colgroup>  
		<caption><h2>신고게시판</h2></caption>
		<form action="/second/myPage/reportList" method="post">
	      <select name="search" id="search" class="search_box1">
	                  <option value="0">전체보기</option>
	               <option value="1" <c:out value="${search eq '1' ? 'selected' :''}"/>>처리대기</option>
	               <option value="2" <c:out value="${search eq '2' ? 'selected' :''}"/>>신고접수</option>
	               <option value="3" <c:out value="${search eq '3' ? 'selected' :''}"/>>허위신고</option>
	               <option value="4" <c:out value="${search eq '4' ? 'selected' :''}"/>>처리완료</option>
	      </select>
	      <input type="submit" value="확인" class="search_btn" onClick="onSearch()"/>
	    </form>
	    
		<thead>
			<tr>
				<th style=text-align:center; scope="col">글번호</th>
				<th style=text-align:center; scope="col">제목</th>
				<th style=text-align:center; scope="col">작성자</th>
				<th style=text-align:center; scope="col">작성일</th>
				<th style=text-align:center; scope="col">처리상태</th>
				<th style=text-align:center; scope="col">신고대상</th>
				<th style=text-align:center; scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	
	<div id="PAGE_NAVI" align="center"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />

	<br />
	</div>
</div>


	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_selectBoardList(1); 

			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});
	
		function fn_openBoardDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myPage/reportDetail' />");
			comSubmit.addParam("REPORT_NUM", obj.parent().find("#REPORT_NUM").val());
			comSubmit.submit();
		}
		 function fn_selectBoardList(pageNo) {
			var comAjax = new ComAjax();
			var id="${session_MEM_ID}"
			comAjax.setUrl("<c:url value='/myPage/reportListPaging' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("MEM_ID", id);
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
		
	 var onSearch = function(){   
	      submit();  
	   };
	</script>
</body>
</html>