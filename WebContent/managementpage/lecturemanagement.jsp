
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="login.LogonDBBean, regist.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>학사관리 시스템</title>
    
    <!-- jQuery 가져오기 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Bootstrap CSS를 불러옴 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/homestyle.css">
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
                    	관리자님 반갑습니다.<br><a href="../loginpage/sessionLogout.jsp">(로그아웃)</a></p>
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
                
<%--                     <%	LogonDBBean logon = LogonDBBean.getInstance(); --%>
<%--                     	int msgcnt=logon.getMessageCount((String)session.getAttribute("stuNum"));%> --%>
<%--                 <button class="badge1 glyphicon glyphicon-envelope btn btn-style sidebar-btn navbar-right" data-badge=<%=msgcnt %>> --%>
					<button class="badge1 glyphicon glyphicon-envelope btn btn-style sidebar-btn navbar-right" data-badge=0>
                </button>
                <span class="navbar-right">관리자</span>
            </div>

            <div class="contents">
                <div>
                    <h3 class="dashHeader">강좌관리</h3>
                </div>
                
                <div class="dashboard-style">
                    <form id="checkProc">
                        <div id="container" class="table-responsive top" style="border: 0px; overflow: auto">
                            <table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px;">
                                <thead class="thead-default">
                                    <tr>
                                        <th width=60>캠퍼스</th>
                                        <th width=50>구분</th>
                                        <th width=120>학과명</th>
                                        <th width=120>교과목명</th>
                                        <th width=50>학점</th>
                                        <th width=70>담당교수</th>
                                        <th width=80>강의시간</th>
                                        <th width=100>강의실</th>
                                        <th width=60>수정</th>
                                        <th width=60>삭제</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div id="container" class="table-responsive bottom" style="border: 0px; max-height: 500px; overflow: auto">
                            <table id="adminClass" class="table table-striped padding " style="table-layout:fixed">

                                <tbody>
                                </tbody>

                            </table>
                        </div>
                        <div align=right>
                            <button id="save" class="btn-style" onclick="javascript:window.open('lectureadd.jsp')">강좌 생성</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    
    
        
     <%
     	String sql;
     	if((String)session.getAttribute("searchSql")==null)
     	{
       		sql="select lcode, cname, major, classsize, grade, time, slike, open, "
   					+ "classroom, campus, pname, dname, regist from lecture join professor join department "
   					+ "on lecture.pronum=professor.pronum and lecture.dcode=department.dcode";
     	}else
     	{
     		sql=(String)session.getAttribute("searchSql");
     	}

           	LectureHandler handler=new LectureHandler();
       		Schedule sch=new Schedule();
       		ArrayList<LectureData> data=handler.LectureListHandler(sql);
           for(int i=0; i<data.size();i++) {
        	   String time=sch.scheduleIndexChangeToList(sch.splitIndexforSchedule(data.get(i).getTime()));
        	   %>	<!-- 테이블에 레코드가 남지않을때까지 반복한다. -->
<script>

	function openmodify(lcode){
		var code=lcode;
		var link="lecturemodify.jsp?lcode=" + code;
		window.open(link, '_blanck','width=430, height=500'); 
		return false;
	}
	
	function opendelete(lcode){
		var code=lcode;
		var link="lecturedelete.jsp?lcode=" + code;
		window.open(link, '_blanck','width=430, height=500'); 
		return false;
	}
	
    //수강 신청관련한 테이블을 구성하는 JS코드
        $(document).ready(function add_row() {
            var table = document.getElementById('adminClass');	
            var row = table.insertRow(table.rows.length);

                for (var j = 0; j < 10; j++) {
                    var cell = row.insertCell(j);

                    switch (j) {
                        case 0:	//캠퍼스
                            cell.innerHTML = " <%=data.get(i).getCampus()%> ";
                            cell.width = "60px";
                            break;
                        case 1:	//구분
                            cell.innerHTML = " <%=data.get(i).getMajor()%> ";
                            cell.width = "50px";
                            break;
                        case 2:	//학과명
                            cell.innerHTML = " <%=data.get(i).getDname()%> ";
                            cell.width = "120px";
                            break;
                        case 3:	//교과목명
                            cell.innerHTML = " <%=data.get(i).getCname()%> ";
                            cell.width = "120px";
                            break;
                        case 4:	//학점
                            cell.innerHTML = " <%=data.get(i).getGrade()%> ";
                            cell.width = "50px";
                            break;
                        case 5:	//담당교수
                            cell.innerHTML = "<%=data.get(i).getPname() %>";
                            cell.width = "70px";
                            break;
                        case 6:	//강의시간
                            cell.innerHTML = "<%=time%>";
                            cell.width = "80px";
                            break;
                        case 7:	//강의실
                            cell.innerHTML = "<%=data.get(i).getClassroom() %>";
                            cell.width = "100px";
                            break;
                        case 8: //수정
                            cell.innerHTML = "<input type='button' class='btn-style' id='<%=i%>' name='<%=data.get(i).getLcode() %>' value='수정' onClick='javascript:openmodify(<%= data.get(i).getLcode() %>)' >";
                            cell.width = "60px";
                            break;
                        case 9: //삭제
                            cell.innerHTML = "<input type='button' class='btn-style' id='<%=i%>' name='<%=data.get(i).getLcode() %>' value='삭제' onClick='javascript:opendelete(<%= data.get(i).getLcode() %>)' >";
                            cell.width = "60px";
                            break;
                            
                    }
                }
                row = table.insertRow(table.rows.length);
            
        });

</script>
        <% }
        
        session.setAttribute("searchSql", null);
        %>



    <!-- jQuery 가져오기 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

    <script>

        //검색 버튼
        $("#classSearch").click(function(){
            var selectBox = document.getElementById('class');
            var selectBox2 = document.getElementById('class2');
            
            var selectValue = selectBox.options[selectBox.selectedIndex].value;
            var selectValue2 = selectBox2.options[selectBox2.selectedIndex].value;
            
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
        
        function deleteBtn(){
            if (confirm("정말 삭제하시겠습니까??") == true){    //확인
                
            }else{   //취소
                return;
            }
        }

    </script>

    <!-- Bootstrap Js 가져오기 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../js/homeScript.js"></script>
    
</body>

</html>
