<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	
  	<script>
/*   		$(document).ready(function(){ 
  			$('.bxslider').bxSlider({ 
  				auto: true, 
  				speed: 500, 
  				pause: 4000, 
  				mode:'fade', 
  				autoControls: true, 
  				pager:true, 
			}); 
		}); */


	</script>
  	
<meta charset="UTF-8">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
</style>
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<style>

.degoodsti{
	font-size: 30px;
    line-height: 30px;
    font-weight: bold;
}

.degoodspr{
	color: #ed1b2f;
    font-size: 22px;
    line-height: 32px;
}
.degoodsco{
	color: #a3a3a3;
    font-size: 22px;
}
nav {
  position: relative;
  display: flex;
  width: 1000px;
  margin: 0 0 0 300px;
    text-align: center;
}
nav li {
  display: block;
  width: 20%;
  padding: .75em 0;
  color: #333;
  text-decoration: none;
  text-align: center;
}
.nav-underline {
  position: absolute;
  left: 0;
  bottom: -2px;
  width: 20%;
  height: 2px;
  background: #333;
  transition: all .3s ease-in-out;
}
nav li:nth-child(1).selected ~ .nav-underline {
  left: 0;
}
nav li:nth-child(2).selected ~ .nav-underline {
  left: 20%;
}
nav li:nth-child(3).selected ~ .nav-underline {
  left: 40%;
}
nav li:nth-child(4).selected ~ .nav-underline {
  left: 60%;
}
nav li:nth-child(5).selected ~ .nav-underline {
  left: 80%;
}
nav li:nth-child(1):hover ~ .nav-underline {
  left: 0;
}
nav li:nth-child(2):hover ~ .nav-underline {
  left: 20%;
}
nav li:nth-child(3):hover ~ .nav-underline {
  left: 40%;
}
nav li:nth-child(4):hover ~ .nav-underline {
  left: 60%;
}
nav li:nth-child(5):hover ~ .nav-underline {
  left: 80%;
}

a{
	text-align:center;
}
</style>
</head>
<body>

<div id="content">
	<div id="vertical_tab-container">

	</div>
	<div id="main-container">
		<table align="center" style="min-height:100%">
			<colgroup>
				<col width="45%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
			</colgroup>
			
			<caption>상품 상세</caption>
			
			<tbody >
				<tr>
					<td rowspan="4">
						<c:choose>
							<c:when test="${map.GOODS_THUMBNAIL eq null}">
								<img alt="" style="width:100%; height:500px; padding:10px 10px 10px 10px;" src=<c:url value="/resources/images/no_image.png"/>>
							</c:when>
							<c:otherwise>
								<img alt="" style="width:100%; height:500px; padding:10px 10px 10px 10px;" src="${path}${map.GOODS_THUMBNAIL}">	
							</c:otherwise>
						</c:choose>
					</td>
					<td colspan="3" style="padding:0 0 0 70px; font-size:15px; padding-top: 100px;">

						<h1 class="degoodsti" >${map.GOODS_TITLE} </h1>	
						<%-- 판매수량 : ${map.GOODS_QTY} <br/> --%>
						<input type="hidden" id="IDX" name="IDX" value="${map.GOODS_NUM}">
						<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${map.GOODS_NUM}">
						판매가격 : ${map.GOODS_PRICE}<br /> 
						거래지역 : ${map.GOODS_REGION}
						<br/><br/>
						<c:if test="${reportMap.REPORTS != 0}">
						 <div style="color:red; font-weight:bold;">
						 ※신고당한 판매상품 입니다.
						 </div>
						 </c:if>
						<br/>
						<br>
						<h1 class="degoodspr">₩${map.GOODS_PRICE}</h1>
						<h1 class="degoodsco">${map.GOODS_REGION}에서 거래 가능</h1>

					</td>
				</tr>
				
				<tr align="center">
					<td colspan="3" style="padding-left: 70px;">
					<a href='#this' id="buy"><div class="debtn01">바로구매</div></a> 	
					</td>
				</tr>
				<tr align="center">
					<td colspan="3" style="padding-left: 70px;">
					<a href='javascript: report_func();'><div class="debtn02">신고하기</div></a>
					</td>
				</tr>
				
				<tr align="center" > 
				<td colspan="3" style="padding-left: 70px; padding-bottom: 20px;">	
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
		
<!-- 		<nav>  ul 속성이 없으면 링크 적용 불가
		    <a href="#goodsTab1" class="is-current">상품상세보기</a>
		    <a href="#goodsTab2" class="is-current">상품문의</a>
		    <a href="#goodsTab3" class="is-current">판매자정보</a>
		    <div class="nav-underline"></div>
		</nav> -->
		
		<div class="container" style="width:100%">
		<nav>
		    <ul class="goodsTabs">
		        <li class="goodsTabsLi selected"><a href="#goodsTab1">상품상세보기</a></li>
		        <li class="goodsTabsLi"><a href="#goodsTab2">상품문의</a></li>
		        <li class="goodsTabsLi"><a href="#goodsTab3">판매자정보</a></li>
		        <div class="nav-underline"></div>
		    </ul>
		</nav>
		 
		     
		    <div class="goodsTab_container">
		    
		        <div id="goodsTab1" class="goodsTab_content">
		       
					<%--   <ul class="bxslider"> 
					  	<c:forEach var="row" items="${list}" varStatus="var"> 
					  		<li><img alt="" style="width:auto; height:450px;" src="${path}${row.GOODS_IMAGE_STD}"/></li>
						</c:forEach>
					  </ul> --%>
					  
		            <p>${map.GOODS_CONTENT}</p>

		        </div>
		        
		        
		        <div id="goodsTab2" class="goodsTab_content">
		             
						<div align='center'>
	                        <!-- 뭐든 넣어도됨(작성자 등등) -->
	                        판매자에게 문의하고자 하는 내용을 작성해 주세요. 욕설/비방/지나친 비속어 등이 기재된 글은 예고없이 삭제될 수 있습니다.
			      		</div>
			      		</br>
			      		<!-- 문의 작성 폼 -->
			      		<form id="frm" name="frm">
				      		<c:if test="${session_MEM_ID != NULL}">
					      		<div width="100%" align='center'>
				      				<textarea name='COMMENTS_CONTENT' id='COMMENTS_CONTENT' rows='5' cols='150' style='resize: none;'></textarea>
				      				<input type="hidden" id="COMMENTS_TYPE" name="COMMENTS_TYPE" value="1"/>
				      				<input type="hidden" id="COMMENTS_PARENT" name="COMMENTS_PARENT" value="${map.GOODS_NUM}"/>
				      				<input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_INFO.MEM_ID }"/>
									<input type="button" id="cWrite" name="cWrite" class="btn" value="문의하기" onClick="" style="vertical-align : middle; height: 50px;">
			      				</div>
			      			</c:if>
	      				</form>
	      				<br>
					<table id="goodsTab2_ct" class="tbl_type" style="width:100%; height: 150px;">
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
		<a href="#this" class="btn" id="list">목록으로</button></a>
		
		<c:if test="${session_MEM_ID eq map.MEM_ID && session_MEM_ID ne null}">
			<a href="#this" class="btn" id="update">수정하기</button></a>
			<a href="#this" class="btn" id="delete">삭제하기</button></a>
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
				e.preventDefault(); // submit 이벤트를 실행하지 않겠다는 의미. submit을 쓸 때 제어하기 위해서 - 보통 submit을 하지 않기 위해서 사용함
				if("${session_MEM_ID}" == "${memberMap.MEM_ID}"){
					alert("자신의 상품은 구매할 수 없습니다.");
					return false;
				}else if("${map.GOODS_TSTATUS}" != 'N'){
					alert("거래중이거나 판매완료된 상품입니다.");
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
            var idq = "${memberMap.MEM_ID}"; // (유진 추가) 상품 좋아요 알람을 위한 변수
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/shop/goodsDetail/goodsLike'/>");
            comSubmit.addParam("LIKE_GOODS_NUM", "${map.GOODS_NUM}");
            comSubmit.addParam("IDX", IDX);
            comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}"); 
            comSubmit.addParam("idq", idq);// (유진 추가) 상품 좋아요 알람을 위한 변수 전송
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
				var idq = "${memberMap.MEM_ID}"; // (유진 추가) 구매시 알람을 위한 변수
				comSubmit.setUrl("<c:url value='/shop/order/orderWriteForm' />");
				comSubmit.addParam("GOODS_NUM", GOODS_NUM);
				comSubmit.addParam("MEM_ID", MEM_ID);
				comSubmit.addParam("idq", idq);// (유진 추가) 상품 답글 알람을 위한 변수 전송
				// alert(idq+" "+"afafafaf")
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
			var idq = "${memberMap.MEM_ID}"; // (유진 추가) 상품 답글 알람을 위한 변수
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/commentWrite'/>");
			comSubmit.addParam("GOODS_NUM", $("#GOODS_NUM").val());
			
			comSubmit.addParam("idq", idq);// (유진 추가) 상품 답글 알람을 위한 변수 전송
			alert(idq)
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
							str +=				"<tr style='border-top: 1px solid #dfdfdf;'>"
						           		+	    "<td length='30%' target='_blank' style='width:500px;'>";
						    if('${session_MEM_INFO.MEM_ID}' == value.MEM_ID || '${session_MEM_INFO.MEM_ID}' == '${memberMap.MEM_ID}'){
						    	
						    str +=				"<a href='#this' onClick='fn_detailComment("+value.COMMENTS_NUM+")' style='font-weight: bold;'>"
						    			+		"<input type='hidden' id='G_MEM_ID' name='G_MEM_ID' value='${memberMap.MEM_ID}'>"
						         		+       		value.MEM_ID
						         		+		" 님의 상품문의입니다.</a>";
						    } else {
						    str +=				"<a href='#this' onClick='fn_chkUsr()' style='font-weight: bold;'>"
						         		+       		value.MEM_ID
						         		+		" 님의 상품문의입니다.</a>";
						    	
						    }      		
						    str+=      	    	"</td>"
							            +   		"<td colspan='2' style='width:200px; align=center;'>"
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