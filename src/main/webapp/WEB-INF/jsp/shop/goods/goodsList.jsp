<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
</style>

<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>

<style>
h1, h2, h3, h4, h5, h6,
   p {
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
.text_box {
	font-family : 'Nanum Gothic';
	text-align : center;
	padding : 10px 0;
}
/*css 초기화*/
.card {
/*    float:left; */
   height: 350px;
   width: 20%;
   display: inline-block;
   margin-top: 30px;
   margin-left: 10px;
   margin-right: 10px;
   margin-bottom: 30px;
   position: relative;
   /* box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); */
   border: 1px solid #dfdfdf;
   overflow: hidden;
}
.card-header {
   -webkit-transition: 0.5s; /*사파리 & 크롬*/
    -moz-transition: 0.5s;  /*파이어폭스*/
    -ms-transition: 0.5s;   /*인터넷 익스플로러*/
    -o-transition: 0.5s;  /*오페라*/
    transition: 0.5s;
   width: 100%;
   height: 230px;
   background-image: url("second/resources/images/no_image.png");
   background-size: 100% 280px;
   background-repeat: no-repeat;   
}
.card:hover  {
   box-shadow: 0 16px 32px 0 rgba(0, 0, 0, 0.2), 0 20px 40px 0 rgba(0, 0, 0, 0.19);
}
.card-header-is_closed{  /* 거래완료 */
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
    font-size: 20px;
    font-weight: bold;
}

h3 {
    font-size: 18px;
    font-weight: bold;
    color: #ff0000;
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
.card:hover .card-body-description {
    opacity: 1;
    -webkit-transition: .5s ease-in-out;
    -moz-transition: .5s ease-in-out;
    -ms-transition: .5s ease-in-out;
    -o-transition: .5s ease-in-out;
    transition : .5s ease-in-out;
    overflow: scroll;
}

.card-body-footer {
     position: absolute; 
     margin-top: 15px;
     margin-bottom: 6px;
    bottom: 0; 
    width: 250px;
    font-size: 10px;
    color: #9FA5A8;
    padding: 0 10px;
}
.icon {
    display: inline-block;
    vertical-align: middle;
    margin-right: 2px;
}

.reg_date {
	margin-left: 15px;
   float: ;
}
nav {
  position: relative;
  display: flex;
  width: 1000px;
  margin: 0 0 0 350px;
    text-align: center;
}
nav a {
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
nav a:nth-child(1).is-current ~ .nav-underline {
  left: 0;
}
nav a:nth-child(2).is-current ~ .nav-underline {
  left: 20%;
}
nav a:nth-child(3).is-current ~ .nav-underline {
  left: 40%;
}
nav a:nth-child(4).is-current ~ .nav-underline {
  left: 60%;
}
nav a:nth-child(5).is-current ~ .nav-underline {
  left: 80%;
}
nav a:nth-child(1):hover ~ .nav-underline {
  left: 0;
}
nav a:nth-child(2):hover ~ .nav-underline {
  left: 20%;
}
nav a:nth-child(3):hover ~ .nav-underline {
  left: 40%;
}
nav a:nth-child(4):hover ~ .nav-underline {
  left: 60%;
}
nav a:nth-child(5):hover ~ .nav-underline {
  left: 80%;
}

.search_box1{
	width: 100px;
    height: 30px;
}
</style>


</head>
<body>


<nav>
  <a href="<c:url value="/shop/allGoodsList"/>" <c:if test="${sortType eq 'all'}"> class="is-current"</c:if>>등록순</a>
  <a href="<c:url value="/shop/priceGoodsList"/>" <c:if test="${sortType eq 'price'}"> class="is-current"</c:if>>가격높은순</a>
  <a href="<c:url value="/shop/viewGoodsList"/>" <c:if test="${sortType eq 'view'}"> class="is-current"</c:if>>인기순</a>
  <div class="nav-underline"></div>
</nav>
   
   <div id="main-container" class="text_box" style="font-size:14pt;">
   
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
		<div align="center">
		<form action="/second/shop" method="post">
			<fieldset style="margin-top: 10px;">
				<select name="searchType" id="searchType" class="search_box1" style="border: 0.1em solid #000;">
					<option value="title" <c:out value="${searchType eq 'title'?'selected':''}"/>>상품명</option>
					<option value="content" <c:out value="${searchType eq 'content'?'selected':''}"/>>내용</option>
					<option value="region" <c:out value="${searchType eq 'region'?'selected':''}"/>>지역</option>
				</select>
				<input type="text" class="txt" placeholder="Search" name="keyword" id="keyword" value="${keyword}"/>&nbsp;
				<input type="submit" value="검색" class="btn" onClick="onSearch()"/>
				<input type="hidden" id="path" value="${path}" />
				<input type="hidden" id="sortType" value="${sortType}" />
			</fieldset>
		</form>
		</div>
		
		<div id="PAGE_NAVI" align="center"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
   
	<div align="right">
	<c:if test="${session_MEM_ID ne null }">
		<a href="#this" class="btn" id="write">글쓰기</a>
	</c:if>
	</div>

   </div>

    
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	
<script type="text/javascript">
		$(document).ready(function() {
			
			fn_selectGoodsList(1);
			
			$("#write").on("click", function(e) { //상품등록 버튼
				e.preventDefault();
				fn_goodsWrite();
			});

			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_goodsDetail($(this));
			});
			
		});
		
		function fn_goodsWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsWriteForm' />");
			comSubmit.submit();
		}
	
		function fn_goodsDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail' />");
			comSubmit.addParam("GOODS_NUM", obj.parent().find("#IDX1").val());
			comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
			comSubmit.submit();
		}
		
		function fn_selectGoodsList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/shop/selectGoodsList' />");
			comAjax.setCallback("fn_selectGoodsListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 8);
			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());
			comAjax.addParam("sortType", $('#sortType').val());
			comAjax.addParam("path", $('#path').val());
			comAjax.ajax();
		}
		
		Number.prototype.format = function(){			// 숫자 3자리마다 콤마 삽입
		    if(this==0) return 0;	
		 
		    var reg = /(^[+-]?\d+)(\d{3})/;			// 정규식
		    var n = (this + '');
		 
		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		 
		    return n;
		};
		
		Date.prototype.format = function (f) {
		    if (!this.valueOf()) return " ";
		    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
		    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
		    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
		    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
		    var d = this;

		    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {

		        switch ($1) {
		            case "yyyy": return d.getFullYear(); // 년 (4자리)
		            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
		            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
		            case "dd": return d.getDate().zf(2); // 일 (2자리)
		            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
		            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
		            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
		            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
		            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
		            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
		            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
		            case "ss": return d.getSeconds().zf(2); // 초 (2자리)
		            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
		            default: return $1;
		        }
		    });
		};
		
		String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
		String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
		Number.prototype.zf = function (len) { return this.toString().zf(len); };
		
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
					recordCount : 8,
					eventName : "fn_selectGoodsList"
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(
								data.list,
								function(key, value) {
									var imgpath = "";
									var tstatus = "";
									var goods_price = value.GOODS_PRICE;
										goods_price = goods_price.format();  /* number가 아니면 에러 */
										
									if(value.GOODS_THUMBNAIL == null){
										imgpath = 	"<div class='card-header'>"
									}else{
										imgpath = "<div class='card-header' style='background-image:url(\"" + $('#path').val() + value.GOODS_THUMBNAIL + "\");'>"
										//alert(imgpath);
									}
									if(value.GOODS_TSTATUS == 'N'){ //거래가능(판매중)
										tstatus += "<div class = 'card-header-is_closed2' >" 
										 	     + "<div class = 'card-header-text' >" 
												 + "거래가능"; 
									}else if (value.GOODS_TSTATUS == 'ING'){ 
									/* }else if (value.GOODS_QTY == 0){ */
										tstatus += "<div class = 'card-header-is_closed1' >" 
										 	     + "<div class = 'card-header-text' >" 
										 	     + "거래중";
									}else if (value.GOODS_TSTATUS == 'END'){ 
										/* }else if (value.GOODS_QTY == 0){ */
											tstatus += "<div class = 'card-header-is_closed' >" 
											 	     + "<div class = 'card-header-text' >" 
											 	     + "거래완료";
									}
							
									str +=  "<div class='card'>"
										+		"<a href='#this' name='title'>"
										+	      imgpath
										+ 		  tstatus
										+ 					"</div >"
										+	                "<div class = 'card-header-number' >"
										+					"</div >" 
										+	            "</div >"
										+	      "</div>"
										+	      "<div class='card-body'>"
										+	         "<div class='card-body-header'>"

										+			"<div style='float: left;'>"
										+	            "<h1>"
										+				value.GOODS_TITLE
										+				"</h1>"
										+			"</div>"
										+	"<br>"
										+		"<div>"
										+			"<div style='display: inline-block; float: left;'>"
										+	            "<h3>"
										+ 				goods_price +"원"
										+				"</h3>"
										+			"</div>"
										+	            "<div class = 'card-body-nickname' style='display: inline-block; float: right;'>"
										+	                                 "판매자: "
										+									value.MEM_ID
										+	            "</div>"
										+	         "</div>"
										+		"</div>"
										+	         "<div class='card-body-footer'>"
										+	            "<hr style='margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31'>"
										+	            "<i class='icon icon-view_count'></i>조회수 "
										+				value.GOODS_COUNT
										+				"회"
										+	            "<i class='icon icon-comments_count'></i>좋아요 "
										+				value.TOTAL_COUNT2
										+				"개"
										+	            "<i class='reg_date'>"
										+				new Date(value.GOODS_DATE).format('yyyy-MM-dd')
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
	<script type="text/javascript">

$(document).ready(function () {
    $('.bxslider12').bxSlider({
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        autoControls: true, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
    });
});

      
      
</script>
</body>
</html>