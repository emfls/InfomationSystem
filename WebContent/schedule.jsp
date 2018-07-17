<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, login.LogonDBBean, schedule.*" %>

<% String name=(String)session.getAttribute("name");
String stunum=(String)session.getAttribute("stuNum");
%>

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
                    	cell.id=idNum++;
                       if(i%2==0){
                    	   cell.innerHTML=" ";
                       }
                    }
                }
                row = table.insertRow(table.rows.length);
            }
			<%
				ScheduleDBBean sche = ScheduleDBBean.getInstance();
				ArrayList<StudentData> data= sche.getStudentData(stunum); 
					
				
				for(int i=0; i<data.size(); i++) {
					String pname = data.get(i).getPName();//교수이름
					String cname = data.get(i).getCName();//강좌이름
					String classroom = data.get(i).getClassroom();//강의실
					String time = data.get(i).getTime();//강의시간
					String[] timeArr = time.split(",");
					
					for (String ti : timeArr ){
			%>            
			        document.getElementById(<%=ti%>).innerHTML = '<%=pname%>'+'<br>'+'<%=cname%>'+'<br>'+'<%=classroom%>';
			<%
					}
				}
			%> 
			
			$(function(){
			    $('#scheTable').each(function() {
			        var table = this;
			        $.each([3,4,5,6,7,8] /* 합칠 칸 번호 */, function(c, v) {
			            var tds = $('>tbody>tr>td:nth-child(' + v + ')', table).toArray();
			            var i = 0, j = 0;
			            for(j = 1; j < tds.length; j ++) {
			            	if(tds[i].innerHTML != tds[j].innerHTML) {
			                    $(tds[i]).attr('rowspan', j - i);
			                    i = j;
			                    continue;
			                }
			                $(tds[j]).hide();
			            }
			            j --;
		            	if(tds[i].innerHTML == tds[j].innerHTML) {
			                $(tds[i]).attr('rowspan', j - i + 1);
			            }
			        });
			    });
			});

        }
    </script>



    <!-- jquery, jspdf, html2canvas import-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
    <script src="js/html2canvas.js"></script>

    <!-- pdf 파일 다운로드 구현
        아직 미완성 -->
    <script>
        $(document).ready(function() {
            $('#pdfBtn').click(function() {
                html2canvas($('#print'), {
                    onrendered: function(canvas) {
                        var imgData = canvas.toDataURL('image/png');
                        var doc = new jsPDF('p', 'mm', [297, 210]); //A4용지 크기
                        doc.addImage(imgData, 'PNG', 10, 10, 190, 270);
                        doc.save('시간표.pdf');
                    }
                });
            });
        });

    </script>

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

		.btn-style {
		   width: 80px !important;
		   height: 35px !important;
		   margin: 9px;
		   color: white !important;
		   background: #401E20;
		   border: 2px solid #a1a1a1;
		   border-radius: 25px !important;
		}
		
		.btn-style:after {
		    color: white;
		    background: #867E7E;
		    transition: 0.5s;
		}
		
		.btn-style:active {
		    color: white;
		    background: #867E7E;
		    box-shadow: 2px 2px 3px 2px rgba(0, 0, 0, 0.1);
		    transition: 0.5s;
		}
    </style>

</HEAD>

<BODY onload="add_row()">
    <!-- 네비게이션 바 구현 -->
    <nav style="position: fixed">
        <button id="pdfBtn" class="btn-style">PDF 저장</button>
        <button class="btn-style" onclick="javascript:window.print()">인쇄</button>
    </nav>

    <!-- 시간표 구현 -->
    <div id="print">

        <table>
            <tr>
                <td>
                    <H2 align=center>수업 시간표</H2>
                </td>
            </tr>
            <tr>
                <td>
                    <p align=left>[개인시간표조회] <%=data.get(0).getYear()%>년도 <%=data.get(0).getQuarter()%>학기 <%=data.get(0).getName() %></p>
                </td>
            </tr>
            <tr>
                <td>
                    <table id="scheTable" border="1px" style="table-layout:fixed" width=600>
                        <thead>
                            <th width=70>시간</th>
                            <th width=50>교시</th>
                            <th width=120>월</th>
                            <th width=120>화</th>
                            <th width=120>수</th>
                            <th width=120>목</th>
                            <th width=120>금</th>
                            <th width=120>토</th>
                        </thead>
                        <tbody id="bodySche"></tbody>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</BODY>

</HTML>
