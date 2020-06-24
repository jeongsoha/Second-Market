<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/include/include-header.jspf" %>
    <meta charset="UTF-8" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
    />
    <script type="text/javascript">
      $(document).ready(function () {
        //탈퇴 버튼 클릭시
        $("#delete").on("click", function (e) {
          e.preventDefault();
          fn_delete();
        });
      });

      function fn_delete(deleteAccountForm) {
        //변경 버튼 클릭시(유효성검증, 데이터입력)
        var MEM_PW = { MEM_PW: $("#MEM_PW").val() };
        $.ajax({
          url: "<c:url value='/myPage/deletePw'/>",
          type: "get",
          data: MEM_PW,
          success: function (data) {
              if ($.trim(data) == "1") {
                  if(confirm("정말 탈퇴하시겠습니까?") == true){
			  	  	alert("탈퇴완료.");
				    var comSubmit = new ComSubmit("deleteAccountForm");
  		            comSubmit.setUrl("<c:url value='/myPage/deleteAccountCheck'/>");
		            comSubmit.submit();
                  } else{
                      return;
            	      //location.href="/second/shop/allGoodsList";
                  }              
                } else {
                  alert("비밀번호가 틀렸습니다.");
              }
            },
          error: function () {
            alert("에러입니다");
          },
        });
      }

      $("#deleteAccountForm").on("submit", function (e) {});
    </script>
  </head>

  <style type="text/css">
    @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

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
.btn {	
	width:100px;
    background-color: #fff;
    border-size: 3px;
    border-color:#80EB1C;
    color:#000;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius:10px;
}
.btn:hover {
  /*   background-color: #74C043; */
  	background-color: #80EB1C;
    color:#fff;
}
  </style>

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
    <div>
      <div id="content">
        <!--          <div id="vertical_tab-container">
	         <ul>
	         <li><a href="accountDetail"><img src="./../resources/images/mypage_tab1.png" width="100" height="30"></a></li>
	         <li><a href="pwModifyForm"><img src="./../resources/images/mypage_tab2.png" width="100" height="30"></a></li>
	         <li class="selected"><a href="deleteAccount"><img src="./../resources/images/mypage_tab3.png" width="100" height="30"></a></li>
	         <li><a href="reportList"><img src="./../resources/images/mypage_tab4.png" width="100" height="30"></a></li>
	         <li><a href="qnaList"><img src="./../resources/images/mypage_tab5.png" width="100" height="30"></a></li>
	      </ul>
	   </div> -->

        <div class="tab_wrap">
          <div class="tab_menu_container">
            <a href="accountDetail"
              ><button class="tab_menu_btn" type="button">회원정보</button></a
            >
            <a href="pwModifyForm"
              ><button class="tab_menu_btn" type="button">
                비밀번호 변경
              </button></a
            >
            <a href="deleteAccount"
              ><button class="tab_menu_btn on" type="button">
                회원탈퇴
              </button></a
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





        <div id="main-container">
        
          <div class="card-title" style="margin-top: 30px;">
            <h2
              class="card-title text-center"
              style="color: #113366; padding: 0px 0px 0px 100px;"
            >
              회 원 탈 퇴
            </h2>
            <br />
          </div>
          <form id="deleteAccountForm" method="post">
            <div
              class="card-body"
              style="width: 1000px; padding: 0px 0px 0px 200px;"
            >
              <p>
                한 번 탈퇴하시면 회원님의 정보를 복구할 수 없습니다.<br />신중히
                선택해 주시길 바랍니다.<br />
              </p>
              비밀번호<input
                class="form-control"
                type="password"
                id="MEM_PW"
                name="MEM_PW"
              /><br />
            </div>

            <div
              class="card-body"
              style="width: 1000px; padding: 0px 0px 0px 200px;"
            >
              <input
                type="button"
                class="btn"
                style="width: 110px; height: 40px;"
                value="탈퇴하기"
                id="delete"
              />
              <input
                type="button"
                class="btn"
                style="width: 110px; height: 40px;"
                value="취소하기"
                onclick="document.location.href='/second/shop/allGoodsList'"
              />
              <br />
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
