<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, login.LogonDBBean, grade.*" %>
<!-- 로그인 페이지 미완성으로 미리 세션에 값을 입력했음. -->

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
<!--     메인페이지에 적용될 css -->
    <link rel="stylesheet" href="../css/homestyle.css">
    <!-- jQuery 가져오기 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Bootstrap Js 가져오기 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--     사이드바 작동을 위한 스크립 -->
    <script src="../js/homeScript.js"></script>
    <SCRIPT language="javascript" SRC="../js/mail.js"></SCRIPT>
</head>

<body>
    <div class="wrapper">
        <!-- 사이드바 -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <table>
                    <tr>
<!--                     사이드바 상단 -->
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
            
<!--             사이드바 보이기 감추기 토글 버튼 -->
                <button type="button" id="sidebarCollapse" class="btn btn-style sidebar-btn">
                        <i class="glyphicon glyphicon-align-left"></i>
                    </button>
                    <%	
                    	//읽지않은 메세지 갯수 구현을 위함
                    	LogonDBBean logon = LogonDBBean.getInstance();
                    	int msgcnt=logon.getMessageCount((String)session.getAttribute("stuNum"));%>
                    	
<!--                     	메세지 알림 구현 -->
                <button class="badge1 glyphicon glyphicon-envelope btn btn-style sidebar-btn navbar-right" data-badge=<%=msgcnt %> onClick="javascript:openmail(<%=stuid %>,<%=stupro%>)">
                </button>
                <span class="navbar-right"><%=name %></span>
            </div>
            
            <div class="contents">
            
                <div>
                    <h3 class="dashHeader">성적확인</h3>
                </div>
                
                <div class="dashboard-style" style="max-height: 800px">
                
<!--                 	헤더를 위한 div 그리고 table -->
                    <div id="container" class="table-responsive" style="border: 0px; overflow: auto">
                        <table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px">

                        </table>
                    </div>
                    
<!--                     반복을 통한 테이블 생성을 위한 div와 table -->
                    <div id="container" class="table-responsive" style="border: 0px; max-height: 300px; overflow: auto">
                        <table id="confirm" class="table table-striped padding " style="table-layout:fixed; scroll-behavior: smooth">
                            <thead class="thead-default">
                                <tr>
                                    <th width=15% style="min-width: 80">이수구분</th>
                                    <th width=20% style="min-width: 100">과목명</th>
                                    <th width=15% style="min-width: 40">교수</th>
                                    <th width=10% style="min-width: 40">학점</th>
                                    <th width=20% style="min-width: 80">등급</th>
                                    <th width=10% style="min-width: 80">평점</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <div align=right>총 평점: <span id="allGrade"></span></div>
                    </div>
                    
                </div>
                
            </div>
            
        </div>
    </div>
    <!--<div class="floating"><img src="submit.png" width="50" id="submit"></div>-->

	<%
	//학점을 문자로 변경하기 위한 객체 생성 
		GradeHandler handler= new GradeHandler();
		ArrayList<GradeData> data = handler.gradeListHandler((String)session.getAttribute("stuNum"));
		
		float numerator=0;
		float denumerator=0;
		for(int i=0;i<data.size();i++) {
	%>

    <script>
        //수강 내역 테이블 생성
        $(document).ready(function() {
            var table = document.getElementById('confirm');
            var row = table.insertRow(table.rows.length);

                for (var j = 0; j < 6; j++) {
                    var cell = row.insertCell(j);
                    
                    switch (j) {
                        case 0:
                            cell.innerHTML = "<%=data.get(i).getMajor()%>";//이수구분
                            break;
                        case 1:
                            cell.innerHTML = "<%=data.get(i).getCname()%>";//과목명
                            break;
                        case 2:
                            cell.innerHTML = "<%=data.get(i).getPname()%>";//교수
                            break;
                        case 3:
                            cell.innerHTML = "<%=data.get(i).getGrade()%>";//학점
                            break;
                        case 4:
                            cell.innerHTML = "<%=handler.gradenumToGrade(data.get(i).getGradenum())%>";//등급
                            break;
                        case 5:
                            cell.innerHTML = "<%=data.get(i).getGradenum()%>";//평점
                            break;
                    }
                    
                }
                row = table.insertRow(table.rows.length);
        });

    </script>
    
	<%
	//총평점 구현
		numerator+=(data.get(i).getGradenum()*data.get(i).getGrade());
		denumerator+=data.get(i).getGrade();
		}
	%>
	
	<script>
		document.getElementById("allGrade").innerHTML="<%=Math.round((numerator/denumerator)*100) / 100.00 %>";
	</script>
	            
</body>
</html>