<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/include/include-header.jspf" %>
    <meta charset="UTF-8" />

    <link href="
    <c:url value="/resources/css/btn.css" />
    " rel="stylesheet">
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />

    <style type="text/css">
         @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
      a{
         color: #000;
         text-decoration: none;
      }
      body {
      	    background:white;
      	    margin: 0;
      	    padding: 0;
      }
      body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{
         font-family:'맑은 고딕',Malgun Gothic,sans-serif;
         font-size:12px;
         color:#666;
         font-weight:400;}
      }
      .card {
              margin: 0 auto; /* Added */
              float: none; /* Added */
              margin-bottom: 10px; /* Added */
              border:1px solid #ccc;
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

         #log{
         		margin-top: -150px;
         }

         h1 {
          font-size: 20px;
          font-weight: bold;
      }
    </style>
  </head>
  <body
    onload="begin()"
    cellpadding="0"
    cellspacing="0"
    marginleft="0"
    margintop="0"
    align="center"
  >
    <div
      class="card align-middle"
      style="
        width: 30rem;
        height: 400px;
        margin-left: auto;
        margin-right: auto;
        border-radius: 20px;
        background-color: #fff;
        margin-top: 50px;
      "
      id="pass"
    >
      <div>
        <div class="card-title" style="margin-top: 100px;">
          <p style="font-weight: bold;font-size: 20px;padding-top: 20px;}">
            비밀번호 확인
          </p>
        </div>

        <div class="card-body" style="margin-top: 30px;">
          비밀번호
          <input
            type="password"
            style="margin-top: 20px;"
            id="MEM_PW"
            name="MEM_PW"
            class="form-control"
            placeholder="Password"
          />
        </div>

        <div class="card-body" style="margin-top: 30px; margin-botton: 0px;">
          <input
            type="button"
            class="btn"
            value="확인"
            onclick="fn_pwCheck();"
          />
          <input type="button" class="btn" value="취소" onclick="back();" />
          <span id="pwc"></span>
          <br />
        </div>
      </div>
    </div>
  </body>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      //id check
      $("#pwCheck").on("click", function (e) {
        e.preventDefault();
        fn_pwCheck();
      });
    });

    function fn_pwCheck() {
      //pw check
      var MEM_PW = { MEM_PW: $("#MEM_PW").val() };
      $.ajax({
        url: "<c:url value='/myPage/pwCheck'/>",
        type: "get",
        data: MEM_PW,
        success: function (data) {
          if ($.trim(data) == "1") {
            document.location.href = "/second/myPage/accountDetail";
          } else {
            $("#pwc").html("비밀번호가 틀렸습니다.").css("color", "red");
          }
        },
        error: function () {
          alert("에러입니다");
        },
      });
    }

    function back() {
      history.go(-1);
    }
  </script>
</html>
