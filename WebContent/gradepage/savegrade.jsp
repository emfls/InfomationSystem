<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="grade.*" %>
<%
 request.setCharacterEncoding("utf-8");
	String className=request.getParameter("lcode");
	String[] stuNum=request.getParameterValues("s");
	String[] score=request.getParameterValues("score");

	GradeHandler handler=new GradeHandler();
	handler.ProfessorGradeSave(className, stuNum, score);

%>

	<script>
	alert('저장되었습니다.');
	location.href="professorgrade.jsp";
	</script>
-