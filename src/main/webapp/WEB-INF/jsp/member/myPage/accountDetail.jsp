<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/include/include-header.jspf" %>
    <meta charset="UTF-8" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
    />
    
    <style type="text/css">
    @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.btn{
    width: 100px;
    background-color: #fff;
    border:1px solid #80EB1C;
    color: #000;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius: 10px;
}
    .form-control {
      height: auto;

      padding: 10px;
      font-size: 16px;
      align: right;
    }

    #main-container {
      width: 1100px;
      align: center;
      font-family: "Nanum Gothic";
      clear: both;
    }

    #content {
      width: 1120px;
      margin-left: 50px;
    }

    button {
      background: none;
      border: 0;
      outline: 0;
      cursor: pointer;
    }
    .tab_menu_container {
      display: flex;
    }
    .tab_menu_btn {
      width: 90px;
      height: 40px;
      transition: 0.3s all;
    }
    .tab_menu_btn.on {
      border-bottom: 2px solid #df0000;
      font-weight: 700;
      color: #df0000;
    }
    .tab_menu_btn:hover {
      color: #df0000;
    }
    .tab_menu_container {
      float: right;
      font-family: "Nanum Gothic";
      margin-bottom: 50px;
    }
    .tab_wrap {
      clear: both;
    }
    
a{
   color: #000;
   text-decoration: none;	
}
  </style>
    
  </head>
 
  <body
    onload="begin()"
    cellpadding="0"
    cellspacing="0"
    marginleft="0"
    margintop="0"
    width="100%"
    height="100%"
    align="center"
  >
    <div style="border-radius: 20px; background-color: #fff; margin-top: 50px;">
      <div id="content">
        <div class="tab_wrap">
          <div class="tab_menu_container">
            <a href="accountDetail"
              ><button class="tab_menu_btn on" type="button">
                회원정보
              </button></a
            >
            <a href="pwModifyForm"
              ><button class="tab_menu_btn" type="button">
                비밀번호 변경
              </button></a
            >
            <a href="deleteAccount"
              ><button class="tab_menu_btn" type="button">회원탈퇴</button></a
            >
            <a href="reportList"
              ><button class="tab_menu_btn" type="button">
                내 신고 내역
              </button></a
            >
            <a href="qnaList"
              ><button class="tab_menu_btn" type="button">
                내 문의 내역
              </button></a
            >
          </div>
        </div>







        <div
          id="main-container"
          style="width: 1000px; padding: 0px 0px 0px 200px;"
        >
          <div style="margin-top: 30px;">
            <h2 class="card-title text-center" style="color: #113366;">
              회 원 정 보 확 인
            </h2>
            <br />
          </div>
          <div>
            아 이 디
            <div class="form-control">${map.MEM_ID }</div>
            <br />
            이 름
            <div class="form-control">${map.MEM_NAME }</div>
            <br />
            생 년 월 일
            <div class="form-control">생년월일 ${map.MEM_BIRTH }</div>
            <br />
            성 별
            <div class="form-control">${map.MEM_GEN }</div>
            <br />
            이 메 일
            <div class="form-control">${map.MEM_EMAIL }</div>
            <br />
            휴 대 전 화
            <div class="form-control">${map.MEM_PHONE }</div>
            <br />
            주 소
            <div class="form-control">${map.MEM_ADD1 }</div>
            <br />
          </div>
           내 평점
           <c:if test="${map2.REVIEW_AVG == null}">
						<div class="form-control">--평점존재 X--</div>
		   </c:if>
		  <c:if test="${map2.REVIEW_AVG != null}">
            	<div class="form-control">${map2.REVIEW_AVG}</div>
            <br />
          </div>
		</c:if>
          <div class="card-body">
            <input
              type="button"
              class="btn"
              style="width: 110px; height: 40px;"
              value="수정 하러 가기"
              onclick="ch_info();"
            />
            <input
              type="button"
              class="btn"
              style="width: 80px; height: 40px;"
              value="취소"
              onclick="fn_openBoardList();"
            />
            <span id="pwc"></span>
            <br />
          </div>
        </div>
      </div>
    </div>

    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript">
      function ch_info() {
        document.location.href = "/second/myPage/accountModifyForm";
      }

      function fn_openMain() {
        document.location.href = "/second/shop/allGoodsList";
      }

      $(document).ready(function () {
        //Default Action
        $(".goodsTab_content").hide(); //Hide all content
        $("ul.goodsTabs li:first").addClass("active").show(); //Activate first goodsTab
        $(".goodsTab_content:first").show(); //Show first goodsTab content

        //On Click Event
        $("ul.goodsTabs li").click(function () {
          $("ul.goodsTabs li").removeClass("active"); //Remove any "active" class
          $(this).addClass("active"); //Add "active" class to selected goodsTab
          $(".goodsTab_content").hide(); //Hide all goodsTab content
          var activegoodsTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active goodsTab + content
          $(activegoodsTab).fadeIn(); //Fade in the active content
          return false;
        });
      });

      function back() {
        history.go(-1);
      }
    </script>
  </body>
</html>
