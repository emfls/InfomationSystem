<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder, dbconnect.*"%>

<%
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String lcode1 = request.getParameter("lcode");
	int lcode = Integer.parseInt(lcode1);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	int totalrecord = 0;

	try {

		conn = Connect.getConnection();

		String Query1 = "UPDATE board SET look=look+1 WHERE bnum=?";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1, bnum);
		pstmt.executeUpdate();

		String Query2 = "SELECT subject, content FROM board WHERE bnum=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1, bnum);
		rs1 = pstmt.executeQuery();
		rs1.next();

		String subject = rs1.getString(1).trim();
		String content = rs1.getString(2).trim();
		content = content.replaceAll("\r\n", "<BR>");
		
		String Query3 = "select count(no) from boardreply where bnum=?";
		pstmt = conn.prepareStatement(Query3);
		pstmt.setInt(1, bnum);
		rs2 = pstmt.executeQuery();
		rs2.next();
		totalrecord = rs2.getInt(1);
		
		String Query4 = "select subject,no from boardreply where bnum=?";
		pstmt = conn.prepareStatement(Query4);
		pstmt.setInt(1, bnum);
		rs3 = pstmt.executeQuery();
		
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
<td width=400 align="center"><h3 class="dashHeader" align="center">글내용</h3></td>
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
				onClick="javascript:location.replace('boardlist.jsp?lcode=<%=lcode%>')"></TD>
			<TD WIDTH="310" ALIGN=RIGHT><input type=button value="댓글쓰기"
				STYLE="CURSOR: HAND"
				onClick="javascript:location.replace('boardreply.jsp?lcode=<%=lcode%>&bnum=<%=bnum%>')">&nbsp;&nbsp;
				<input type=button value="수정" STYLE="CURSOR: HAND"
				onClick="javascript:location.replace('boardmodify.jsp?lcode=<%=lcode%>&bnum=<%=bnum%>')">&nbsp;&nbsp;
				<input type=button value="삭제" STYLE="CURSOR: HAND"
				onClick="javascript:location.replace('boarddelete.jsp?lcode=<%=lcode%>&bnum=<%=bnum%>')">&nbsp;&nbsp;
			</TD>
		</TR>

	</TABLE>
	
		<TABLE WIDTH=800 HEIGHT=100 BORDER=0 CELLSPACING=1 CELLPADDING=1	ALIGN=CENTER>
<td align="center"><h3 class="dashHeader" align="center">댓글내용</h3></td>
	</TABLE>
<div class="container" style="border: 0px; overflow: auto">
<div class="dashboard-style">
	<table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px">
		<TR ALIGN=CENTER>
			<TD WIDTH=45><B>번호</B></TD>
			<TD WIDTH=395><B>제목</B></TD>
		</TR>
		<%
			while (rs3.next()) {
					String resubject = rs3.getString("subject");
					int no = rs3.getInt("no");
		%>
		
		<TR>
			<TD WIDTH=45 ALIGN=CENTER><%= totalrecord %></TD>
			<TD WIDTH=350 ALIGN=LEFT><A HREF="boardreplycontent.jsp?lcode=<%=lcode%>&bnum=<%=bnum%>&no=<%=no%>"><%=resubject%></TD>
		</TR>
			<%
			totalrecord--;
				}
		%>
	</TABLE>
	</div>
	</div>
	<%
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rs1.close();
			rs2.close();
			rs3.close();
			pstmt.close();
			conn.close();
		}
	%>

</body>
</html>