
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<style type="text/css">
   @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
   
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
   html {
      height: 100%;
   }
   
   body {
        background:linear-gradient(to bottom right, #f0e199, #f0e199);
   }
   body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{font-family:'맑은 고딕',Malgun Gothic,sans-serif;font-size:12px;color:#666;font-weight:400;}
   
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
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
</style>
</head>
<body>
<div class="card align-middle" style="border-radius:20px; background-color:#fff; margin-top:50px;">
  <div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li class="selected"><a href="/nnS/myshop"><img src="/nnS/resources/images/myshop_tab1.png" width="100" height="30"></a></li>
         <li><a href="/nnS/myshop/saleList"><img src="/nnS/resources/images/myshop_tab2.png" width="100" height="30"></a></li>
         <li><a href="/nnS/myshop/goodsLikeList"><img src="/nnS/resources/images/myshop_tab3.png" width="100" height="30"></a></li>
      </ul>
   </div>
   <div id="main-container">
   		<table>
   		<tr>
			<td>
			<a href="#goodsTab1">
			<img src="./resources/images/d_money.png" alt="" width="100" height="100"/>
			</a>
			</td>
			<td>
			<img src="./resources/images/d_dot.png" alt="" width="50" height="50"/>
			</td>
			<td>
			<a href="#goodsTab2">
			<img src="./resources/images/d_truck.png" alt="" width="100" height="100"/>
			</a>
			</td>
			<td>
			<img src="./resources/images/d_dot.png" alt="" width="50" height="50"/>
			</td>
			<td>
			<a href="#goodsTab3">
			<img src="./resources/images/d_hand.png" alt="" width="100" height="100"/>
			</a>	
			</td>
			</tr>
   		</table>
   		<div class='container' style="width:100%;">
			<ul class='goodsTabs'>
				<li class='selected'><a href='#goodsTab1'><img src="./resources/images/myshop_tab_1.png" alt="" width="90" height="30"/></a></li>
				<li><a href='#goodsTab2'><img src="./resources/images/myshop_tab_2.png" alt="" width="90" height="30"/></a></li>
				<li><a href='#goodsTab3'><img src="./resources/images/myshop_tab_3.png" alt="" width="90" height="30"/></a></li>
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

function fn_goodsDetail(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/shop/goodsDetail' />");
	comSubmit.addParam("GOODS_NUM", obj.parent().find("#title2").val());
	comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
	comSubmit.submit();
}

//구매확정 버튼
function fn_Buychk(num) {
	var comSubmit = new ComSubmit("");
	comSubmit.setUrl("<c:url value='/myshop/BuyComplete' />");
	comSubmit.addParam("ORDERS_NUM", num);
	comSubmit.submit();
}

//주문취소 버튼
function fn_orderCancel(num) {
	var comSubmit = new ComSubmit("");
	comSubmit.setUrl("<c:url value='/myshop/orderCancel' />");
	comSubmit.addParam("ORDERS_NUM", num);
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
				+		"<th width='200px' align='center'><img src=<c:url value='/resources/images/myorder_list1.png'/>></th>"
				+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/myorder_list2.png'/>></th>"
				+		"<th width='200px' align='center'><img src=<c:url value='/resources/images/myorder_list3.png'/>></th>"
				+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/myorder_list4.png'/>></th>"
				+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/myorder_list5.png'/>></th>"
				+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/myshop_ostatus.png'/>></th>"
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
	      	      			+	"<input type='hidden' name='title2' id='title2' value="+value.ORDERS_PRONUM+">"
		      	      		+	"</a></td>"
		      	      		+	"<td width='100px' align='center'>"
	      	      			+	new Date(value.ORDERS_DATE).toLocaleString()
		      	      		+	"</td>"
		      	      		+	"<td width='200px' align='center'>"
		      	      		+	value.ORDERS_DNUM
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