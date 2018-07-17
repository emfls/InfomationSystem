<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder,dbconnect.*"%>

<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String lcode1 = request.getParameter("lcode");
	int lcode = Integer.parseInt(lcode1);
	int no = Integer.parseInt(request.getParameter("no"));
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;

	try {
		conn = Connect.getConnection();

		String Query2 = "SELECT subject, content FROM boardreply WHERE no=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1, no);
		rs1 = pstmt.executeQuery();
		rs1.next();

		String subject = rs1.getString(1).trim();
		String content = rs1.getString(2).trim();
		content = content.replaceAll("\r\n", "<BR>");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK REL="stylesheet" type="text/css" href="../include/style.css" />
<title>Insert title here</title>
<link rel="stylesheet" href="../css/boardstyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/homestyle.css">
</head>
<body>
<TABLE WIDTH=800 HEIGHT=150 BORDER=0 CELLSPACING=1 CELLPADDING=1	ALIGN=CENTER>
		<td width=200 align="left"><img src="../knutLogo.png" width="90px" height="90px"></td>
<td width=400 align="center"><h3 class="dashHeader" align="center">댓글내용</h3></td>
<td width=200>
</td>
	</TABLE>
<BODY>

	<div class="container" style="border: 0px; overflow: auto">
<div class="dashboard-style">
	<table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px">

		<TR>
			<TD WIDTH=120 ALIGN=CENTER><B>제목</B></TD>
			<TD WIDTH=500><%=subject%></TD>
		</TR>

		<TR>
			<TD WIDTH=120 ALIGN=CENTER><B>내용</B></TD>
			<TD WIDTH=500><%=content%></TD>
		</TR>

	</TABLE>
</div>
</div>


	<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1
		ALIGN=CENTER>

		<TR ALIGN=CENTER>
			<TD WIDTH="310" ALIGN=LEFT><input type=button value="목록"
				STYLE="CURSOR: HAND"
				onClick="javascript:location.replace('boardcontent.jsp?lcode=<%=lcode%>&bnum=<%=bnum%>')"></TD>
			</TD>
			<TD WIDTH="310" ALIGN=RIGHT>
				<input type=button value="삭제" STYLE="CURSOR: HAND"
				onClick="javascript:location.replace('boardreplydelete.jsp?lcode=<%=lcode%>&bnum=<%=bnum%>&no=<%=no%>')">&nbsp;&nbsp;
			</TD>
		</TR>

	<%
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rs1.close();
			pstmt.close();
			conn.close();
		}
	%>

</body>
</html>