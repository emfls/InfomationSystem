<%@page import="login.LogonDBBean, management.*, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% String name=(String)session.getAttribute("name"); %>

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
                    <%=name %>님 반갑습니다.<br><a href="../loginpage/sessionLogout.jsp">(로그아웃)</a></p>
                <li><a href="../adminhome.jsp">HOME</a></li>

                <!-- href를 통하여 하위 항목 리스트 아이디를 불러올 수 있다. 
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">수업관리</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                    </ul>
                </li>
                -->
                <li><a href="../managementpage/lecturemanagement.jsp">강좌관리</a></li>
                <li><a href="../managementpage/professormanagement.jsp">교수관리</a></li>
                <li><a href="../managementpage/studentmanagement.jsp">학생관리</a></li>
                <li><a href="../managementpage/departmentmanagement.jsp">학과관리</a></li>
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
                    	int msgcnt=0;%>
                <button class="badge1 glyphicon glyphicon-envelope btn btn-style sidebar-btn navbar-right" data-badge=<%=msgcnt %>>
                </button>
                <span class="navbar-right"><%=name %></span>
            </div>

            <div class="contents">
                <div>
                    <h3 class="dashHeader">학생 관리</h3>
                </div>
                <div class="dashboard-style">
                <form method="post" action="studentmanagement.jsp">
                    <table class="search" width=100%>
                        <tr>
                            <td width=10%>
                                <span>학과</span>
                                <select id="class" name="class"></select>
                               		<%
	    								request.setCharacterEncoding("utf-8");
                               			ManageMentHandler handler=new ManageMentHandler();
            							String departmentList=handler.DepartmentListHandler();
										String comp=(String)request.getParameter("class");
         							%>
     							 <script>
        							//학과리스트
        							$(document).ready(function() {
            						var selectBox = document.getElementById('class');
         						   //var hidden=document.getElementById('lcode');
        						   // var row = hidden.insertRow(hidden.rows.length);
       							     var list='<%=departmentList%>';
									var classArr=list.split(',');
									var comp='<%=comp%>';

			
           							 for (var i = 0; i < classArr.length; i++) {
                						selectBox.options[i] = new Option(classArr[i], classArr[i]);
               						 	if(classArr[i]==comp)
            							{
            							selectBox.options[i].selected=true;
            							//var cell = row.insertCell(0);
            		 					//cell.innerHTML = "<input type=\"hidden\" value="+ classArr[i] + " name=\"lcode\">";
            							}
            						}                       
        						});
   
    						</script>
                            </td>
                            <td width=30%>
                                <button id="classSearch" class="btn-style">검색</button>
                            </td>
                        </tr>
                    </table>
                   </form>
                </div>
                <div class="dashboard-style">
                    
                        <div id="container" class="table-responsive top" style="border: 0px; overflow: auto">
                            <table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px;">
                                <thead class="thead-default">
                                    <tr>
                                    	<th width=60>학번</th>
                                        <th width=100>학과명</th>
                                        <th width=50>이름</th>
                                        <th width=120>생년월일</th>
                                        <th width=100>연락처</th>
                                        <th width=60>수정</th>
                                        <th width=60>삭제</th>
                                    </tr>

                                </thead>
                            </table>
                        </div>
                        <%                         
						String departmentName=request.getParameter("class");
                    	
						ArrayList<StudentListData> studentList=handler.StudentManagemenlisttHandler(departmentName); %>
                        <div id="container" class="table-responsive bottom" style="border: 0px; max-height: 500px; overflow: auto">
                           <%
    
    						for(int i=0;i<studentList.size();i++) {%>
    							<form method="post" name='studentform'>

                            		<table id="adminClass" class="table table-striped padding "  style="table-layout:fixed; margin: 0px" >
                           					<tbody>
    											<tr>
    											<td width=60><input type="text" name="pronum" id="non" value="<%=studentList.get(i).getStunum()%>"></td> 					
    											<td width=100><%=studentList.get(i).getDname() %></td>
    											<td width=50><%=studentList.get(i).getName() %></td>
    											<td width=120><%=studentList.get(i).getBirth() %></td>
    											<td width=100><%=studentList.get(i).getTel() %></td>
    											<td width=60><button class='btn-style' onclick="window.open('studentmodify.jsp?stunum=<%=studentList.get(i).getStunum()%>&dname=<%= studentList.get(i).getDname() %>', '_blanck','width=1200, height=400'); return false">수정</button></td>
    											<td width=60><button class='btn-style' onclick="window.open('studentdelete.jsp?stunum=<%=studentList.get(i).getStunum()%>', '_blanck','width=400, height=300'); return false">삭제</button></td>
    																			
    											</tr>
    										</tbody>
    									
                           			 </table>
                            	</form>	
    						<%} %>
                        </div>
                        <br>
                        <div align=right>
                            <button class="btn-style" id="save" onclick="window.open('studentadd.jsp', '_blanck','width=1200, height=400'); return false">학생등록</button>
                        </div>
                    

                </div>
            </div>
        </div>
    </div>



    <!-- jQuery 가져오기 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    

        
        
        <script>

        
      //검색 버튼
        $("#classSearch").click(function(){
            var selectBox = document.getElementById('class');
            var selectValue = selectBox.options[selectBox.selectedIndex].value;
            $("adminClass").empty();//테이블 리스트 비우기
            
            //검색 결과 리스트 생성
        });
        
        $(document).ready(function() {
            //동시에 스크롤 구현
            $(".top").scroll(function() {
                $(".bottom").scrollLeft($(".top").scrollLeft());
            });

            $(".bottom").scroll(function() {
                $(".top").scrollLeft($(".bottom").scrollLeft());
            });

        });
      
       
    </script>

    <!-- Bootstrap Js 가져오기 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js/homeScript.js"></script>
    
</body>

</html>
