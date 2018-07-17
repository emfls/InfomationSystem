<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder, dbconnect.*"%>

<%
	int mnum = Integer.parseInt(request.getParameter("mnum"));
	int stuid = Integer.parseInt(request.getParameter("stuid"));
	int who = Integer.parseInt(request.getParameter("who"));
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2=null;
	ResultSet rs1 = null;
	
	try {

		conn = Connect.getConnection();
		
		String Query2 = "SELECT subject, meg FROM message WHERE mnum=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1, mnum);
		rs1 = pstmt.executeQuery();
		rs1.next();

		String subject = rs1.getString(1).trim();
		String content = rs1.getString(2).trim();
		content = content.replaceAll("\r\n", "<BR>");
		String sql="UPDATE message SET `reading`='1' WHERE `mnum`=" + mnum;
		pstmt2=conn.prepareStatement(sql);
		pstmt2.executeUpdate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK REL="stylesheet" type="text/css" href="../include/style.css" />
<title>게시판</title>
<link rel="stylesheet" href="../css/boardstyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/homestyle.css">
</head>
<BODY>
<TABLE WIDTH=600 HEIGHT=150 BORDER=0 CELLSPACING=1 CELLPADDING=1>
<td width=200 align="center"><img src="../knutLogo.png" width="90px" height="90px"></td>
<td><h3 class="dashHeader" align="center">메일 내용</h3></td>
</table>
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
				onClick="javascript:location.replace('maillist.jsp?stuid=<%=stuid%>&who=<%=who%>')"></TD>
			<TD WIDTH="310" ALIGN=RIGHT>
				<input type=button value="삭제" STYLE="CURSOR: HAND"
				onClick="javascript:location.replace('maildelete.jsp?stuid=<%=stuid%>&who=<%=who%>&mnum=<%=mnum%>')">&nbsp;&nbsp;
			</TD>
		</TR>

	</TABLE>
	<%
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rs1.close();
			pstmt.close();
			pstmt2.close();
			conn.close();
		}
	%>

</body>
</html>