<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
   <%
    String name = "hong";
    String email = "hongemail@naver.com";
    String phone = "010-3333-4444";
    String address = "주소입니다 중구";
    int totalPrice = 13000;    
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
   <h2 style="clear:both;" align="center">게시판 목록</h2> <br>
   <table class="board_list">
      <colgroup>
         <col width="10%" />
         <col width="*" />
         <col width="15%" />
         <col width="20%" />
      </colgroup>
      <thead>
         <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">조회수</th>
            <th scope="col">작성일</th>
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${fn:length(list) > 0}">
               <c:forEach items="${list }" var="row">
                  <tr>
                     <td>${row.IDX }</td>
                     <td class="title"><a href="#this" name="title">${row.TITLE }</a>
                        <input type="hidden" id="IDX" value="${row.IDX }"></td>
                     <td>${row.HIT_CNT }</td>
                     <td>${row.CREA_DTM }</td>
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="4">조회된 결과가 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
      </tbody>
   </table>
   <div id="PAGE_NAVI"></div>
   <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />

   <br />
   <a href="#this" class="btn" id="write">글쓰기</a>

   <%@ include file="/WEB-INF/include/include-body.jspf"%>
   <script type="text/javascript">
      $(document).ready(function() {
         fn_selectBoardList(1);
         $("#write").on("click", function(e) { //글쓰기 버튼
            e.preventDefault();
            fn_openBoardWrite();
         });

         $("a[name='title']").on("click", function(e) { //제목 
            e.preventDefault();
            fn_openBoardDetail($(this));
         });
      });

      function fn_openBoardWrite() {
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/sample/openBoardWrite' />");
         comSubmit.submit();
      }
   
      function fn_openBoardDetail(obj) {
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/sample/openBoardDetail' />");
         comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
         comSubmit.submit();
      }
      function fn_selectBoardList(pageNo) {
         var comAjax = new ComAjax();
         comAjax.setUrl("<c:url value='/sample/selectBoardList' />");
         comAjax.setCallback("fn_selectBoardListCallback");
         comAjax.addParam("PAGE_INDEX", pageNo);
         comAjax.addParam("PAGE_ROW", 15);
         comAjax.ajax();
      }

      function fn_selectBoardListCallback(data) {
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
               eventName : "fn_selectBoardList"
               
            };
            gfn_renderPaging(params);

            var str = "";
            $.each(
                        data.list,
                        function(key, value) {
                           str += "<tr>"
                                 + "<td>"
                                 + value.IDX
                                 + "</td>"
                                 + "<td class='title'>"
                                 + "<a href='#this' name='title'>"
                                 + value.TITLE
                                 + "</a>"
                                 + "<input type='hidden' id='IDX' value=" + value.IDX + ">"
                                 + "</td>" + "<td>" + value.HIT_CNT
                                 + "</td>" + "<td>" + value.CREA_DTM
                                 + "</td>" + "</tr>";
                        });
            body.append(str);

            $("a[name='title']").on("click", function(e) { //제목
               e.preventDefault();
               fn_openBoardDetail($(this));
            });
         }
      }

    
          $(function(){
              var IMP = window.IMP; // 생략가능
              IMP.init('imp61223177'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
              var msg;
              
              IMP.request_pay({
                  pg : 'kakaopay',
                  pay_method : 'card',
                  merchant_uid : 'merchant_' + new Date().getTime(),
                  name : 'KH Books 도서 결제',
                  amount : <%=totalPrice%>,
                  buyer_email : '<%=email%>',
                  buyer_name : '<%=name%>',
                  buyer_tel : '<%=phone%>',
                  buyer_addr : '<%=address%>',
                  buyer_postcode : '123-456',
                  //m_redirect_url : 'http://www.naver.com'
              }, function(rsp) {
                  if ( rsp.success ) {
                      //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                      jQuery.ajax({
                          url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                          type: 'POST',
                          dataType: 'json',
                          data: {
                              imp_uid : rsp.imp_uid
                              //기타 필요한 데이터가 있으면 추가 전달
                          }
                      }).done(function(data) {
                          //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                          if ( everythings_fine ) {
                              msg = '결제가 완료되었습니다.';
                              msg += '\n고유ID : ' + rsp.imp_uid;
                              msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                              msg += '\결제 금액 : ' + rsp.paid_amount;
                              msg += '카드 승인번호 : ' + rsp.apply_num;
                              
                              alert(msg);
                          } else {
                              //[3] 아직 제대로 결제가 되지 않았습니다.
                              //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                          }
                      });
                      //성공시 이동할 페이지
                      location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
                  } else {
                      msg = '결제에 실패하였습니다.';
                      msg += '에러내용 : ' + rsp.error_msg;
                      //실패시 이동할 페이지
                      location.href="<%=request.getContextPath()%>/order/payFail";
                      alert(msg);
                  }
              });
              
          });
          </script>

</body>
</html>