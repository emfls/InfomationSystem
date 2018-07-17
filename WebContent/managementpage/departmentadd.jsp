<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="management.*" %>
    <% request.setCharacterEncoding("UTF-8"); 
    	response.setContentType("text/html;charset=UTF-8");
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
    <link rel="stylesheet" href="css/homestyle.css">
</head>

<body>
    <div class="wrapper">
        <!-- 오른쪽에 보여질 페이지 -->
        <div id="content">

            <div class="contents">
                <div>
                    <h3 class="dashHeader">학과정보등록</h3>
                </div>
                <div class="dashboard-style">
                    <form id="editForm" method="post" action="departmentaddpro.jsp">
                        <div id="container" class="table-responsive" style="border: 0px; overflow: auto">
                            <table class="table" style="table-layout:fixed; margin-bottom: 0px;" width=100%>
                               <tr>
                               		<td>학과코드</td><td><input type="text" name="dcode" value=""/></td>
                               </tr>
                                <tr>
                              
                                    <td>학과명</td><td><input type=text name="dname" value=""></td>
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



        <!-- jQuery 가져오기 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    


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
