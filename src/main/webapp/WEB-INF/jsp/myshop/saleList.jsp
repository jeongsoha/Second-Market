<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/include/include-header.jspf" %>
    <meta charset="UTF-8" />
    <link href="
    <c:url value="/resources/css/board.css" />
    " rel="stylesheet">
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
    />

    <style type="text/css">
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
      html,
      body,
      div,
      span,
      applet,
      object,
      iframes,
      h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      p,
      blockquote,
      pre,
      a,
      abbr,
      acronym,
      address,
      big,
      quotes,
      code,
      del,
      dfn,
      em,
      img,
      ins,
      kbd,
      q,
      s,
      samp,
      small,
      strike,
      sub,
      sup,
      tt,
      var,
      u,
      i,
      center,
      dl,
      dt,
      dd,
      ol,
      ul,
      li,
      fieldset,
      form,
      label,
      legend,
      table,
      caption,
      tbody,
      tfoot,
      thead,
      tr,
      th,
      td,
      article,
      aside,
      canvas,
      details,
      embed,
      figure,
      figcaption,
      footer,
      header,
      hgroup,
      menu,
      nav,
      output,
      ruby,
      section,
      summary,
      time,
      mark,
      audio,
      video {
        margin: 0;
        padding: 0;
        border: 0;
		font-size: 14px;
	
        do: inherit;
        vertical-align: baseline;
      }
#main-container{
  
   align:center;
   font-family: 'Nanum Gothic';
   font-size:15px;
   clear: both;
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
        background: white;
      }
      body,
      table,
      input,
      select,
      textarea,
      button,
      h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      a {
        font-family: 'Nanum Gothic', sans-serif;
        font-size: 14px;
        color: #666;
        font-weight: 400;
      }
      .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
          0 6px 20px 0 rgba(0, 0, 0, 0.19);
        clear: both;
        padding: 0px;
        background: #eeeeee;
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
		
      #con {
         margin: auto 100px auto 100px; 
      }
      #dot {
        margin: 0px auto;
      }
      /*배송번호 기입란*/
      #ORDERS_DELE_NUM{
        margin: 0px 5px;
        
        border: 1px solid #bcbcbc;
        width: 120px;
        
      }
      
       #order_date{
      font-size:12px;
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
          <a href="/second/myshop"
            ><button class="tab_menu_btn" type="button">
              나의 주문내역
            </button></a
          >
          <a href="/second/myshop/saleList"
            ><button class="tab_menu_btn on" type="button">
              나의 판매내역
            </button></a
          >
          <a href="/second/myshop/goodsLikeList"
            ><button class="tab_menu_btn" type="button">찜 상품목록</button></a
          >
        </div>
      </div>

      <div
        class="card align-middle"
        style="border-radius: 20px; background-color: #fff; margin-top: 50px;"
      >
        <div id="content">
          <div id="main-container">
            <table>
              <tr>
                <td>
                  <div style="text-align: center;">
                    <a href="#goodsTab1">
                      <img
                        src="../resources/images/d_money.png"
                        alt=""
                        width="150"
                        height="150"
                      />
                    </a>
                  </div>
                </td>

                <td>
                  <div id="dot">
                    <img
                      src="../resources/images/d_dot.png"
                      alt=""
                      width="50"
                      height="50"
                    />
                  </div>
                </td>

                <td>
                  <div style="text-align: center;">
                    <a href="#goodsTab2">
                      <img
                        src="../resources/images/d_truck.png"
                        alt=""
                        width="150"
                        height="150"
                      />
                    </a>
                  </div>
                </td>

                <td>
                  <div id="dot">
                    <img
                      src="../resources/images/d_dot.png"
                      alt=""
                      width="50"
                      height="50"
                    />
                  </div>
                </td>

                <td>
                  <div style="text-align: center;">
                    <a href="#goodsTab3">
                      <img
                        src="../resources/images/d_hand.png"
                        alt=""
                        width="150"
                        height="150"
                      />
                    </a>
                  </div>
                </td>
              </tr>
            </table>

            <div class="container" style="width: 100%;">
              <ul class="goodsTabs">
                <li class="selected"><a href="#goodsTab1">전체 판매상품</a></li>
                <li><a href="#goodsTab2">배송중</a></li>
                <li><a href="#goodsTab3">판매 완료</a></li>
              </ul>
              <div class="goodsTab_container">
                <div id="goodsTab1" class="goodsTab_content">
                  <table id="main_table1" class="tbl_type">
                    <tbody></tbody>
                  </table>
                  <div id="PAGE_NAVI" align="center"></div>
                  <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
                </div>
                <div id="goodsTab2" class="goodsTab_content">
                  <table id="main_table2" class="tbl_type">
                    <tbody></tbody>
                  </table>
                  <div id="PAGE_NAVI" align="center"></div>
                  <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
                </div>
                <div id="goodsTab3" class="goodsTab_content">
                  <table id="main_table3" class="tbl_type">
                    <tbody></tbody>
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
      $(document).ready(function () {
        fn_selectMySaleList(1, 1);
        //Default Action
        $(".goodsTab_content").hide(); //Hide all content
        $("ul.goodsTabs li:first").addClass("active").show(); //Activate first goodsTab
        $(".goodsTab_content:first").show(); //Show first goodsTab content
        //On Click Event
        $("ul.goodsTabs li").click(function () {
          $("ul.goodsTabs li").removeClass("selected active"); //Remove any "active" class
          $(this).addClass("selected active"); //Add "active" class to selected goodsTab
          $(".goodsTab_content").hide(); //Hide all goodsTab content
          var activegoodsTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active goodsTab + content
          if ($(this).find("a").attr("href") == "#goodsTab2") {
            fn_selectMySaleList(1, 2);
          } else if ($(this).find("a").attr("href") == "#goodsTab3") {
            fn_selectMySaleList(1, 3);
          }
          $(activegoodsTab).fadeIn(); //Fade in the active content
          return false;
        });
        $("a[name='title']").on("click", function (e) {
          //제목
          e.preventDefault();
          fn_openGoodsDetail($(this));
        });
        
        $("#DNUM_IN").on("click", function(e) { // 송장번호 입력버튼
    		e.preventDefault();
    		var PRO_NUM = value.GOODS_NUM;
    		fn_DELE_NUM_in(PRO_NUM);	
    	});
         	 
      });
      function fn_goodsDetail(obj) {
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/shop/goodsDetail' />");
        comSubmit.addParam("GOODS_NUM", obj.parent().find("#title2").val());
        comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
        comSubmit.submit();
      }

      /* 주문번호 클릭 주문상세*/
      function fn_orderDetail(obj) {
    		var comSubmit = new ComSubmit();
    		comSubmit.setUrl("<c:url value='/myshop/orderDetail' />");
    		comSubmit.addParam("ORDERS_NUM", obj.parent().find("#title2").val());
    		//comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
    		comSubmit.submit();
    	}
      // 입력확인 버튼
      function fn_DELE_NUM_in(num) {
        var comSubmit = new ComSubmit("");
        comSubmit.setUrl("<c:url value='/myshop/inputDnum' />");
        comSubmit.addParam("ORDERS_DELE_NUM", $("#ORDERS_DELE_NUM").val());
        comSubmit.addParam("ORDERS_NUM", num);
        alert( $("#ORDERS_DELE_NUM").val());
        alert( $('input[name=ORDERS_DELE_NUM]').val());
        alert(num);
        comSubmit.submit();
      }
      function fn_selectMySaleList(pageNo, tabNo) {
        var comAjax = new ComAjax();
        comAjax.setUrl("<c:url value='/myshop/selectSaleList' />");
        comAjax.setCallback("fn_selectMySaleListCallback1"); //과정이 끝나고 가져온 DATA(맵형태)를 콜백할 곳
        comAjax.addParam("PAGE_INDEX", pageNo); //기본 페이징넘버 스트링
        comAjax.addParam("PAGE_ROW", 15);
        comAjax.addParam("MEM_ID", "${MEM_ID}");
        comAjax.addParam("tabNo", tabNo); // 어떤 SQL SELECT문을 활용할지 판단하는 String DATA
        comAjax.ajax();
      }
      function fn_selectMySaleListCallback1(data) {
        var total = data.TOTAL;
        var tabNo = data.tabNo;
        var body = "";
        if (tabNo == 1) {
          body = $("#main_table1 tbody");
        } else if (tabNo == 2) {
          body = $("#main_table2 tbody");
        } else if (tabNo == 3) {
          body = $("#main_table3 tbody");
        }
        var str1 = "";
        body.empty();
        str1 +=
          "<tr>" +
          "<th width='100px' align='center'>상품번호</th>" +
          "<th width='100px' align='center'>상품이름</th>" +
          "<th width='100px' align='center'>상품이미지</th>" +
          "<th width='150px' align='center'>주문일시</th>" +
          "<th width='100px' align='center'>주문번호</th>" +
          "<th width='100px' align='center'>판매상태</th>" +
          "<th width='200px' align='center'>송장번호</th>" ;
        if (total == 0) {
          str1 +=
            '<tr align="center">' +
            "<td colspan='7'>조회된 결과가 없습니다.</td>" +
            "</tr>";
          body.append(str1);
        } else {
          //각 탭 상황에 맞는 바디내용 행 구성
          var params = {
            divId: "PAGE_NAVI",
            pageIndex: "PAGE_INDEX",
            totalCount: total,
            recordCount: 15,
            eventName: "fn_selectMySaleList",
          };
          gfn_renderPaging(params);
          
          $.each(data.list, function (key, value) {
            str1 +=
              "<tr>" +
              "<td width='70px' align='center'>" +
              value.GOODS_NUM +
              "</td>" +
              "<td width='100px' align='center'>" +
              "<a href='#this' id='title' name='title'>" +
              value.GOODS_TITLE +
              "</a>" +
              "<input type='hidden' id='title2' name='title2' value=" +
              value.GOODS_NUM +
              ">" +
              "</td>" +
              "<td width='200px' align='center'>" +
              "<img alt='' width='50' height='50' src=/second/file/" +
              value.GOODS_THUMBNAIL +
              ">" +
              "</td>";
              
              if ( value.ORDERS_NUM != null ) 
                  {
                      str1 += "<td id='order_date' width='100px' align='center'>" +
                      new Date(value.ORDERS_DATE).toLocaleString() +
                      "</td>" +
                      "<td><a href='#this' id='orderDetail' name='orderDetail'>"+
        	    		value.ORDERS_NUM +
              			"<input type='hidden' name='title2' id='title2' value="+value.ORDERS_NUM+">"+
        	      		"</a></td></td> <td width='100px' align='center'>" +
                        value.ORDERS_STATUS +
                        "</td>";

       		 } else {
                      str1 += "<td>구매자가 없습니다.</td><td>-</td><td width='100px' align='center'>" +
                      value.ORDERS_STATUS +
                      "</td>";
                    }

              
            if (
              value.ORDERS_STATUS == "배송중" ||
              value.ORDERS_STATUS == "거래완료"
            ) {
              str1 +=
                "<td width='200px' align='center'>" +
                value.ORDERS_DELE_NUM +
                "</td>" ;
            } else if (value.ORDERS_STATUS == "주문/결제") {
              str1 +=
                "<td width='200px' align='center'> <input type='text' id='ORDERS_DELE_NUM' name='ORDERS_DELE_NUM' placeholder='송장번호 입력'>" +
                "<input type='button' id='DNUM_IN' name='DNUM_IN' value='저장' onclick='fn_DELE_NUM_in(" +
                value.GOODS_NUM+
                ")' >" +
                "</td>";
            } else {
              str1 += "<td></td>";
            }
            str1 += "</tr>";
          });
          body.append(str1);
          $("a[name='title']").on("click", function (e) {
            //제목
            e.preventDefault();
            fn_goodsDetail($(this));
          });

          $("a[name='orderDetail']").on("click", function (e) {
              //제목
              e.preventDefault();
              fn_orderDetail($(this));
            });
        }
      }
    </script>
  </body>
</html>