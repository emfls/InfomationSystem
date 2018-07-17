<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "management.*" %>
<%
request.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html;charset=UTF-8");
String dcode=request.getParameter("dcode");
ManageMentHandler handler=new ManageMentHandler();
handler.departmentDelete(dcode);
out.println("<script>alert(\"삭제가 완료되었습니다.\"); opener.parent.location.reload();  window.close();</script>");
%>