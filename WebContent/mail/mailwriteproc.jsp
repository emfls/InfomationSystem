<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*,dbconnect.*"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	int stuid = Integer.parseInt(request.getParameter("stuid"));
	int who = Integer.parseInt(request.getParameter("who"));
	int sendwho;
	if(who==1){
		sendwho=0;
	}
	else{
		sendwho=1;
	}
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {

		conn = Connect.getConnection();
		
		String Query1 = "SELECT max(mnum) FROM message";
		pstmt = conn.prepareStatement(Query1);
		rs = pstmt.executeQuery();
		rs.next();
		int mnum = rs.getInt(1)+1;

		int to = Integer.parseInt(request.getParameter("to"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		String Query2 = "INSERT INTO message(subject,meg,fromwho,towho,mread,mnum) VALUES(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setString(1, subject);
		pstmt.setString(2, content);
		pstmt.setInt(3, stuid);
		pstmt.setInt(4, to);
		pstmt.setInt(5, sendwho);
		pstmt.setInt(6, mnum);

		pstmt.execute();
	} catch (SQLException e) {
		out.print(e);
	} finally {
		rs.close();
		pstmt.close();
		conn.close();
		response.sendRedirect("maillist.jsp?stuid="+stuid+"&who="+who);
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