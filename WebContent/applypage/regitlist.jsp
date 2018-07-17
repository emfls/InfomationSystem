<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ page import="regist.*" %>
<%@ page import="java.util.ArrayList" %>
    <%
    	String stunum=(String)session.getAttribute("stuNum");	//현재 세션에 로그인되어있는 학생의 학번정보를 불러온다.
		String sql="select lecture.lcode, cname, major, classsize, grade, time, slike, open, classroom, campus, pname, dname, regist from lecture join professor join department join registation on lecture.pronum=professor.pronum and lecture.dcode=department.dcode and registation.lcode=lecture.lcode where registation.stunum="+stunum;
		//학번을 통해서 신청강과에 관한 정보를 가져오는 sql문을 구성한다.
     	LectureHandler handler=new LectureHandler();
       		Schedule sch=new Schedule();
       		ArrayList<LectureData> data=handler.LectureListHandler(sql);
           for(int i=0; i<data.size();i++) {
        	   String time=sch.scheduleIndexChangeToList(sch.splitIndexforSchedule(data.get(i).getTime()));
           %>	<!-- 남은 데이터가 없을때 까지 반복한다. -->
<script>
//수강신청 내역 테이블을 만드는 JS코드
        $(document).ready(function add_row2() {
            var table = document.getElementById('applyConfirm');
            var row = table.insertRow(table.rows.length);

                for (var j = 0; j < 10; j++) {
                    var cell = row.insertCell(j);

                    switch (j) {
                        case 0:
                            cell.innerHTML = "<input class='checkbox-inline'  name='lcode' type='checkbox' value='<%=data.get(i).getLcode() %>'>";
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
                        case 6:	//신청수
                            cell.innerHTML = <%=data.get(i).getRegist()%>;
                            cell.width = "60px";
                            break;
                        case 7:	//담당교수
                            cell.innerHTML = "<%=data.get(i).getPname() %>";
                            cell.width = "70px";
                            break;
                        case 8:	//강의시간
                            cell.innerHTML = "<%=time%>";
                            cell.width = "80px";
                            break;
                        case 9:	//강의실
                            cell.innerHTML = "<%=data.get(i).getClassroom() %>";
                            cell.width = "100px";
                            break;

                    }
                }
                row = table.insertRow(table.rows.length);
            
        });

</script>
        <%}%>