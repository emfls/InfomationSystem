<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, login.LogonDBBean, schedule.*" %>

<% String name=(String)session.getAttribute("name");%>

<HTML>

<HEAD>
    <TITLE></TITLE>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <script>
        function add_row() {
            var time = 7;
            var classTime = -1;
            var table = document.getElementById('bodySche');
            var row = table.insertRow(table.rows.length); // 하단에 추가
            
            var idNum=0;
            for (var i = 0; i < 30; i++) {
                for (var j = 0; j < 8; j++) {
                    var cell = row.insertCell(j);
                    //시간 부분 구현
                    if (j == 0) {
                        if (i % 2 == 0) {
                            cell.innerHTML = ++time + ":00";
                        } else {
                            cell.innerHTML = time + ":30";
                        }
                        cell.className = "time";
                        //교시 부분 구현
                    } else if (j == 1) {
                        if (i % 2 == 0) {
                            cell.innerHTML = ++classTime + "A";
                        } else {
                            cell.innerHTML = classTime + "B";
                        }
                        cell.className = "classTime";
                        //시간표 구현
                    } else {
                        //시간표 넣을 쿼리
                    	//시간표 각 칼럼에 id넣기
                    	cell.id=idNum;
                       if(i%2==0){
                    	   cell.innerHTML="<input type='checkbox' name='checkBox' class='tiny-toggle' value='"+ idNum++ +"'> ";
                       }
                       else{
                    	   cell.innerHTML="<input type='checkbox' name='checkBox' class='tiny-toggle' value='"+ idNum++ +"'>";
                       }
                    }
                }
                row = table.insertRow(table.rows.length);
            }
			<%
				ScheduleDBBean sche = ScheduleDBBean.getInstance();
				ArrayList<StudentData> data= sche.getStudentData("1250003"); 
			%>
			
			

        }
    </script>



    <!-- jquery, jspdf, html2canvas import-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
    <script src="js/html2canvas.js"></script>

    

    <!-- 테이블 스타일 설정-->
    <style>
        body {
            align-content: left;
        }
        
        table {
            border-collapse: collapse;
        }
        
        table th {
            height: 45px;
            background-color: aliceblue;
        }
        
        table td {
            height: 29px;
            text-align: center;
            word-break: break-all;
        }
        
        table th {
            background-color:
        }
        
        .time,
        .classTime {
            background-color: aliceblue;
        }
        
        button {
            width: 100px;
            height: 25px;
            border-radius: 5%;
            background-color: #eeeeee;
            color: black;
        }
        /*프린트 영역 지정*/
        
        @media print {
            nav {
                display: none;
            }
        }

    </style>

</HEAD>

<BODY onload="add_row()">
    <!-- 네비게이션 바 구현 -->
    
    

    <!-- 시간표 구현 -->
    <div id="print">

        <table>
            <tr>
                <td colspan=2>
                    <H2 align=center>강의 시간표</H2>
                </td>
            </tr>
            <tr>
                <td>
                    <p align=left>강의시간을 선택해주세요.</p>
                </td>
                <td>
                	
                </td>
            </tr>
            <tr>
                <td colspan=2>
                <form method="post" action="proSchedulepro.jsp">
                    <table id="scheTable" border="1px" style="table-layout:fixed" width=600>
                        <thead text-aglin=center>
                            <th width=30>시간</th>
                            <th width=30>교시</th>
                            <th width=20>월</th>
                            <th width=20>화</th>
                            <th width=20>수</th>
                            <th width=20>목</th>
                            <th width=20>금</th>
                            <th width=20>토</th>
                        </thead>
                        <tbody id="bodySche"></tbody>
                    </table>
                    
       				 
    				<button id="submit">저장</button>
               </form>
                </td>
                
            </tr>
            
        </table>
    </div>
</BODY>
</HTML>
