<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<head>
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
   
}
$(document).ready(function() {
	
	$("a[name='title']").on("click", function(e) { //제목 
		e.preventDefault();
		fn_openBoardDetail($(this));
	});

});

function fn_openBoardDetail(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/shop/goodsDetail' />");
	comSubmit.addParam("GOODS_NUM", obj.parent().find("#title2").val());
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
	<h1 class="page-header">상품목록</h1>
</div>
<div class="row" style="padding-left:50px;">
	<div class="panel panel-default">
		<div class="panel-heading">
                         상품목록 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6" style="text-align:left;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 상품 등록수 : ${TOTAL}</div>
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
										<th style="width: 6%; text-align:center;">번호</th>
										<th style="width: 10%; text-align:center;">카테고리</th>
										<th style="width: 10%; text-align:center;">판매자</th>										
										<th style="width: 32%; text-align:center;">상품명</th>
										<th style="width: 10%; text-align:center;">가격</th>
										<th style="width: 10%; text-align:center;">상품상태</th>
										<th style="width: 10%; text-align:center;">주문일시</th>
										<th style="width: 10%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="goodsList"  items="${goodsList}" varStatus="stat">
								<c:url var="viewURL" value="goodsView.dog" >
									<c:param name="GOODS_NUM" value="${goodsList.GOODS_NUM}" />
								    <c:param name="currentPage" value="${currentPage}" />
								</c:url>									
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">${goodsList.GOODS_NUM}</td>
										<td style="text-align:center;vertical-align:middle;">${goodsList.GOODS_CATEGORY}</td>
										<td style="text-align:center;vertical-align:middle;">${goodsList.MEM_ID}</td>										
										<td style="text-align:center;vertical-align:middle;">
											<input type="hidden" name="title2" id="title2" value="${goodsList.GOODS_NUM}">
											<a href="#this" id="title" name="title">
												${goodsList.GOODS_TITLE}
											</a>
										</td>
										<td style="text-align:right;vertical-align:middle;"><fmt:formatNumber value="${goodsList.GOODS_PRICE}" type="number"/></td>
										<td style="text-align:center;vertical-align:middle;">${goodsList.GOODS_TSTATUS}</td>																	
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${goodsList.GOODS_DATE}" pattern="YY.MM.dd HH:mm" /></td>
										<td style="text-align:center;vertical-align:middle;">
										<c:url var="viewURL2" value="/admin/adGoodsDelete" >
											<c:param name="GOODS_NUM" value="${goodsList.GOODS_NUM}" />						
										</c:url>
										<input type="hidden" id="GOODS_NUM" value="${goodsList.GOODS_NUM}">		
										 <a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a></td>		
										 							
									</tr>
								</c:forEach>
								<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(goodsList) le 0}">
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
