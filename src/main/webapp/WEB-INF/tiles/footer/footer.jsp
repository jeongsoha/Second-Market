<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!-- Footer 시작 -->
<div id="footer">
	<div class="foot_area">
		<div class="ft_box">
			<div class="xans-layout-footer">
				<div class="utilMenu">            
					<div class="utilMenu_unit">
						<h4>커뮤니티</h4>
						<ul>
							<li><a href="/nnS/community/noticeList"><span>공지사항</span></a></li>
							<li><a href="/nnS/community/boardList"><span>자유게시판</span></a></li>
							<li><a href="/nnS/community/qnaList"><span>QnA게시판</span></a></li>
							<li><a href="/nnS/community/reportList"><span>신고게시판</span></a></li>

						</ul>
					</div>
					<div class="utilMenu_unit">
						<h4>쇼핑몰정보</h4>
						<ul>
							<li><a href="#">운영정책</a></li>
							<li><a href="#">이용약관</a></li>
							<li><a href="#">개인정보취급방침</a></li>
						</ul>
					</div>
					
					
					<div class="utilMenu_unit">
						<h4>고객센터</h4>
						<ul>
							<li class="phone">012-3456-7890</li>
							<li><span><strong>평일: 오전09:00~오후06:00</strong></span><br/><span><strong>점심시간: 12:00~13:00</strong></span><br/><span><strong>토,일,공휴일 휴무</strong></span></li>
						</ul>
					</div>
				</div>
			
				<div class="qrcode">
					<p><img src="<c:url value="/resources/images/second.png"/>" style="width:200px;height: auto;"/></p>
					<div class="utilMenu_unit2">
						<p class="escrow_info">나눠써샵은 통신판매중개자로서 중고거래마켓 나눠써샵의 거래 당사자가 아니며,<br/>입점판매가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.<br/>
					</div>
				</div>
			</div>
		</div>
	</div>
</div><!--// 라인업 끝 -->    