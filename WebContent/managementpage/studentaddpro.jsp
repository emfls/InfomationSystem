<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "management.*" %>

    <%
    request.setCharacterEncoding("UTF-8"); 
	response.setContentType("text/html;charset=UTF-8");
    String stunum=request.getParameter("stunum");
    String dname=request.getParameter("dname");
    String name=request.getParameter("name");
    String address=request.getParameter("address");
    String birth=request.getParameter("birth");
    String tel=request.getParameter("tel");
    String professor=request.getParameter("professor");
    String status=request.getParameter("status");
    String email=request.getParameter("email");
    String year=request.getParameter("year");
    String passwd=request.getParameter("passwd");
    
    ManageMentHandler handler=new ManageMentHandler();
    
    if(handler.studentInsert(stunum, name, address, birth, professor, year, passwd, tel, status, email, dname))
    {
    	out.println("<script>alert(\"등록이 완료되었습니다.\");  window.close();</script>");
    }else{
    	out.println("<script>alert(\"입력된 정보를 확인하여 주세요.\"); history.go(-1);</script>");
    }
    
    %>