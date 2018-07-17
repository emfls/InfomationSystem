<%@ page import="login.LogonDBBean"%>
<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String name=(String)session.getAttribute("name"); 
	session.setAttribute("searchSql", null);%>
<%
String id = (String) session.getAttribute("stuNum");
int stuid = Integer.parseInt(id);
int stupro = 0;
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>학사관리 시스템</title>

    <!-- Bootstrap CSS를 불러옴 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/homestyle.css">
    <SCRIPT language="javascript" SRC="./js/mail.js"></SCRIPT>
</head>

<body>
    <div class="wrapper">
        <!-- 사이드바 -->
        <nav id="sidebar">
            <!-- 사이드바 상단(교통대 로고를 집어넣을 것)-->
            <div class="sidebar-header">
                <table>
                    <tr>
                        <td><img src="knutLogo.png" width="90px" height="90px"></td>
                        <td>
                            <div style="padding-left: 25px; font-size: 1.8em;">학사관리</div>
                        </td>
                    </tr>
                </table>
            </div>

            <ul class="list-unstyled components">
                <p><%=name %> 님 반갑습니다.<br><a href="loginpage/sessionLogout.jsp">(로그아웃)</a></p>
                <li><a href="home.jsp">HOME</a></li>

                <!-- href를 통하여 하위 항목 리스트 아이디를 불러올 수 있다. 
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">수업관리</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                    </ul>
                </li>
                -->

                <li><a href="./applypage/apply.jsp">수강신청</a></li>
                <li><a href="./applypage/registview.jsp">수강확인</a></li>
                <li><a href="schedule.jsp" onclick="window.open(this.href, '_blanck','width=900, height=1000'); return false">수업시간표</a></li>
                <li><a href="./gradepage/grade.jsp">성적확인</a></li>
                <li><a href="./profilepage/inquiry.jsp">학적조회</a></li>
                <li><a href="./rollbookpage/studentcheck.jsp">출결확인</a></li>
               <li><a href="./bus/busmain.jsp">통학버스</a></li>
            </ul>
        </nav>

       <style> 
       #topMenu 
       {
       height: 120px; 
       width:1700px;
       } 
       
       #topMenu ul li 
       {
       list-style: none; 
       color: white;
       background-color: #2d2d2d; 
       float: left;  
       line-height: 60px; 
       vertical-align: middle; 
       text-align: center;
       }
       
       #topMenu .menuLink 
       {
       text-decoration:none; 
       color: white;
       display: block; 
       width: 250px;
       height: 60px;
       font-size: 30px;
       font-weight: bold; 
       font-family: "Trebuchet MS", Dotum, Arial; 
       } 
       
       #topMenu .menuLink:hover {
       color: red; 
       background-color: #4d4d4d;
       } 
       </style>


        <!-- 오른쪽에 보여질 페이지 -->
        <div id="content">
            <div class="topBar">
                <button type="button" id="sidebarCollapse" class="btn btn-style sidebar-btn">
                        <i class="glyphicon glyphicon-align-left"></i>
                    </button>
                    <%	LogonDBBean logon = LogonDBBean.getInstance();
                    	int msgcnt=logon.getMessageCount((String)session.getAttribute("stuNum"));%>
                <button class="badge1 glyphicon glyphicon-envelope btn btn-style sidebar-btn navbar-right" data-badge=<%=msgcnt %> onClick="javascript:openmail(<%=stuid %>,<%=stupro%>)">
                </button>
                <span class="navbar-right"><%=name %></span>
            </div>
            <div class="contents">
                <div>
                    <h3 class="dashHeader">HOME</h3>
                </div>
                <div class="dashboard-style">
					            <img src="./images/notice.jpg" usemap="#notice">
            <map name="notice">
              <area shape="rect" coords="14,22,258,356" target="_blank" href="http://www.ut.ac.kr/cop/bbs/BBSMSTR_000000000055/selectBoardArticle.do?nttId=1012220" />
              <area shape="rect" coords="270,21,514,355" target="_blank" href="http://www.ut.ac.kr/cop/bbs/BBSMSTR_000000000071/selectBoardArticle.do?nttId=1012206" />
              <area shape="rect" coords="525,22,770,355" target="_blank" href="http://www.ut.ac.kr/cop/bbs/BBSMSTR_000000000061/selectBoardArticle.do?nttId=1012187" />
              <area shape="rect" coords="781,21,1027,357" target="_blank" href="http://www.ut.ac.kr/cop/bbs/BBSMSTR_000000000631/selectBoardArticle.do?nttId=1012199" />
              <area shape="rect" coords="1037,22,1283,355" target="_blank" href="http://www.ut.ac.kr/cop/bbs/BBSMSTR_000000000631/selectBoardArticle.do?nttId=1012198" />
              <area shape="rect" coords="14,366,259,700" target="_blank" href="http://www.ut.ac.kr/cop/bbs/BBSMSTR_000000000061/selectBoardArticle.do?nttId=1012165" />
              <area shape="rect" coords="269,367,515,701" target="_blank" href="http://www.ut.ac.kr/cop/bbs/BBSMSTR_000000000631/selectBoardArticle.do?nttId=1012171" />
              <area shape="rect" coords="527,367,772,700" target="_blank" href="http://www.ut.ac.kr/cop/bbs/BBSMSTR_000000000061/selectBoardArticle.do?nttId=1012175" />
              <area shape="rect" coords="783,366,1027,700" target="_blank" href="http://www.ut.ac.kr/cop/bbs/BBSMSTR_000000000060/selectBoardArticle.do?nttId=1012160" />
              <area shape="rect" coords="1037,367,1283,700" target="_blank" href="http://www.ut.ac.kr/cop/bbs/BBSMSTR_000000000060/selectBoardArticle.do?nttId=1012151" />
              <area shape="rect" coords="1293,23,1537,356" target="_blank" href="http://www.ut.ac.kr/cop/bbs/BBSMSTR_000000000055/selectBoardArticle.do?nttId=1012096" />
              <area shape="rect" coords="1293,367,1537,700" target="_blank" href="http://www.ut.ac.kr/cop/bbs/BBSMSTR_000000000055/selectBoardArticle.do?nttId=1011767" />
            </map>
                
					
			    </div>

    <!-- jQuery 가져오기 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <!-- Bootstrap Js 가져오기 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/homeScript.js"></script>
</body>

</html>
