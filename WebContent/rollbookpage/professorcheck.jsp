<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, rollbook.*, login.LogonDBBean" %>
<%String name=(String)session.getAttribute("name");
String id = (String) session.getAttribute("proNum");
	int proid = Integer.parseInt(id);
	int stupro = 1;%>
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
        <!-- jQuery 가져오기 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Bootstrap Js 가져오기 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js/homeScript.js"></script>
	<style>
	#chProc select {
   
    -webkit-appearance: none; /* 화살표 없애기 for chrome*/
   -moz-appearance: none;    /* 화살표 없애기 for firefox*/
   appearance: none;         /* 화살표 없애기 공통*/
}
#non{
            clear: none;
            border: 0px none;
            float: none;
            background-color: transparent;
        }
	</style>

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
                <p>
                    <%=name %>교수님 반갑습니다.<br><a href="../loginpage/sessionLogout.jsp">(로그아웃)</a></p>
                <li><a href="../professorhome.jsp">HOME</a></li>

                <!-- href를 통하여 하위 항목 리스트 아이디를 불러올 수 있다. 
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">수업관리</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                    </ul>
                </li>
                -->
                <li><a href="../gradepage/professorgrade.jsp">성적처리</a></li>
                <li><a href="professorcheck.jsp">출결관리</a></li>
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
                    	int msgcnt=logon.getMessageCount((String)session.getAttribute("proNum"));%>
                <button class="badge1 glyphicon glyphicon-envelope btn btn-style sidebar-btn navbar-right" data-badge=<%=msgcnt %> onClick="javascript:openmail(<%=proid %>,<%=stupro%>)">
                </button>
                <span class="navbar-right"><%=name %></span>
            </div>

            <div class="contents">
                <div>
                    <h3 class="dashHeader">출결관리</h3>
                </div>
                <div class="dashboard-style">
                    <!--옵션을 선택하면 바뀌도록-->
                    <form method="post" action="professorcheck.jsp">
                    <span>과목선택</span>
                    <select id="class" name="class">
                        
                    </select>
                    <input type="submit" class="btn-style" value="선택">
                    </form>
                </div>
                
                <div class="dashboard-style">
                    <form id="checkProc" method="post" action="savecheck.jsp">
                        <div id="container" class="table-responsive" style="border: 0px; overflow: auto">
                            <table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px;">
                                <thead class="thead-default">
                                    <tr>
                                        <th width=60>학과</th>
                                        <th width=50>학번</th>
                                        <th width=40>학생</th>
                                        <th width=30>1주</th>
                                        <th width=30>2주</th>
                                        <th width=30>3주</th>
                                        <th width=30>4주</th>
                                        <th width=30>5주</th>
                                        <th width=30>6주</th>
                                        <th width=30>7주</th>
                                        <th width=30>8주</th>
                                        <th width=30>9주</th>
                                        <th width=30>10주</th>
                                        <th width=30>11주</th>
                                        <th width=30>12주</th>
                                        <th width=30>13주</th>
                                        <th width=30>14주</th>
                                        <th width=30>15주</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div id="container" class="table-responsive" style="border: 0px; max-height: 500px; overflow: auto">
                            <table id="chProc" class="table table-striped padding " style="table-layout:fixed">

                                <tbody>
                                </tbody>

                            </table>
                        </div>
                        <table id="lcode"><tbody></tbody></table>
                        <div align=right>
                            <input type="submit" class="btn-style" value="저장">
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>



    <!-- jQuery 가져오기 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

		<%
	    request.setCharacterEncoding("utf-8");
            RollbookHandler handler=new RollbookHandler();
            String lectureList=handler.LectureListHandler((String)session.getAttribute("proNum"));
			String comp=(String)request.getParameter("class");
         %>
    <script>
        //출결관리
        $(document).ready(function() {
            var selectBox = document.getElementById('class');
            var hidden=document.getElementById('lcode');
            var row = hidden.insertRow(hidden.rows.length);
            var list='<%=lectureList%>';
			var classArr=list.split(',');
			var comp='<%=comp%>';

			
            for (var i = 0; i < classArr.length; i++) {
                selectBox.options[i] = new Option(classArr[i], classArr[i]);
                if(classArr[i]==comp)
            	{
            		selectBox.options[i].selected=true;
            		var cell = row.insertCell(0);
            		 cell.innerHTML = "<input type=\"hidden\" value="+ classArr[i] + " name=\"lcode\">";
            	}
            }                       
        });
   
    </script>

    <!-- Bootstrap Js 가져오기 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js/homeScript.js"></script>
</body>

</html>

    <%
 	   request.setCharacterEncoding("utf-8");
    
    	//RollbookHandler handler = new RollbookHandler();
        	String className=(String)request.getParameter("class");
		if(className!=null){
    		ArrayList<String> professorCheckList=handler.ProfessorCheckDataHandler((String)session.getAttribute("proNum"), className);

    	for(int i=0;i<professorCheckList.size();i++ ) {
    %>
    
    <script>
    //테이블 생성 함수
    $(document).ready(function add_row(){
        var table = document.getElementById('chProc');
        var row = table.insertRow(table.rows.length);
        var list= '<%=professorCheckList.get(i)%>';
		var check = list.split(',');
        var i=1;
            for (var j = 0; j < 18; j++) {
                var cell = row.insertCell(j);

                if (j == 0) {
                    //해당 학과을 입력한다.
                    cell.innerHTML = check[j];
                    cell.width = "60"
                } else if (j == 1) {
                    //해당 학번을 입력한다.
                    cell.innerHTML = "<input type=\"text\" value="+ check[j] + " name=\"s\" id=\"non\" readonly>";
                    cell.width = "50"
                } else if (j == 2) {
                    //해당 학생을 입력한다.
                    cell.innerHTML = check[j];
                    cell.width = "40"
                } else {
                	if(check[j]=="미출결"){
                        cell.innerHTML="<select name=s"+ i++ +"><option selected>미출결</option><option>지각</option><option>결석</option><option>출석</option></select>";
                    }else if(check[j]=="지각"){
                        cell.innerHTML="<select name=s"+ i++ +"><option >미출결</option><option selected>지각</option><option>결석</option><option>출석</option></select>";
                    }else if(check[j]=="결석"){
                        cell.innerHTML="<select name=s"+ i++ +"><option >미출결</option><option >지각</option><option selected>결석</option><option>출석</option></select>";
                    }else if(check[j]=="출석"){
                        cell.innerHTML="<select name=s"+ i++ +"><option >미출결</option><option>지각</option><option>결석</option><option selected>출석</option></select>";
                    }
                    cell.width = "30"
                }

            }
            row = table.insertRow(table.rows.length);
        });
    </script>
    <% }
	}

    	%>
    
