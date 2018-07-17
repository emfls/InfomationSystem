<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "management.*" %>

    <%
    request.setCharacterEncoding("UTF-8"); 
	response.setContentType("text/html;charset=UTF-8");
    String pronum=request.getParameter("pronum");
    String dname=request.getParameter("dname");
    String pname=request.getParameter("proname");
    String lab=request.getParameter("lab");
    String tel=request.getParameter("tel");
    
    ManageMentHandler handler=new ManageMentHandler();
    
    if(handler.professorUpdate(pname, dname, lab, tel, pronum))
    {
    	out.println("<script>alert(\"수정이 완료되었습니다.\");  window.close();</script>");
    }else{
    	out.println("<script>alert(\"입력된 정보를 확인하여 주세요.\"); history.go(-1);</script>");
    }
    
    %>