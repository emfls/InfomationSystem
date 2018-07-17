<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="login.LogonDBBean"%>
<% String name=(String)session.getAttribute("name");
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
    <link rel="stylesheet" href="../css/homestyle.css">
    <!-- jQuery 가져오기 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Bootstrap Js 가져오기 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js/homeScript.js"></script>
    <SCRIPT language="javascript" SRC="../js/mail.js"></SCRIPT>
</head>

<body onload="add_row()">
    <div class="wrapper">
        <!-- 사이드바 -->
        <nav id="sidebar">
            <!-- 사이드바 상단(교통대 로고를 집어넣을 것)-->
            <div class="sidebar-header">
                <table>
                    <tr>
                        <td><img src="../knutLogo.png" width="90px" height="90px"></td>
                        <td>
                            <div style="padding-left: 25px; font-size: 1.8em;">학사관리</div>
                        </td>
                    </tr>
                </table>
            </div>

            <ul class="list-unstyled components">
                <p><%=name %> 님 반갑습니다.<br><a href="../loginpage/sessionLogout.jsp">(로그아웃)</a></p>
                <li><a href="../home.jsp">HOME</a></li>

                <!-- href를 통하여 하위 항목 리스트 아이디를 불러올 수 있다. 
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">수업관리</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                    </ul>
                </li>
                -->

                <li><a href="../applypage/apply.jsp">수강신청</a></li>
                <li><a href="../applypage/registview.jsp">수강확인</a></li>
                <li><a href="../schedule.jsp" onclick="window.open(this.href, '_blanck','width=900, height=1000'); return false">수업시간표</a></li>
                <li><a href="../gradepage/grade.jsp">성적확인</a></li>
                <li><a href="../profilepage/inquiry.jsp">학적조회</a></li>
                <li><a href="../rollbookpage/studentcheck.jsp"> 출결확인</a></li>
                <li><a href="../bus/busmain.jsp">통학버스</a></li>
            </ul>
        </nav>

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
                    <h3 class="dashHeader">수강확인</h3>
                </div>
                <div class="dashboard-style" style="max-height: 800px">
                    
                        <div id="container" class="table-responsive" style="border: 0px; overflow: auto">
                            <table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px">
                                <thead class="thead-default">
                                    <tr>
                                        <th width=50>취소</th>
                                        <th width=60>캠퍼스</th>
                                        <th width=50>구분</th>
                                        <th width=120>학과명</th>
                                        <th width=120>교과목명</th>
                                        <th width=50>학점</th>
                                        <th width=60>제한수</th>
                                        <th width=70>담당교수</th>
                                        <th width=80>강의시간</th>
                                        <th width=100>강의실</th>

                                    </tr>
                                </thead>
                            </table>
                        </div>
                <form id="applyForm" method="post" action="applycancel.jsp"> 
                        <div id="container" class="table-responsive" style="border: 0px; max-height: 800px; overflow: auto">
                          
                            <table id="applyConfirm" class="table table-striped padding " style="table-layout:fixed">
                                <tbody>
                                </tbody>
                            </table>
                            
                        </div>
                        <div align=right>
                           <jsp:include page="regitlist.jsp"></jsp:include>
                            <input type="submit" id="applyConfirmBtn" class="btn-style" value="일괄취소">      
                           
                        </div>
               </form>
                </div>
            </div>
        </div>
    </div>


    <style>
        .floating {
            position: fixed;
            bottom: 50px;
            right: 20px;
            text-align: center;
            width: 120px;
        }
        
        #submit {
            cursor: pointer;
        }

    </style>

</body>

</html>
    