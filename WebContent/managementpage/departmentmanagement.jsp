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
                    <h3 class="dashHeader">학과 관리</h3>
                </div>
                <div class="dashboard-style">
      
                <div class="dashboard-style">
                    
                        <div id="container" class="table-responsive top" style="border: 0px; overflow: auto">
                            <table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px;">
                                <thead class="thead-default">
                                    <tr>
                                    	<th width=50>학과코드</th>
                                        <th width=100>학과명</th>
                                        <th width=60>수정</th>
                                        <th width=60>삭제</th>
                                    </tr>

                                </thead>
                            </table>
                        </div>
                        <%                         
						ManageMentHandler handler=new ManageMentHandler();
						ArrayList<DepartmentData> dlist=handler.DepartmentDataListHandler(); %>
                        <div id="container" class="table-responsive bottom" style="border: 0px; max-height: 500px; overflow: auto">
                           <%
    
    						for(int i=0;i<dlist.size();i++) {%>
    						
    							<form method="post" name='professorform'>
    							
                            		<table id="adminClass" class="table table-striped padding "  style="table-layout:fixed; margin: 0px" >
                           					<tbody>
    											<tr>  											
    											<td width=50><%=dlist.get(i).getDcode() %></td>
    											<td width=100><%=dlist.get(i).getDname() %></td>
    											<td width=60><button class='btn-style' onclick="window.open('departmentmodify.jsp?dcode=<%=dlist.get(i).getDcode() %>&dname=<%=dlist.get(i).getDname() %>', '_blanck','width=500, height=320'); return false">수정</button></td>
    											<td width=60><button class='btn-style' onclick="window.open('departmentdelete.jsp?dcode=<%=dlist.get(i).getDcode() %>', '_blanck','width=400, height=300'); return false">삭제</button></td>
    																			
    											</tr>
    										</tbody>
    									
                           			 </table>
                            	</form>	
    						<%} %>
                        </div>
                        <br>
                        <div align=right>
                            <button class="btn-style" id="save" onclick="window.open('departmentadd.jsp', '_blanck','width=500, height=500')">학과 등록</button>
                        </div>
                    

                </div>
            </div>
        </div>
    </div>



    <!-- jQuery 가져오기 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    

        
        
        <script>
        //교수수정 삭제 관련 처리
        function professorformSubmit(){
        	confirm("정말 삭제하시겠습니까?");
        }
        
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
