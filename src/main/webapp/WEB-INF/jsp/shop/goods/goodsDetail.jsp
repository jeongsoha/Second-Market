<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
  	<script>
  		$(document).ready(function(){ 
  			$('.bxslider').bxSlider({ 
  				auto: true, 
  				speed: 500, 
  				pause: 4000, 
  				mode:'fade', 
  				autoControls: true, 
  				pager:true, 
			}); 
		});
	</script>
  	
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
</head>
<body>

<div id="content">
	<div id="vertical_tab-container">
	<!--
		<ul>
			 <li <c:if test="${sortType eq 'all'}">class="selected"</c:if>><a href=<c:url value="/shop/allGoodsList"/>>전체상품</a></li>
	         <li <c:if test="${sortType eq 'like'}">class="selected"</c:if>><a href=<c:url value="/shop/likeGoodsList"/>>인기상품</a></li>
	         <li <c:if test="${sortType eq 'new'}">class="selected"</c:if>><a href=<c:url value="/shop/newGoodsList"/>>신규상품</a></li>
	         <li <c:if test="${sortType eq ''}">class="selected"</c:if>><a href=<c:url value="/shop"/>>카테고리</a></li>
		</ul>
		 -->
	</div>
	<div id="main-container">
		<table border="1" align="center" style="min-height:100%">
			<colgroup>
				<col width="45%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
			</colgroup>
			<caption>상품 상세</caption>
			<tbody>
				<tr colspan="2">
					<td rowspan="2">
						<c:choose>
							<c:when test="${map.GOODS_THUMBNAIL eq null}">
								<img alt="" style="width:95%; height:300px; padding:10px 10px 10px 10px;" src=<c:url value="/resources/images/no_image.png"/>>
							</c:when>
							<c:otherwise>
								<img alt="" style="width:95%; height:300px; padding:10px 10px 10px 10px;" src="${path}${map.GOODS_THUMBNAIL}">	
							</c:otherwise>
						</c:choose>
					</td>
					<td colspan="3" style="padding:0 0 0 20px; font-size:15px;">
						<br>
						<img src="/nnS/resources/images/goods_brand.png"> : ${map.GOODS_BRAND}<br />
						<img src="/nnS/resources/images/goods_model.png"> : ${map.GOODS_TITLE} <br />	<!-- 테이블에 없음 --> 
						<img src="/nnS/resources/images/goods_pstatus.png"> : ${map.GOODS_STATUS}<br/>
						<input type="hidden" id="IDX" name="IDX" value="${map.GOODS_NUM}">
						<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${map.GOODS_NUM}">
						<img src="/nnS/resources/images/goods_price.png"> : ${map.GOODS_PRICE}<br /> 
						<img src="/nnS/resources/images/goods_dprice.png">: ${map.GOODS_DCOST} <br /><!-- 테이블에 없음 --> 
						<img src="/nnS/resources/images/goods_total.png"> : <c:out value="${map.GOODS_PRICE+map.GOODS_DCOST}"/><br/>
						<br>
					</td>
				</tr>
				<tr align="center">
				<td>
					<a href='#this' id="buy"><img src=<c:url value="/resources/images/baro.png"/> id='baro_img' style="width:60px; height:30px"></a>
				</td>
				<td> 
					<a href='javascript: report_func();'><img src=<c:url value="/resources/images/siren2.png"/> id='report_img' style="width:60px; height:30px"></a>
				</td>
				<td>	
					<c:choose>
						<c:when test="${goodsLikeMap.GOODS_LIKE_YN eq 0}">
					    	<a href='javascript: like_func();'><img src=<c:url value="/resources/images/like_black.png"/> id='unlike_img' style="width:30px; height:30px"></a>
					  	</c:when>
					  	<c:otherwise>
					    	<a href='javascript: unlike_func();'><img src=<c:url value="/resources/images/like_red.png"/> id='like_img' style="width:30px; height:30px"></a>
					  	</c:otherwise>
					</c:choose>
				
				</td>	
				</tr>
			</tbody>
		</table>
		<div class="container" style="width:100%">
		    <ul class="goodsTabs">
		        <li class="selected"><a href="#goodsTab1"><img src="./../resources/images/goods_tab_1.png" height="25"></a></li>
		        <li><a href="#goodsTab2"><img src="./../resources/images/goods_tab_2.png" height="25"></a></li>
		        <li><a href="#goodsTab3"><img src="./../resources/images/goods_tab_3.png" height="25"></a></li>
		    </ul>
		    <div class="goodsTab_container">
		        <div id="goodsTab1" class="goodsTab_content">
		       
					  <ul class="bxslider"> 
					  	<c:forEach var="row" items="${list}" varStatus="var"> 
					  		<li><img alt="" style="width:auto; height:450px;" src="${path}${row.GOODS_IMAGE_STD}"/></li>
						</c:forEach>
					  </ul>
					  
		            <p>${map.GOODS_CONTENT}</p>
		        </div>
		        <div id="goodsTab2" class="goodsTab_content">
		             
						<div align='center'>
	                        <!-- 뭐든 넣어도됨(작성자 등등) -->
			      		</div>
			      		<!-- 문의 작성 폼 -->
			      		<form id="frm" name="frm">
				      		<c:if test="${session_MEM_ID != NULL}">
					      		<div width="100%">
				      				<textarea name='COMMENTS_CONTENT' id='COMMENTS_CONTENT' rows='5' cols='150' style='resize: none;'></textarea>
				      				<input type="hidden" id="COMMENTS_TYPE" name="COMMENTS_TYPE" value="1"/>
				      				<input type="hidden" id="COMMENTS_PARENT" name="COMMENTS_PARENT" value="${map.GOODS_NUM}"/>
				      				<input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_INFO.MEM_ID }"/>
									<input type="button" id="cWrite" name="cWrite" value="문의하기" onClick="" style="vertical-align : middle;">
			      				</div>
			      			</c:if>
	      				</form>
	      				<br>
					<table id="goodsTab2_ct" class="tbl_type" style="width:100%; height: 100px;">
						<tbody>
						</tbody>
			       </table>
	       			<div id="PAGE_NAVI" align="center"></div>
					<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			   </div>
		        <div id="goodsTab3" class="goodsTab_content">
		             
		             <br>
						판매자 ID : ${memberMap.MEM_ID}<br />
						판매자 이름 : ${memberMap.MEM_NAME} <br /> 
						판매자 성별 : ${memberMap.MEM_GEN}<br/>
						판매자 이메일 : ${memberMap.MEM_EMAIL}<br /> 
						판매자 연락처 : ${memberMap.MEM_PHONE}<br />
						<br>
		        </div>
		    </div>
		    <br>
		    <br/>
		<a href="#this" class="btn" id="list"><button class="bttn-bordered bttn-xs bttn-primary">목록으로</button></a>
		
		<c:if test="${session_MEM_ID eq map.MEM_ID && session_MEM_ID ne null}">
			<a href="#this" class="btn" id="update"><button class="bttn-bordered bttn-xs bttn-primary">수정하기</button></a>
			<a href="#this" class="btn" id="delete"><button class="bttn-bordered bttn-xs bttn-primary">삭제하기</button></a>
		</c:if>
		</div>
   </div>
   
</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectCommentList(1);
			
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openGoodsList();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_goodsModify();
			});
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteGoods();
			});
			$("#buy").on("click", function(e) { // 바로구매 버튼
				e.preventDefault();
				if("${session_MEM_ID}" == "${memberMap.MEM_ID}"){
					alert("자신의 상품은 구매할 수 없습니다.");
					return false;
				}else if("${map.GOODS_TSTATUS}" != 'N'){
					alert("이미 거래중인 상품은 구매할 수 없습니다.");
				}else{
					fn_orderWriteForm($(this));
				}
			});
			$("#cWrite").on("click", function(e){
				e.preventDefault();
				fn_writeComment();
			});
		});
		
		function fn_openGoodsList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/allGoodsList' />");
			comSubmit.submit();
		}
		
		function fn_goodsModify(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsModifyForm' />");
			comSubmit.addParam("GOODS_NUM", "${map.GOODS_NUM}");
			comSubmit.submit();
		}
	
		function fn_deleteGoods(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDelete' />");
			comSubmit.addParam("GOODS_NUM", $("#IDX").val());
			comSubmit.submit();
			
		}
		
		/* 좋아요 */
		function like_func(){
			if(session_chk()){
				var IDX="${map.MEM_ID}";
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/shop/goodsDetail/goodsLike'/>");
				comSubmit.addParam("LIKE_GOODS_NUM", "${map.GOODS_NUM}");
				comSubmit.addParam("IDX", IDX);
				comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
				comSubmit.submit();	
			}
		}
		
		function unlike_func(){
			if(session_chk()){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/shop/goodsDetail/goodsUnlike'/>");
				comSubmit.addParam("LIKE_GOODS_NUM", "${map.GOODS_NUM}");
				comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
				comSubmit.submit();	
			}
		}
		
		function session_chk(){
			if("${session_MEM_ID}" == null || "${session_MEM_ID}" == "" ){
				alert("로그인이 필요합니다.");
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/loginForm'/>");
				comSubmit.submit();
				return false;
			}else{
				return true;
			}
		}
		
		/* 신고하기 */
		function report_func(){
			if(session_chk()){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/community/reportWriteForm'/>");
				comSubmit.addParam("GOODS_NUM", "${map.GOODS_NUM}");
				comSubmit.addParam("MEM_ID", "${session_MEM_ID}");
				comSubmit.submit();	
			}
		}
		
		/* 상품 구매 */
		
		function fn_orderWriteForm(obj) {
			if(session_chk()){
				var comSubmit = new ComSubmit();
				var GOODS_NUM = "${map.GOODS_NUM}";
				var MEM_ID = "${session_MEM_ID}";
				comSubmit.setUrl("<c:url value='/shop/order/orderWriteForm' />");
				comSubmit.addParam("GOODS_NUM", GOODS_NUM);
				comSubmit.addParam("MEM_ID", MEM_ID);
				comSubmit.submit();
			}
		}

		//Default Action
		$(".goodsTab_content").hide(); //Hide all content
		$("ul.goodsTabs li:first").addClass("active").show(); //Activate first goodsTab
		$(".goodsTab_content:first").show(); //Show first goodsTab content
		
		//On Click Event
		$("ul.goodsTabs li").click(function() {
			$("ul.goodsTabs li").removeClass("selected active"); //Remove any "active" class
			$(this).addClass("selected active"); //Add "active" class to selected goodsTab
			$(".goodsTab_content").hide(); //Hide all goodsTab content
			var activegoodsTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active goodsTab + content
			$(activegoodsTab).fadeIn(); //Fade in the active content
			return false;
		});
		

		
		function fn_detailComment(num){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/commentDetail'/>");
			comSubmit.addParam("COMMENTS_NUM", num);
			comSubmit.addParam("G_MEM_ID", $("#G_MEM_ID").val());
			comSubmit.submit();
		}
		
		function fn_writeComment(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/commentWrite'/>");
			comSubmit.addParam("GOODS_NUM", $("#GOODS_NUM").val());
			
			// 댓글 내용 필요
	         if(!$("#COMMENTS_CONTENT").val()){
	             alert("내용를 입력해주세요.");
	             $("#COMMENTS_CONTENT").focus();
	             return false;
	         }
			
			comSubmit.submit();
		} 
		
		function fn_deleteComment(num){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/commentDelete'/>");
			comSubmit.addParam("COMMENTS_NUM", num);
			comSubmit.addParam("GOODS_NUM", $("#GOODS_NUM").val());
			comSubmit.submit();
		}
		
		function fn_chkUsr(){
			alert("문의 작성자만 확인할 수 있습니다.")
		}
		
		
		// 댓글 페이징
		function fn_selectCommentList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/shop/goodsDetail/commentList' />");
			comAjax.setCallback("fn_selectCommentListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("COMMENTS_TYPE", 1);
			comAjax.addParam("COMMENTS_PARENT", $("#GOODS_NUM").val());
			comAjax.ajax();
		}

		// 댓글 페이징 콜백함수
		function fn_selectCommentListCallback(data) {
			var total = data.TOTAL;
			var body = $("#goodsTab2_ct");
			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='4'>등록된 상품 문의가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					recordCount : 15,
					eventName : "fn_selectCommentList"
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(
								data.list,
								function(key, value) {									
							str +=				"<tr style='border-top-style: Double; border-color: #000000;'>"
						           		+	    "<td length='30%' target='_blank' style='width:300px;'>";
						    if('${session_MEM_INFO.MEM_ID}' == value.MEM_ID || '${session_MEM_INFO.MEM_ID}' == '${memberMap.MEM_ID}'){
						    	
						    str +=				"<a href='#this' onClick='fn_detailComment("+value.COMMENTS_NUM+")'>"
						    			+		"<input type='hidden' id='G_MEM_ID' name='G_MEM_ID' value='${memberMap.MEM_ID}'>"
						         		+       		value.MEM_ID
						         		+		" 님의 상품문의입니다.</a>";
						    } else {
						    str +=				"<a href='#this' onClick='fn_chkUsr()'>"
						         		+       		value.MEM_ID
						         		+		" 님의 상품문의입니다.</a>";
						    	
						    }      		
						    str+=      	    	"</td>"
							            +   		"<td colspan='2' style='width:170px; align=center;'>"
							            +     			new Date(value.COMMENTS_DATE).toLocaleString()
							            +     	"</td>"
								        +        "<td>";
							if(value.COMMENTS_REPLY=='N'){
								str +=			'답변대기';
							} else if (value.COMMENTS_REPLY=='Y'){
						 		str +=			'답변완료';
							} else{
								str +=			"";
							}
							str +=              "</td>"	
							            +      	"<td style='width: 100px; align=center;'>";
							if('${session_MEM_INFO.MEM_ID}' == value.MEM_ID){
									str += "<a href='#this' name='cDelete' onClick='fn_deleteComment("+value.COMMENTS_NUM+")'> 삭제 </a>"
										+  "<input type='hidden' id='GOODS_NUM' name='GOODS_NUM' value=" + value.COMMENTS_PARENT + ">";					
								}
							str +=              "</td>"
							            +   	"</tr>";
						});
				body.append(str);
			}
		}

	</script>

</body>
</html>