<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>second 관리자페이지</title>

    <!-- Bootstrap Core CSS -->
    <link href="/second/resources/admin/bootstrapadmin.min.css" rel="stylesheet">
   <style type="text/css">
      @media(min-width:768px) {
          #page-wrapper {
        margin: 0 0 0 150px !important;
       
  
    }
}
   </style>

    <!-- Custom CSS -->
    <link href="/second/resources/admin/sb-admin-2.css" rel="stylesheet">
   <!-- jQuery -->
   
    <script src="/second/resources/admin/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/second/resources/admin/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->      
    <script src="/second/resources/admin/sb-admin-2.js"></script>   
</head>
   
<body>

    <div id="wrapper">
  
        <!-- Navigation -->  
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0;background-color:#337AB7">
            <div class="navbar-header" style="background-color:#337AB7">  
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>  
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>  
                </button>
                <a class="navbar-brand"style="color:#ffffff;" href="/second/admin"><strong>second# 관리자페이지 </strong></a>
            </div>
            <!-- /.navbar-header -->


  
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">  
                    <ul class="nav" id="side-menu">
                        
                        <li>
                            <a href="/second/admin" style="background: #e7e7e7;border-bottom: 1px solid #F8F8F8;"><i class="fa fa-dashboard fa-fw"></i>관리자홈  </a>
                        </li>
                  <li>
                            <a href="/second/shop/allGoodsList" style="background: #e7e7e7;border-bottom: 1px solid #F8F8F8;"><i class="fa fa-dashboard fa-fw"></i>쇼핑몰로 이동  </a>
                        </li>
                        <li class="active">  
                            <a href="#"style="background: #e7e7e7;"><i class="fa fa-dashboard fa-fw"></i>회원관리<span class="fa arrow">▼</span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/second/admin/memberList">- 회원목록 </a>
                                </li>
                                <li>
                                    <a href="/second/admin/reportProList">- 신고처리</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>   
                        <li class="active">
                            <a href="#"style="background: #e7e7e7;"><i class="fa fa-bar-chart-o fa-fw"></i>상품관리<span class="fa arrow">▼</span></a>
                      <ul class="nav nav-second-level">
                                <li>
                                    <a href="/second/admin/goodsList">- 상품목록 </a>
                                </li>
                            </ul>
                        </li>                     
                        <li class="active">
                            <a href="#"style="background: #e7e7e7;"><i class="fa fa-bar-chart-o fa-fw"></i>게시판관리<span class="fa arrow">▼</span></a>
                      <ul class="nav nav-second-level">
                                <li>
                                    <a href="/second/admin/noticeList">- 공지사항</a>
                                </li>
                                <li>
                                    <a href="/second/admin/boardList">- 자유게시판</a>
                                </li>
                                <li>
                                    <a href="/second/admin/qnaList">- Q&A</a>
                                </li>
                            </ul>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
             
            <!-- 메인container-->
               <tiles:insertAttribute name="body"/>
            <!-- // container -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    

</body>

</html>