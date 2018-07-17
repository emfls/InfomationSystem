<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="regist.*" %>
<%@ page import="java.util.ArrayList" %>
    
    
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
	function openboard(sibal){  
	   var name_by_id = document.getElementById(sibal.getAttribute('id')).getAttribute('name');
	    window.open("/InfomationSystem/board/boardlist.jsp?lcode="+name_by_id, "게시판", "width=800, height=550, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	}
    //수강 신청관련한 테이블을 구성하는 JS코드
        $(document).ready(function add_row() {
            var table = document.getElementById('apply');	
            var row = table.insertRow(table.rows.length);

                for (var j = 0; j < 12; j++) {
                    var cell = row.insertCell(j);

                    switch (j) {
                        case 0:
                            cell.innerHTML = "<input class='checkbox-inline' type='checkbox' name='lcode' value='<%=data.get(i).getLcode() %>'>";
                            cell.width = "50px";
                            break;
                        case 1:	//캠퍼스
                            cell.innerHTML = " <%=data.get(i).getCampus()%> ";
                            cell.width = "60px";
                            break;
                        case 2:	//구분
                            cell.innerHTML = " <%=data.get(i).getMajor()%> ";
                            cell.width = "50px";
                            break;
                        case 3:	//학과명
                            cell.innerHTML = " <%=data.get(i).getDname()%> ";
                            cell.width = "120px";
                            break;
                        case 4:	//교과목명
                            cell.innerHTML = " <%=data.get(i).getCname()%> ";
                            cell.width = "120px";
                            break;
                        case 5:	//학점
                            cell.innerHTML = " <%=data.get(i).getGrade()%> ";
                            cell.width = "50px";
                            break;
                        case 6:	//제한수
                            cell.innerHTML = "<%=data.get(i).getClassSize() %>";
                            cell.width = "60px";
                            break;
                        case 7:	//신청수
                            cell.innerHTML = "<%=data.get(i).getRegist()%>";
                            cell.width = "60px";
                            break;
                        case 8:	//담당교수
                            cell.innerHTML = "<%=data.get(i).getPname() %>";
                            cell.width = "70px";
                            break;
                        case 9:	//강의시간
                            cell.innerHTML = "<%=time%>";
                            cell.width = "80px";
                            break;
                        case 10:	//강의실
                            cell.innerHTML = "<%=data.get(i).getClassroom() %>";
                            cell.width = "100px";
                            break;
                        case 11: //게시판
                            cell.innerHTML = "<input type='button' id='<%=i%>' name='<%=data.get(i).getLcode() %>' class='btn-style' value='게시판' onClick='javascript:openboard(this)'>";
                            cell.width = "100px";
                            break;
                    }
                }
                row = table.insertRow(table.rows.length);
            
        });

</script>
        <% }
        
        session.setAttribute("searchSql", null);
        %>