<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rollbook.*" %>
<%
 request.setCharacterEncoding("utf-8");
	String className=request.getParameter("lcode");
	String[] stuNum=request.getParameterValues("s");
	String[] s1=request.getParameterValues("s1");
	String[] s2=request.getParameterValues("s2");
	String[] s3=request.getParameterValues("s3");
	String[] s4=request.getParameterValues("s4");
	String[] s5=request.getParameterValues("s5");
	String[] s6=request.getParameterValues("s6");
	String[] s7=request.getParameterValues("s7");
	String[] s8=request.getParameterValues("s8");
	String[] s9=request.getParameterValues("s9");
	String[] s10=request.getParameterValues("s10");
	String[] s11=request.getParameterValues("s11");
	String[] s12=request.getParameterValues("s12");
	String[] s13=request.getParameterValues("s13");
	String[] s14=request.getParameterValues("s14");
	String[] s15=request.getParameterValues("s15");

	RollbookHandler handler=new RollbookHandler();
	handler.ProfessorCheckingSave(className, stuNum, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15);

%>

	<script>
	alert('저장되었습니다.');
	location.href="professorcheck.jsp";
	</script>
