<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, rollbook.*, login.LogonDBBean, grade.*" %>
<%String name=(String)session.getAttribute("name");
String id = (String) session.getAttribute("proNum");
	int proid = Integer.parseInt(id);
	int stupro = 1;
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
    <style>
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
                <li><a href="./professorgrade.jsp">성적처리</a></li>
                <li><a href="../rollbookpage/professorcheck.jsp">출결관리</a></li>
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
                    <h3 class="dashHeader">성적처리</h3>
                </div>
                <div class="dashboard-style">
                    <form method="post" action="professorgrade.jsp">
                    <span>과목선택</span>
                    <select id="class" name="class">
                        
                    </select>
                    <input type="submit" class="btn-style" value="선택">
                    </form>
                </div>
                <div class="dashboard-style">
                    <form id="gradeProc" method="post" action="savegrade.jsp">
                        <div id="container" class="table-responsive topH" style="border: 0px; overflow: auto">
                            <table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px">
                                <thead class="thead-default">
                                    <tr>
                                        <th>학과</th>
                                        <th>학번</th>
                                        <th>성명</th>
                                        <th>총점</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div id="container" class="table-responsive bottomH" style="border: 0px; max-height: 450px; overflow: auto">
                            <table id="grProc" class="table table-striped padding " style="table-layout:fixed">
                                <tbody>
                                </tbody>

                            </table>
                        </div>
                        <table id="lcode"><tbody></tbody></table>
                        <div align=right>
                            <button id="save" class="btn-style">저장</button>
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

        //저장버튼 누를시 해당 정보 디비로 전송
        $("#save").click(function() {
            $("#gradeProc").submit();
        });

        //셀렉트 박스 선택시 변경
        $("#class").change(function(){
            $("#grProc").empty();
            add_row();
            
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
    		ArrayList<String> professorCheckList=(new GradeHandler()).ProfessorGradeDataHandler(className);

    	for(int i=0;i<professorCheckList.size();i++ ) {
    %>
    
    <script>
    //테이블 생성 함수
    $(document).ready(function add_row(){
        var table = document.getElementById('grProc');
        var row = table.insertRow(table.rows.length);
        var list= '<%=professorCheckList.get(i)%>';
		var check = list.split(',');
        var i=1;
            for (var j = 0; j < 4; j++) {
               var cell = row.insertCell(j);

                        switch (j) {
                            case 0:
                                cell.innerHTML = check[j];
                                    //"소프트웨어학과";
                                //cell.width = "";
                                break;
                            case 1:
                                cell.innerHTML = "<input type=\"text\" value="+ check[j] + " name=\"s\" id=\"non\" readonly>";
                                //cell.width = "";
                                break;
                            case 2:
                                cell.innerHTML = check[j];
                                //cell.width = "";
                                break;
                            case 3:
                                cell.innerHTML = "<input type='number' name='score' value='"+check[j]+"' min='0' max='100'>";
                                break;
                        }
                    }
                    row = table.insertRow(table.rows.length);

            row = table.insertRow(table.rows.length);
        });
    </script>
    <% }
	}

    	%>
    
