<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder,dbconnect.*" %>

<%request.setCharacterEncoding("utf-8"); %>

<%
	int lcode = Integer.parseInt(request.getParameter("lcode"));
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String id1 = (String) session.getAttribute("stuNum");
	int id = Integer.parseInt(id1);

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try
	{
		conn = Connect.getConnection();
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int pass = Integer.parseInt(request.getParameter("pass"));
		
		String Query4 = "INSERT INTO boardreply(content,stuid,bnum,lcode,subject,pass) VALUES(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(Query4);
		pstmt.setString(1, content);
		pstmt.setInt(2, id);
		pstmt.setInt(3, bnum);
		pstmt.setInt(4, lcode);
		pstmt.setString(5, subject);
		pstmt.setInt(6, pass);
		pstmt.execute();
		}
	catch(SQLException e)
	{
		out.print(e);
	}
	finally
	{
		pstmt.close();
		conn.close();
		String retUrl="boardcontent.jsp?lcode="+lcode+"&bnum="+bnum;
		response.sendRedirect(retUrl);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>