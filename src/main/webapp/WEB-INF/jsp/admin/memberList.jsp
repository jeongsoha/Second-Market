<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<head>
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
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
	<h1 class="page-header">회원목록</h1>
</div>
<div class="row" style="padding-left:50px;">
	<div class="panel panel-default">
		<div class="panel-heading">
                         회원목록 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6" style="text-align:left;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 회원수 : ${TOTAL}</div>
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
										<th style="width: 4%; text-align:center;">번호</th>
										<th style="width: 6%; text-align:center;">ID</th>
										<th style="width: 6%; text-align:center;">PW</th>
										<th style="width: 6%; text-align:center;">이름</th>
										<th style="width: 5%; text-align:center;">생년월일</th>
										<th style="width: 5%; text-align:center;">성별</th>
										<th style="width: 10%; text-align:center;">E-Mail</th>										
										<th style="width: 7%; text-align:center;">전화번호</th>
										<th style="width: 18%; text-align:center;">주소</th>
										<th style="width: 5%; text-align:center;">가입일자</th>
										<th style="width: 3%; text-align:center;">레벨</th>
										<th style="width: 5%; text-align:center;">탈퇴여부</th>
										<th style="width: 3%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="list"  items="${list}" varStatus="stat">
								<c:url var="viewURL" value="/admin/memberModify" >
									<c:param name="MEM_ID" value="${list.MEM_ID}" />
								</c:url>									
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">${list.MEM_NUM}</td>
										<td style="text-align:center;vertical-align:middle;">${list.MEM_ID}</td>
										<td style="text-align:center;vertical-align:middle;">${list.MEM_PW}</td>
										<td style="text-align:center;vertical-align:middle;">${list.MEM_NAME}</td>
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${list.MEM_BIRTH}" pattern="YY.MM.dd" /></td>
										<td style="text-align:center;vertical-align:middle;">${list.MEM_GEN}</td>
										<td style="text-align:center;vertical-align:middle;">${list.MEM_EMAIL}</td>
										<td style="text-align:center;vertical-align:middle;">${list.MEM_PHONE}</td>
										<td style="text-align:center;vertical-align:middle;">${list.MEM_ADD1}</td>
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${list.MEM_JOINDATE}" pattern="YY.MM.dd" /></td>
										<td style="text-align:center;vertical-align:middle;">${list.MEM_LEVEL}</td>
										<td style="text-align:center;vertical-align:middle;">${list.MEM_DEL_GB}</td>
										<td style="text-align:center;vertical-align:middle;">
											<a href="${viewURL}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"></a>&nbsp;&nbsp;
										<c:url var="viewURL2" value="/admin/memberDelete" >
											<c:param name="MEM_ID" value="${list.MEM_ID }" />
										</c:url>
										<input type="hidden" id="MEM_ID" value="${list.MEM_ID }">	
										 <a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a></td>									
									</tr>
								</c:forEach>
								<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(list) le 0}">
										<tr><td colspan="9" style="text-align:center;">등록된 회원이 없습니다</td></tr>
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
