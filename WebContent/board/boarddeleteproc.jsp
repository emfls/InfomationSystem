<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder,dbconnect.*" %>

<%request.setCharacterEncoding("utf-8"); %>
<%
	String passwd = request.getParameter("pass");
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	int lcode = Integer.parseInt(request.getParameter("lcode"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try
	{
		conn = Connect.getConnection();
		
		String Query1 = "SELECT stupass FROM board WHERE bnum=?";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1, bnum);
		rs = pstmt.executeQuery();
		
		rs.next();
		String dbPass = rs.getString(1);
		
		if(passwd.equals(dbPass))
		{
			String Query2 = "UPDATE board SET content='삭제된 글입니다.', subject='삭제된 글입니다.' WHERE bnum="+bnum;
			pstmt = conn.prepareStatement(Query2);
			pstmt.executeUpdate(Query2);
			
			rs.close();
			pstmt.close();
			conn.close();
			
			String retUrl = "boardlist.jsp?lcode="+lcode;
			response.sendRedirect(retUrl);
		}
		else
		{
			rs.close();
			pstmt.close();
			conn.close();
			out.println("<script language=\"javascript\">");
			out.println("alert('패스워드가 다릅니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.flush();
		}
	}
	catch(SQLException e)
	{
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