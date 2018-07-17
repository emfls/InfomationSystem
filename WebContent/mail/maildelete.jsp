<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder,dbconnect.*"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<%
	int mnum = Integer.parseInt(request.getParameter("mnum"));
	int stuid = Integer.parseInt(request.getParameter("stuid"));
	int who = Integer.parseInt(request.getParameter("who"));

	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		conn = Connect.getConnection();

		String Query2 = "delete from message WHERE mnum=" + mnum;
		pstmt = conn.prepareStatement(Query2);
		pstmt.executeUpdate(Query2);

		pstmt.close();
		conn.close();

		String retUrl = "maillist.jsp?stuid=" + stuid + "&mnum=" + mnum + "&who=" + who;
		response.sendRedirect(retUrl);

	} catch (SQLException e) {
		out.print(e);
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