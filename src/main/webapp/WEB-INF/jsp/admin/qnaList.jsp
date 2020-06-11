<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<head>
<script type="text/javascript">

var openWin;

/* function openChild(title)
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    var url = "http://localhost:8000/second/admin/qnaPro";
    param = "?title=" + title;
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open(encodeURI(url+param),
            "childForm", "width=900, height=800, resizable = no, scrollbars = yes");



} */

function openChild(num)
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    var url = "/second/admin/qnaPro";
    param = "?QNA_NUM=" + num;
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open(encodeURI(url+param),
            "childForm", "width=900, height=800, resizable = no, scrollbars = yes");
}

function delchk(){
    return confirm("삭제하시겠습니까?");
}
$(document).ready(function() {
	
	$("a[name='title']").on("click", function(e) { //제목 
		e.preventDefault();
		fn_openBoardDetail($(this));
	});
	
	$(".answer>p").click(function(){
		var submenu = $(this).next("table");

		// submenu 가 화면상에 보일때는 위로 접고 아니면 아래로 펼치기
		if( submenu.is(":visible") ){
			submenu.slideUp();
		}else{
			submenu.slideDown();
		}
	});

});

function fn_openBoardDetail(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/community/qnaDetail' />");
	comSubmit.addParam("QNA_NUM", obj.parent().find("#title2").val());
	comSubmit.submit();
}
</script>
<style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}

</style>
</head>

<div class="row" style="padding-left:50px;width:900px;">    
	<h1 class="page-header">Q&A 게시판</h1>
</div>
<div class="row" style="padding-left:50px;">
	<div class="panel panel-default">
		<div class="panel-heading">
               Q&A게시판 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6" style="text-align:left;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 게시글 수 : ${TOTAL}</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 10%; text-align:center;">번호</th>
										<th style="width: 36%; text-align:center;">제목</th>
										<th style="width: 13%; text-align:center;">작성자</th>										
										<th style="width: 13%; text-align:center;">작성일</th>
										<th style="width: 13%; text-align:center;">답변여부</th>
										<th style="width: 15%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="qnaList"  items="${qnaList}" varStatus="stat">									
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">${qnaList.QNA_NUM}</td>
										<td style="text-align:center;vertical-align:middle;">
											<input type="hidden" name="title2" id="title2" value="${qnaList.QNA_NUM}">
											<a href="#this" id="title" name="title">
												${qnaList.QNA_TITLE}
										</td>
										<td style="text-align:center;vertical-align:middle;">${qnaList.MEM_ID}</td>																											
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${qnaList.QNA_DATE}" pattern="YY.MM.dd HH:mm" /></td>
										<td style="text-align:center;vertical-align:middle;">${qnaList.QNA_YORN}</td>		
										<td style="text-align:center;vertical-align:middle;">
										<%-- <input type="button" value="답변달기" onclick='openChild("${qnaList.QNA_TITLE}");'>&nbsp;&nbsp; --%>
										<input type="button" value="답변달기" onclick='openChild("${qnaList.QNA_NUM}");'>&nbsp;&nbsp;
										<c:url var="viewURL2" value="/admin/adQnaDelete" >
											<c:param name="QNA_NUM" value="${qnaList.QNA_NUM}" />						
										</c:url>
										<input type="hidden" id="QNA_NUM" value="${qnaList.QNA_NUM}">		
										 <a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a></td>									
									</tr>

								</c:forEach>
								<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(qnaList) le 0}">
										<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
									</c:if> 
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
