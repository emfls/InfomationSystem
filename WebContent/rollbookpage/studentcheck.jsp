<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="rollbook.*, java.util.ArrayList, login.LogonDBBean" %>
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
        <!-- 사이드바 끝 -->

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
                    <h3 class="dashHeader">출결확인</h3>
                </div>
                <div class="dashboard-style" style="max-height: 1500px">
                    <!-- 출결확인 -->
                    <form id="checkForm">
                        <div id="container" class="table-responsive" style="border: 0px; overflow: auto">
                            <table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px;" >
                            <thead class="thead-default" >
                                    <tr>
                                        <th width=60>과목</th>
                                        <th width=10>1주</th>
                                        <th width=10>2주</th>
                                        <th width=10>3주</th>
                                        <th width=10>4주</th>
                                        <th width=10>5주</th>
                                        <th width=10>6주</th>
                                        <th width=10>7주</th>
                                        <th width=10>8주</th>
                                        <th width=10>9주</th>
                                        <th width=10>10주</th>
                                        <th width=10>11주</th>
                                        <th width=10>12주</th>
                                        <th width=10>13주</th>
                                        <th width=10>14주</th>
                                        <th width=10>15주</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div id="container" class="table-responsive" style="border: 0px; max-height: 1500px; overflow: auto">
                            <table id="check" class="table table-striped padding " style="table-layout:fixed">
                                
                                <tbody>
                                </tbody>

                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <%
    RollbookHandler handler = new RollbookHandler();
    ArrayList<RollbookData> data=handler.RollbookListHandler((String)session.getAttribute("stuNum"));
    for(int i=0;i<data.size();i++) {
    %>

    <script>
        
	//출결확인!
        $(document).ready(function add_row() {
            var table = document.getElementById('check');
            var row = table.insertRow(table.rows.length);
            var check =['<%=data.get(i).getS1()%>','<%=data.get(i).getS2()%>','<%=data.get(i).getS3()%>','<%=data.get(i).getS4()%>','<%=data.get(i).getS5()%>','<%=data.get(i).getS6()%>','<%=data.get(i).getS7()%>','<%=data.get(i).getS8()%>','<%=data.get(i).getS9()%>','<%=data.get(i).getS10()%>','<%=data.get(i).getS11()%>','<%=data.get(i).getS12()%>','<%=data.get(i).getS13()%>','<%=data.get(i).getS14()%>','<%=data.get(i).getS15()%>'];//해당 과목의 해당 학생 1~15주차 출결을 가져옴
            
           
                for (var j = 0; j < 16; j++) {
                    var cell = row.insertCell(j);
                    if(j==0){
                       //해당 과목을 입력한다.
                        cell.innerHTML= "<%= data.get(i).getCname() %>";
                        cell.width=60
                    }
                    else{
                        cell.innerHTML=check[j-1];
                        //출결을 어떻게 표현할 것인지 정해야함
                        cell.width=10
                    }
                   
                }
                row = table.insertRow(table.rows.length);
            
        });
    </script>
    
    <%}%>
    <style>
        #check td{
            border: 1px solid #999999;
        }
    </style>
</body>

</html>
