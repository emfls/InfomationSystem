<%@page import="management.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

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

<body>
    <div class="wrapper">
        <!-- 오른쪽에 보여질 페이지 -->
        <div id="content">

            <div class="contents margin">
                <div>
                    <h3 class="dashHeader">학생정보 등록</h3>
                </div>
                <div class="dashboard-style">
                <%
                ManageMentHandler handler = new ManageMentHandler();
                StudentRegistData studentData = handler.getStudentData(request.getParameter("stunum"));
                %>
                    
                    <form id="editForm" method="post" action="studentaddpro.jsp">
                        <div id="container" class="table-responsive" style="border: 0px; overflow: auto">
                            <table class="table" style="table-layout:fixed; margin-bottom: 0px;" width=100%>
                                <tr>
                                    <td>학과명</td>
                                    <td colspan="3">
                                        <select id='class' name="dname">
                                          
                                        </select>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td>학번</td><td><input type=text name="stunum" value="" ></td>
                                    <td>이름</td><td><input type=text name="name" value=""></td>
                                </tr>
                                <tr>
                                    <td>주소</td><td><input type=text name="address" value=""></td>
                                    <td>생일</td><td><input type=date name="birth" value=""></td>
                                </tr>
                                <tr>
                                    <td>연락처</td><td><input type="text" name="tel" value=""></td>
                                    <td>지도교수</td><td><input type="text" name="professor" value=""></td>
                                </tr>
                                <tr>
                                    <td>학적상태</td><td><input type="text" name="status" value=""></td>
                                    <td>이메일</td><td><input type="text" name="email" value=""></td>
                                </tr>
                                <tr>
                                    <td>학년</td><td><input type="text" name="year" value=""></td>
                                    <td>패스워드</td><td><input type="password" name="passwd" value=""></td>
                                </tr>

                            </table>
                        </div>
                        
                        <div align=right>
                            <button id="edit" class="btn">등록</button>
                            <button id="cancel" class="btn">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <style>
        .margin{
            margin: 30px;
        }
    </style>


    <!-- jQuery 가져오기 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    
       <%
	    								request.setCharacterEncoding("utf-8");
                               		
                               			response.setContentType("text/html;charset=UTF-8");

                               			
            							String departmentList=handler.DepartmentListHandler();
										String comp=(String)request.getParameter("dname");
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