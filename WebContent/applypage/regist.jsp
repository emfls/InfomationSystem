<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="regist.*" %>

    <%
		LectureHandler handler=new LectureHandler();	//수강신청을 위한 클래스를 로드한다
    	String[] lcodes=request.getParameterValues("lcode");	//수강신청하기위해 선택된 과목코드를 
    	int succes=handler.RegistHandler(lcodes, (String)session.getAttribute("stuNum"));	//수강신청을 진행하고 수강신청에 성공한 과목의 갯수를 리턴한다.
		if(succes > 0){	//수강신청에 성공한 화목수가 1개 이상일때
			%>
			<script>alert('<%=lcodes.length %>과목 중 <%=succes%>과목이 수강신청 되었습니다.');</script>
		<%
		}else{	//수강신청에 성공한 과목이 없을때
			out.println("<script>alert('수강신청 실패!');</script>");
		}
		
		
	%>
	<script>
	location.href="apply.jsp";
	</script>
