<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="regist.*" %>

    <%
		LectureHandler handler=new LectureHandler();
    	handler.CancelHandler(request.getParameterValues("lcode"), (String)session.getAttribute("stuNum"));
    	out.println("<script>alert('수강 취소가 완료되었습니다.');</script>");
    %>
    
    <script>
	location.href="apply.jsp";
	</script>