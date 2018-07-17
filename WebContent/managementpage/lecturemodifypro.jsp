<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="management.*" %>

    <%
    request.setCharacterEncoding("UTF-8");
    String campus=request.getParameter("campus");
    String major=request.getParameter("major");
    String department=request.getParameter("department");
    String classname=request.getParameter("classname");
    String grade=request.getParameter("grade");
    String pname=request.getParameter("pname");
    String classroom=request.getParameter("classroom");
    String classsize=request.getParameter("classsize");
    String time=request.getParameter("time");
    String lcode=request.getParameter("lcode");
    
    ManageMentHandler handler=new ManageMentHandler();
    if(handler.lectureUpdate(campus, major, department, classname, grade, pname, classroom, classsize, time, lcode))
    {
    	out.println("<script>alert(\"수정이 완료되었습니다.\"); opener.parent.location.reload();  window.close();</script>");
    }else{
    	out.println("<script>alert(\"입력된 정보를 확인하여 주세요.\"); history.go(-1);</script>");
    }
    %>