<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ include file="/WEB-INF/include/include-header.jspf" %> 
<head>
<script type="text/javascript">
function fn_check() { 
    var comSubmit = new ComSubmit("reportModifyForm");
    comSubmit.setUrl("<c:url value='/admin/reportModifyPro'/>");
    comSubmit.submit();
 }
 $("#reportModifyForm").on("submit",function(e){
 });
function back(){
	history.go(-1);
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
	<h1 class="page-header">신고처리</h1>
</div>
<div class="row" style="padding-left:50px;">
	<div class="panel panel-default">
		<div class="panel-heading">
                         신고내용을 확인, 처리하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6" style="text-align:left;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 신고수 :${TOTAL} </div>
						</div>						
					</div>
					<div class="row">
						<div class="col-sm-12">
						<form id="reportModifyForm" name="reportModifyForm" method="post">
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 7%; text-align:center;">글번호</th>
										<th style="width: 20%; text-align:center;">제목</th>
										<th style="width: 11%; text-align:center;">신고자</th>										
										<th style="width: 18%; text-align:center;">신고일자</th>
										<th style="width: 11%; text-align:center;">신고유형</th>
										<th style="width: 12%; text-align:center;">신고대상</th>
										<th style="width: 11%; text-align:center;">처리상태</th>
										<th style="width: 10%; text-align:center;">확인</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="list"  items="${list}" varStatus="stat">
									<c:url var="viewURL" value="/admin/reportModify" >
										<c:param name="MEM_ID" value="${list.MEM_ID}" />
									</c:url>
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">
											<input type="hidden" name="REPORT_NUM" id="REPORT_NUM" value="${list.REPORT_NUM }">
												${list.REPORT_NUM}</td>
										<td style="text-align:center;vertical-align:middle;">
											<input type="hidden" name="title2" id="title2" value="${list.REPORT_NUM}">
											<a href="#this" id="title" name="title">
												${list.REPORT_TITLE}
										</td>
										<td style="text-align:center;vertical-align:middle;">${list.MEM_ID}</td>
										<td style="text-align:center;vertical-align:middle;">${list.REPORT_DATE}</td>
										<td style="text-align:center;vertical-align:middle;">${list.REPORT_TYPE}</td>
										<td style="text-align:center;vertical-align:middle;">${list.REPORT_GOODS_SELLER_ID}</td>
										<td style="text-align:center;vertical-align:middle;">
											<select id="REPORT_STATUS" name="REPORT_STATUS" >
             									<option value="처리대기">처리대기</option>
            									<option value="신고접수">신고접수</option>
           										<option value="허위신고">허위신고</option>
             									<option value="처리완료">처리완료</option>
        				  					</select>
        				  					
										</td>
										<td style="text-align:center;vertical-align:middle;">
											<button type="submit" class="btn btn-success" onclick="fn_check();">수정완료</button>
										</td>
									</tr>
								</c:forEach>
								<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(list) le 0}">
										<tr><td colspan="9" style="text-align:center;">등록된 신고사항이 없습니다</td></tr>
									</c:if> 
								</tbody>
							</table>
							</form>
						</div>
					</div>
					
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
