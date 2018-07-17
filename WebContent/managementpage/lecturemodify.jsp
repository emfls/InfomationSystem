<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="regist.*, java.util.ArrayList, management.*" %>

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
</head>
<%
String lcode=(String)request.getParameter("lcode");
LectureHandler handler=new LectureHandler();
	ArrayList<LectureData> data=handler.LectureListHandler("select lcode, cname, major, classsize, grade, time, slike, open, "
				+ "classroom, campus, pname, dname, regist from lecture join professor join department " 
				+ "on lecture.pronum=professor.pronum and lecture.dcode=department.dcode where lecture.lcode="+lcode);
%>

<body>
    <div class="wrapper">
        <!-- 오른쪽에 보여질 페이지 -->
        <div id="content">

            <div class="contents">
                <div>
                    <h3 class="dashHeader">강좌 수정</h3>
                </div>
                <div class="dashboard-style">
                    <form id="editForm" action="lecturemodifypro.jsp" method="post">
                        <div id="container" class="table-responsive" style="border: 0px; overflow: auto">
                            <table class="table" style="table-layout:fixed; margin-bottom: 0px;" width=100%>
                                <tr>
                                    <td width=15%>캠퍼스</td><td><input type=text name="campus" value="<%= data.get(0).getCampus() %>"></td>
                                </tr>
                                <tr>
                                    <td>구분</td>
                                    <td>
                                        <input type=text name="major" value="<%= data.get(0).getMajor() %>">
                                    </td>
                                </tr>
                                <tr>
                                <td>학과</td>
                                <td>
                                    <select id='department' name="department"></select>
                                </td>
                                </tr>
                                <tr>
                                    <td>교과목명</td><td><input type=text name="classname" value="<%= data.get(0).getCname() %>"></td>
                                </tr>
                                <tr>
                                    <td>학점</td><td><input type=text name="grade" value="<%= data.get(0).getGrade() %>"></td>
                                </tr>
                                <tr>
                                    <td>담당교수</td><td><input type=text name="pname" value="<%= data.get(0).getPname() %>"></td>
                                </tr>
                                <tr>
                                    <td>강의실</td><td><input type=text name="classroom" value="<%= data.get(0).getClassroom() %>"></td>
                                </tr>
                                <tr>
                                    <td>제한수</td><td><input type=text name="classsize" value="<%= data.get(0).getClassSize() %>"></td>
                                </tr>
                                <tr>
                                    <td>강의시간</td><td><input type=text name="time" id="time" value="<%= data.get(0).getTime()  %>" readonly> <input type="button" value="강의시간등록" onClick="window.open('proSchedule.jsp', '_blank')"></td>
                                    
                                </tr>
                            </table>
                            <input type=hidden name="lcode" value="<%= data.get(0).getLcode() %>">
                        </div>
                        
                        <div align=right>
                            <button id="edit" class="btn">수정</button>
                            <button id="cancel" class="btn">취소</button>
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
                               		
                               			response.setContentType("text/html;charset=UTF-8");

                               		 	ManageMentHandler mhandler = new ManageMentHandler();
            							String departmentList=mhandler.DepartmentListHandler();
										String comp=data.get(0).getDname();
         							%>
<script>
        							//학과리스트
        							$(document).ready(function() {
            						var selectBox = document.getElementById('department');
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

    <script>
        //수정버튼 누를시 해당 정보 디비로 전송
        $("#edit").click(function() {
            $("#editForm").submit();
        });
        
        $("#cancel").click(function() {
            window.close();
        });
        
    </script>

    <!-- Bootstrap Js 가져오기 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/homeScript.js"></script>
</body>

</html>
