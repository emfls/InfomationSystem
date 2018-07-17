<%@page import="login.LogonDBBean"%>
<%@page import="inquiry.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

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
    <SCRIPT language="javascript" SRC="../js/mail.js"></SCRIPT>
</head>

<body>
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

        <style>

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
                    <h3 class="dashHeader">학적조회</h3>
                 
                </div>
<div class="dashboard-style">
                    <%
                    String stunum=(String)session.getAttribute("stuNum");
                    InquiryDBBean inquiry=InquiryDBBean.getInstance();
                    StudentData studata=inquiry.getStudentData(stunum); 
                    ServletContext context=getServletContext();
                    String realPath=context.getRealPath("/stuimg");
                    
                    %>
                    <form action="inquirypro.jsp" method="post">
                    <div id="container" class="table-responsive" style="border: 0px; overflow: auto">
                            
                            <table class="padding " style="table-layout:fixed; margin-bottom: 0px; width: 100%">
                    <tr>
                    <td width=30%>
                    <img width=90% src="../knutLogo.png"> 
                   </td>
                   <td width=70%>
	                   <table class="table">
	                    	<tr>
		                    	<td>이름 </td><td>:</td>
		                    	<td><%=studata.getName() %></td>
	                    	</tr>
	               	  		<tr>
	               	  			<td>학번 </td><td>:</td> 
	               	  			<td><%=studata.getStunum() %></td>
	               	  		</tr>
	               	  		<tr>
	               	  			<td>주소 </td><td>:</td>  
	               	  			<td><input type="text" name="address" size="40" value="<%=studata.getAddress() %>"></td>
	               	  		</tr>
	               	  		<tr>
	               	  			<td>생일 </td><td>:</td> 
	               	  			<td><%=studata.getBirth() %></td>
	               	  		</tr>
	               	  		<tr>
	               	  			<td>지도교수 </td><td>:</td> 
	               	  			<td><%=studata.getProfessor() %></td>
	               	  		</tr>
	               	  		<tr>
	               	  			<td>학년 </td><td>:</td>  
	               	  			<td><%=studata.getYear() %></td>
	               	  		</tr>
	               	  		<tr>
	               	  			<td>전화번호 </td><td>:</td> 
	               	  			<td><input type="text" name="tel" value="<%=studata.getTel() %>"></td>
	               	  		</tr>
	               	  		<tr>
	               	  			<td>학적상태 </td><td>:</td> 
	               	  			<td><%=studata.getStaus() %></td>
	               	  		</tr>
	               	  		<tr>
	               	  			<td>이메일 </td><td>:</td> 
	               	  			<td><input type="text" name="email" value="<%=studata.getEmail() %>"></td>
	              	  		</tr>
	               	  		<tr>
		               	  		<td>학과 </td><td>:</td> 
		               	  		<td><%=studata.getDepart() %></td>
	               	  		</tr>
	               	  	</table>
               	  	</td>
               	  	</tr>
               	  	</table>
               	  	</div>
               	  	<div align=right>
                            <input type="submit" id="" class="btn-style" value="수정">
                        </div>
                        </form>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery 가져오기 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <!-- Bootstrap Js 가져오기 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/homeScript.js"></script>
</body>

</html>
