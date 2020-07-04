<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
	
	#footer {
	margin-top:100px;
	border-top:7px solid #ffd34a; */
	position: relative;
	bottom: 0px;
	clear: both;
	zoom: 1;
	background: #000000; 
	min-width:1300px;
	} 
	 
	
	
	.utilMenu{
		font-family:"나눔 고딕";
		background:#000000;
	}

</style>



<!-- Footer 시작 -->
<div id="footer">
   <div class="foot_area" >
      <div class="ft_box">
      
      
         <div class="xans-layout-footer" id="footer4">
         
            <div class="utilMenu">
            
            
      <!-- 메뉴1 -->                  
               <div class="utilMenu_unit">
                  <h4>커뮤니티</h4>
                  <ul>
                     <li><a href="/second/community/noticeList"><span>공지사항</span></a></li>
                     <li><a href="/second/community/boardList"><span>자유게시판</span></a></li>
                     <li><a href="/second/community/qnaList"><span>QnA게시판</span></a></li>
                     <li><a href="/second/community/reportList"><span>신고게시판</span></a></li>

                  </ul>
               </div>
               
      <!-- 메뉴2 -->        
               <div class="utilMenu_unit">
                  <h4>쇼핑몰정보</h4>
                  <ul>
                     <li><a href="#">운영정책</a></li>
                     <li><a href="#">이용약관</a></li>
                     <li><a href="#">개인정보취급방침</a></li>
                  </ul>
               </div>
               
      <!-- 메뉴3 -->         
               <div class="utilMenu_unit">
                  <h4>고객센터</h4>
                  <ul>
                     <li class="phone">010-5780-3412</li>
                     <li><span>평일  오전09:00 ~ 오후06:00</span><br/>
                     	<span>점심시간  12:30~13:30</span><br/>
                     	<span>토,일,공휴일 휴무</span></li>
                  </ul>
               </div>
               
               
            </div>
         
      <!-- 로고 & 글 -->   
            <div class="qrcode">
               <p><img src="<c:url value="/resources/images/logo6_1.png"/>" style="width:230px;height: auto;"/></p>
               <div class="utilMenu_unit2">  
                  <p class="escrow_info">second샵은 통신판매중개자로서 중고거래마켓 second샵의 거래 당사자가 아니며,<br/>입점판매가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.<br/>
               </div>
            </div>
            
            
         </div>
         
         
      </div>
   </div>
</div>   