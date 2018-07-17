<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*,dbconnect.*"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String id1 = (String) session.getAttribute("stuNum");
	int id = Integer.parseInt(id1);
	String lcode1 = request.getParameter("lcode");
	int lcode = Integer.parseInt(lcode1);
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {

		conn = Connect.getConnection();

		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pass = request.getParameter("pass");

		String Query1 = "SELECT max(bnum),max(grpnum) FROM board";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(Query1);
		rs.next();
		int uid = (rs.getInt(1)) + 1;
		int gid = (rs.getInt(2)) + 1;
		int blevel = 0;
		int border = 1;

		String Query2 = "INSERT INTO board(bnum,subject,content,lcode,stunum,stupass,grpnum,blevel,border) VALUES(?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1, uid);
		pstmt.setString(2, subject);
		pstmt.setString(3, content);
		pstmt.setInt(4, lcode);
		pstmt.setInt(5, id);
		pstmt.setString(6, pass);
		pstmt.setInt(7, gid);
		pstmt.setInt(8, blevel);
		pstmt.setInt(9, border);

		pstmt.execute();
	} catch (SQLException e) {
		out.print(e);
	} finally {
		rs.close();
		pstmt.close();
		conn.close();
		response.sendRedirect("boardlist.jsp?lcode="+lcode);
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