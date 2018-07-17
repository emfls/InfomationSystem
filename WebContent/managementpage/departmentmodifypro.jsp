<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "management.*" %>

    <%
    request.setCharacterEncoding("UTF-8"); 
	response.setContentType("text/html;charset=UTF-8");
    String dcode=request.getParameter("dcode");
    String dname=request.getParameter("dname");

    
    ManageMentHandler handler=new ManageMentHandler();
    
    if(handler.departmentUpdate(dcode, dname))
    {
    	out.println("<script>alert(\"수정이 완료되었습니다.\");  opener.parent.location.reload();   window.close();</script>");
    }else{
    	out.println("<script>alert(\"입력된 정보를 확인하여 주세요.\"); history.go(-1);</script>");
    }
    
    %>