<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder,dbconnect.*" %>

<%request.setCharacterEncoding("utf-8"); %>
<%
	int passwd = Integer.parseInt(request.getParameter("pass"));
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	int lcode = Integer.parseInt(request.getParameter("lcode"));
	int no = Integer.parseInt(request.getParameter("no"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try
	{
		conn = Connect.getConnection();
		
		String Query1 = "SELECT pass FROM boardreply WHERE no=?";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		
		rs.next();
		int dbPass = rs.getInt(1);
		
		if(passwd == dbPass)
		{
			String Query2 = "delete from boardreply WHERE no="+no;
			pstmt = conn.prepareStatement(Query2);
			pstmt.executeUpdate(Query2);
			
			rs.close();
			pstmt.close();
			conn.close();
			
			String retUrl = "boardcontent.jsp?lcode="+lcode+"&bnum="+bnum;
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