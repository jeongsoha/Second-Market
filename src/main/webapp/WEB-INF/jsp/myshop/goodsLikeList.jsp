<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/include/include-header.jspf" %>

<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<style type="text/css">

td{
	margin:0 0 0 10px
}
td img
{
	width:250px; 
	height:250px;
	margin:10px 10px 10px 0px; 
	border:3px solid #000; 

}

   @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
   
   html {
      height: 100%;
   }
   
   body {
        background:white;
   }
   body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{font-family:'맑은 고딕',Malgun Gothic,sans-serif;font-size:12px;color:#666;font-weight:400;}
   
   }
   
</style>

<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style>
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
article, aside, details, figcaption, figure, footer, header, hgroup,
   menu, nav, section {
   display: block;
}
blockquote, q {
   quotes: none;
}
blockquote : before, blockquote : after, q : before, q : after {
   content: '';
   content: none;
}
table {
   border-collapse: collapse;
   border-spacing: 0;
}
/*css 초기화*/
.card {
   float:left;
   height: 400px;
   width: 25%;
   border-radius: 15px;
   display: inline-block;
   margin-top: 30px;
   margin-left: 50px;
   margin-bottom: 30px;
   position: relative;
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   overflow: hidden;
}
.card-header {
   -webkit-transition: 0.5s; /*사파리 & 크롬*/
    -moz-transition: 0.5s;  /*파이어폭스*/
    -ms-transition: 0.5s;   /*인터넷 익스플로러*/
    -o-transition: 0.5s;  /*오페라*/
    transition: 0.5s;
   width: 100%;
   height: 270px;
   border-radius: 15px 15px 0 0;
   background-image: url("resources/images/no_image.png");
   background-size: 100% 280px;
   background-repeat: no-repeat;   
}
 
..card-header-is_closed{  /* 거래완료 */
    background-color: #EF5A31 ;
    color: #FFF ;
    font-weight: bold ;
    text-align: center ;
    float: right;
    margin: 15px 15px 0 0;
    border-radius: 50%;
    font-weight: bold;
    padding: 10px 10px;
    line-height: 20px;
}
.card-header-is_closed1{ /* 거래중 */
    background-color: #cfc327 ;
    color: #FFF ;
    font-weight: bold ;
    text-align: center ;
    float: right;
    margin: 15px 15px 0 0;
    border-radius: 50%;
    font-weight: bold;
    padding: 10px 10px;
    line-height: 20px;
    }
    
.card-header-is_closed2{ /* 판매중(거래가능) */
    background-color: #3fb50e ;
    color: #FFF ;
    font-weight: bold ;
    text-align: center ;
    float: right;
    margin: 15px 15px 0 0;
    border-radius: 50%;
    font-weight: bold;
    padding: 10px 10px;
    line-height: 20px;
}
h1 {
    font-size: 22px;
    font-weight: bold;
}
.card-body {
}
.card-body-header{
   line-height: 25px;
   margin: 10px 20px 0px 20px;
}
.card-body-description  {
    opacity: 0;
    color: #757B82;
    line-height: 25px;
    -webkit-transition: .2s ease-in-out; /*사파리&크롬*/
    -moz-transition: .2s ease-in-out; /*파이어폭스*/
    -ms-transition: .2s ease-in-out; /*익스플로러*/
    -o-transition: .2s ease-in-out; /*오페라*/
    transition : .2s ease-in-out;
    overflow: hidden;
   height: 180px;
   margin: 5px 20px;
}
 
}
.card-body-hashtag {
   color: #2478FF;
   font-style: italic;
}
.card-body-footer {
     position: absolute; 
     margin-top: 15px;
     margin-bottom: 6px;
    bottom: 0; 
    width: 314px;
    font-size: 10px;
    color: #9FA5A8;
    padding: 0 10px;
}
.icon {
    display: inline-block;
    vertical-align: middle;
    margin-right: 2px;
}
.icon-view_count {
    width: 25px;
    height: 17px;
   background: url("images/eye.jpg") no-repeat;
}
.icon-comments_count {
   margin-left: 5px;
   width: 25px;
    height: 17px;
   background: url("images/comment.jpg") no-repeat;   
}
.reg_date {
	margin-left: 15px;
   float: ;
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
  margin:50px auto auto auto;
}
.tab_menu_btn {
  width:90px;
  height:40px;
  transition:0.3s all;
}
.tab_menu_btn.on {
  border-bottom:2px solid #7112FF;
  font-weight:700;
  color:#7112FF;
}
.tab_menu_btn:hover {
  color:#7112FF;
}
.tab_menu_container{
	float:right;
	margin-right:350px;
	font-family: 'Nanum Gothic';
}

/*메뉴버튼끝*/

	#main-container{
	   align:center;
	   clear:both;
	   font-family: 'Nanum Gothic';
	}
	
		#menu{
		clear:both;
		margin:0px auto 100px auto;
		 
	}
	
	#con{
		margin: auto 100px auto 100px;
	}
	#dot{
		margin:0px auto;
	}

</style>


</head>
<body>
<div id="con">

  <div class="tab_wrap" id="menu">
     <div class="tab_menu_container">
	    <a href="/second/myshop"><button class="tab_menu_btn" type="button">나의 주문내역</button></a>
	    <a href="/second/myshop/saleList"><button class="tab_menu_btn" type="button">나의 판매내역</button></a>
	    <a href="/second/myshop/goodsLikeList"><button class="tab_menu_btn on" type="button">찜 상품목록</button></a>
     </div>
  </div>
  
<div class="card align-middle" style="border-radius:20px; background-color:#fff; margin:50px 0 80px 0; width:100%; height:100%;">
<div id="content">
   		<table class="board_list">
		<colgroup>
			<col width="100%" />
		</colgroup>
		<thead>
			<tr>
			</tr>
		</thead>
		<tbody>
		</tbody>
		</table>
		<div id="PAGE_NAVI" align="center"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
   </div>
</div>
</div>
</div>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
	


<script type="text/javascript">
		$(document).ready(function() {
			
			fn_selectGoodsList(1);

			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_goodsDetail($(this));
			});
			
		});
	
		function fn_goodsDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail' />");
			comSubmit.addParam("GOODS_NUM", obj.parent().find("#IDX1").val());
			comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
			comSubmit.submit();
		}
		
		function fn_selectGoodsList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/myshop/selectGoodsList' />");
			comAjax.setCallback("fn_selectGoodsListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());
			comAjax.addParam("sortType", $('#sortType').val());
			comAjax.addParam("path", $('#path').val());
			comAjax.ajax();
		}

		function fn_selectGoodsListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					recordCount : 15,
					eventName : "fn_selectGoodsList"
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(
								data.list,
								function(key, value) {
									var imgpath = "";
									var tstatus = "";
									
									if(value.GOODS_THUMBNAIL == null){
										imgpath = 	"<div class='card-header'>"
									}else{
										imgpath = "<div class='card-header' style='background-image:url(\"/second/file/"+ value.GOODS_THUMBNAIL + "\");'>"
										//alert(imgpath);
									}
									if(value.GOODS_TSTATUS == 'N'){
										tstatus += "<div class = 'card-header-is_closed2' >" 
										 	     + "<div class = 'card-header-text' >" 
												 + "거래가능"; 
									}else if (value.GOODS_TSTATUS == 'ING'){ 
									/* }else if (value.GOODS_QTY == 0){ */
										tstatus += "<div class = 'card-header-is_closed' >" 
										 	     + "<div class = 'card-header-text' >" 
										 	     + "거래불가";
									}
									
									str +=  "<div class='card'>"
										+		"<a href='#this' name='title'>"
										+	      imgpath
										+ 		  tstatus
										+ 					"</div >"
 
										+	            "</div >"
										+	      "</div>"
										+	      "<div class='card-body'>"
										+	         "<div class='card-body-header'>"
										+	            "<h1>"
										+				value.GOODS_TITLE
										+				"</h1>"
 
										+	            "<p class = 'card-body-nickname'>"
										+	                                 "판매자: "
										+									value.SELLER_ID
										+	                          "</p>"
										+	         "</div>"
										+	         "<p class='card-body-description'> 상품내용"
										+	           
										+	         "</p>"
										+	         "<div class='card-body-footer'>"
										+	            "<hr style='margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31'>"
										+	            "<i class='icon icon-view_count'></i>조회수 "
										+				value.GOODS_COUNT
										+				"회"
 
										+	            "<i class='reg_date'>"
										+				new Date(value.GOODS_DATE).toLocaleString()
										+				"</i>"
										+	         "</div>"
										+	      "</div>"
										+ 	   "<input type='hidden' id='IDX1' value=" + value.GOODS_NUM + ">"
										+	   "</a>"
										+	   "</div>";
										
								});
				body.append(str);

				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_goodsDetail($(this));
				});
			}
		}
	</script>
</body>
</html>