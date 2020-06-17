
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%response.sendRedirect("shop/allGoodsList");
	 %>
<%--   
<%response.sendRedirect("sample/openBoardList");
	 %>
<jsp:forward page="/sample/openBoardList"/>
 <%response.sendRedirect("second/community/noticeList");
	 %>

 <%response.sendRedirect("/community/noticeList");
	 %> // /first/community/noticeList
	 // http://localhost:8080/second/community/noticeList
	 
   <li><a href="/community/noticeList">공지사항 게시판</a></li>
   
--%>