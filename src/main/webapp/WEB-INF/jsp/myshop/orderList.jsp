
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet"> <!-- //세부탭 css 있음 -->
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<style type="text/css">

 @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
 
html, body, div, span, applet, object, iframes, h1, h2, h3, h4, h5, h6,
   p, blockquote, pre, a, abbr, acronym, address, big, quotes, code, del,
   dfn, em, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, u,
   i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
   caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
   details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
   output, ruby, section, summary, time, mark, audio, video {
   margin: 0;
   padding: 0;
   border: 0;
   
   do: inherit;
   vertical-align: baseline;
}
   body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{
   font-family:'Nanum Gothic',sans-serif;
   font-size:14px;
   color:#666;
   font-weight:400;}
   }
#main-container{
   
   align:center;
   font-family: 'Nanum Gothic';
   font-size:15px;
	clear:both;
}

#content{
	width:1000px;
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
  width:120px;
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


/*메뉴버튼끝*/

   html {
      height: 100%;
   }
   
   body {
        background:white;
   }
   body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{font-size:14px;color:#666;font-weight:400;}
   
    .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        clear:both;
        padding: 0px;
        background:#eeeeee;
   }
   
   .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
   }
   .goodsTab_content img {
	float: none;
	margin: auto;
	border: 0px;
	padding: 5px;
	}
	
	#menu{
		clear:both;
		/* margin:0px auto 100px auto; */
}
		 
	
	#con{
		margin: auto 100px auto 100px; 
	}
	#dot{
		margin:0px auto;
	}
	#con2{
		clear:both;
	}
a{
	font-size:12px;
	color: #000;
}
</style>
</head>
<body>
<div id="con">
 
  <div class="tab_wrap" id="menu">
     <div class="tab_menu_container">
	    <a href="/second/myshop"><button class="tab_menu_btn on" type="button">나의 주문내역</button></a>
	    <a href="/second/myshop/saleList"><button class="tab_menu_btn" type="button">나의 판매내역</button></a>
	    <a href="/second/myshop/goodsLikeList"><button class="tab_menu_btn" type="button">찜 상품목록</button></a>
     </div>
  </div>
  
<div class="card align-middle" style="border-radius:20px; background-color:#fff; margin-top:50px;">
  <div id="content">
   
   <div id="main-container">
   		<table>
   		<tr>
   		
			<td>
			<div style="text-align:center;">
			<a href="#goodsTab1">
			<img src="./resources/images/d_money.png" class='selected' alt="" width="150" height="150"/> 
			</div>
			</td>
			
			<td>
			<div id="dot">
			<img src="./resources/images/d_dot.png" alt="" width="50" height="50"/>
			</div>
			</td>
			
			<td>
			<div style="text-align:center;">
			<a href="#goodsTab2">
			<img src="./resources/images/d_truck.png" alt="" width="150" height="150"/>
			</a>
			</div>
			</td>
			
			<td>
			<div id="dot">
			<img src="./resources/images/d_dot.png" alt="" width="50" height="50"/>
			</div>
			</td>
			
			<td>
			<div style="text-align:center;">
			<a href="#goodsTab3">
			<img src="./resources/images/d_hand.png" alt="" width="150" height="150"/>
			</a>
			</div>	
			</td>
			
		
	</tr>
   	</table>
   	
   	
   		<div class='container' style="width:100%;" id="con2">
 			<ul class='goodsTabs'>
				<li class='selected'><a href='#goodsTab1'>주문/결제</a></li>
				<li><a href='#goodsTab2'>배송중</a></li>
				<li><a href='#goodsTab3'>배송완료</a></li>
			</ul> 
			<div class='goodsTab_container'>
				<div id="goodsTab1" class="goodsTab_content">
					<table id="main_table1" class="tbl_type">
						<tbody>
						</tbody>
					</table>
					<div id="PAGE_NAVI" align="center"></div>
					<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
					
				</div>
			<div id="goodsTab2" class="goodsTab_content">
				<table id="main_table2" class="tbl_type">
					<tbody>
					</tbody>
				</table>
				<div id="PAGE_NAVI" align="center"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
					
			</div>
			<div id="goodsTab3" class="goodsTab_content">
				<table id="main_table3" class="tbl_type">
					<tbody>
					</tbody>
				</table>
				<div id="PAGE_NAVI" align="center"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
					
			</div>
			
		</div>
   	</div>
   	
   	
   	
   </div>
   
   
</div>

</div>


</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	fn_selectOrderList(1,1);
	
	//Default Action
	$(".goodsTab_content").hide(); //Hide all content
	$("ul.goodsTabs li:first").addClass("selected active").show(); //Activate first goodsTab
	$(".goodsTab_content:first").show(); //Show first goodsTab content
	
	//On Click Event
	$("ul.goodsTabs li").click(function() {
		$("ul.goodsTabs li").removeClass("selected active"); //Remove any "active" class
		$(this).addClass("selected active"); //Add "active" class to selected goodsTab
		$(".goodsTab_content").hide(); //Hide all goodsTab content
		var activegoodsTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active goodsTab + content
		
		if($(this).find("a").attr("href") == "#goodsTab2"){
			fn_selectOrderList(1,2);
		}else if($(this).find("a").attr("href") == "#goodsTab3"){
			fn_selectOrderList(1,3);
		}
		$(activegoodsTab).fadeIn(); //Fade in the active content
		return false;
	});
	
	$("a[name='title']").on("click", function(e) { //제목 
		e.preventDefault();
		fn_goodsDetail($(this));
	});

});
/* 주문번호 클릭 주문상세*/
function fn_goodsDetail(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/myshop/orderDetail' />");
	comSubmit.addParam("ORDERS_NUM", obj.parent().find("#title2").val());
	//comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
	comSubmit.submit();
}

//구매확정 버튼
function fn_Buychk(num) {
	var comSubmit = new ComSubmit("");
	comSubmit.setUrl("<c:url value='/myshop/BuyComplete' />");
	comSubmit.addParam("ORDERS_NUM", num);//GOODS에 END업데이트 작업에도 쓰임	
	comSubmit.submit();
}

//주문취소 버튼
function fn_orderCancel(num) {
	var comSubmit = new ComSubmit("");
	comSubmit.setUrl("<c:url value='/myshop/orderCancel' />");
	comSubmit.addParam("ORDERS_NUM", num);
	comSubmit.submit();
}

//리뷰 남기기 버튼
function fn_reveiw(ordernum, pronum) {
	var comSubmit = new ComSubmit("");
	comSubmit.setUrl("<c:url value='/myshop/review' />");
	comSubmit.addParam("ORDERS_PRONUM", pronum);
	comSubmit.addParam("ORDERS_NUM", ordernum);
	//alert(ordernum);
	
	comSubmit.submit();
}

function fn_selectOrderList(pageNo, tabNo) {
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/myshop/selectOrderList' />");
	comAjax.setCallback("fn_selectOrderListCallback1");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 15);
	comAjax.addParam("MEM_ID", "${MEM_ID}");
	comAjax.addParam("tabNo", tabNo);
	comAjax.ajax();
}


function fn_selectOrderListCallback1(data) {
	var total = data.TOTAL;
	var tabNo = data.tabNo;
	var body = "";
	
	if(tabNo == 1){
		body = $("#main_table1 tbody");	
	}else if(tabNo == 2){
		body = $("#main_table2 tbody");	
	}else if(tabNo == 3){
		body = $("#main_table3 tbody");	
	}
	var str1 = "";
	body.empty();
	str1 	+= 	"<tr>"
				+		"<th width='150px' align='center'>주문번호</th>"
				+		"<th width='100px' align='center'>주문일자</th>"
				+		"<th width='200px' align='center'>송장번호</th>"
				+		"<th width='100px' align='center'>주문금액</th>"
				+		"<th width='100px' align='center'>주문상태</th>"
				+		"<th width='100px' align='center'>주문상태 변경</th>"
				+	"</tr>";
	if (total == 0) {
		str1 += "<tr align='center'>" 
			  +	"<td colspan='6'>조회된 결과가 없습니다.</td>"
			  +	"</tr>";
		body.append(str1);
	} else {
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			recordCount : 15,
			eventName : "fn_selectOrderList"
			
		};
		gfn_renderPaging(params);
			
		$.each(data.list, 
				function(key, value) {
					//if(value.ORDERS_STATUS == "주문/결제") {
						str1 +=	"<tr>"
				    		+	"<td><a href='#this' id='title' name='title'>"
				    		+	value.ORDERS_NUM
	      	      			+	"<input type='hidden' name='title2' id='title2' value="+value.ORDERS_NUM+">"
		      	      		+	"</a></td>"
		      	      		+	"<td width='100px' align='center'>"
	      	      			+	new Date(value.ORDERS_DATE).toLocaleString()
		      	      		+	"</td>"
		      	      		+	"<td width='200px' align='center'>"
		      	      		+	value.ORDERS_DELE_NUM
		      	      		+	"</td>"
		      	      		+	"<td width='100px' align='center'>"
		      	      		+	value.ORDERS_PRICE
		      	      		+	"</td>"
		      	      		+	"<td width='100px' align='center'>"
		      	      		+	value.ORDERS_STATUS	
		      	      		+	"</td>"
		      	      		+	"<td>";
		      	      	if(value.ORDERS_STATUS == "주문/결제"){
	      	      			str1 +=	"<input type='button' id='orderCancel' name='orderCancel' value='주문취소' onclick='fn_orderCancel("+value.ORDERS_PRONUM+")' >";
		      	      	}else if(value.ORDERS_STATUS == "배송중"){
		      	      		str1 += "<input type='button' id='Buychk' name='Buychk' value='구매확정' onclick='fn_Buychk("+value.ORDERS_PRONUM+")' >"
		      	      	}else if(value.ORDERS_REVIEW_CONFIRM =="Y"){
			      	      	str1 += "내가 준 점수 : " + value.ORDERS_REVIEW_GRADE
		      	      	}else if(value.ORDERS_STATUS == "거래완료" && value.ORDERS_REVIEW_CONFIRM !="Y"){
		      	      		str1 += "<input type='button' id='reveiw' name='reveiw' value='리뷰남기기' onclick='fn_reveiw("+value.ORDERS_NUM+","+value.ORDERS_PRONUM+")' >" //(유진추가) 리뷰 남기기 버늩
		      	      	}else {
		      	      		str1 += "<td></td>";
		      	      	}
		      	      	str1 +=	"</td>"
		      	      		+	"</tr>";
					//}
		});
							body.append(str1);
							
			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_goodsDetail($(this));
			});
				
	}
} 

</script>

</body>
</html>