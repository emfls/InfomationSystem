<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="management.*" %>
    
<%
	request.setCharacterEncoding("UTF-8");
	String pronum = request.getParameter("pronum");
	String password = request.getParameter("passwd");
	String proname = request.getParameter("proname");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
	String departname = request.getParameter("dname");
	String email = request.getParameter("email");
	String lab = request.getParameter("lab");
	String tel = request.getParameter("tel");
	
	ManageMentHandler handler = new ManageMentHandler();
	if(handler.professorInsert(pronum, password, proname, birth, address, departname, email, lab, tel))
	{
    	out.println("<script>alert(\"등록이 완료되었습니다.\");  window.close();</script>");
    }else{
    	out.println("<script>alert(\"입력된 정보를 확인하여 주세요.\"); history.go(-1);</script>");
    }
%>