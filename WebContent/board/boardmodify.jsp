<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.*, dbconnect.*" %>

<%
	
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	int lcode = Integer.parseInt(request.getParameter("lcode"));

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try
	{

		conn = Connect.getConnection();
		
		String Query1 = "SELECT subject,content FROM board WHERE bnum = ?";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1, bnum);
		
		rs = pstmt.executeQuery();
		rs.next();
		
		String subject = rs.getString(1);
		String content = rs.getString(2);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK REL="stylesheet" type="text/css" href="../include/style.css"/>
<title>Insert title here</title>
<SCRIPT type = "text/javascript">
	
	function CheckForm(form)
	{
		if(!form.pass.value)
			{
				alert('패스워드를 입력하세요.');
				form.pass.focus();
				return true;
			}
		
		form.submit();
	}
	</SCRIPT>
<link rel="stylesheet" href="../css/boardstyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/homestyle.css">
</head>
<body>
<TABLE WIDTH=800 HEIGHT=150 BORDER=0 CELLSPACING=1 CELLPADDING=1	ALIGN=CENTER>
		<td width=200 align="left"><img src="../knutLogo.png" width="90px" height="90px"></td>
<td width=400 align="center"><h3 class="dashHeader" align="center">글수정</h3></td>
<td width=200>
</td>
	</TABLE>
<FORM NAME="boardmodify" METHOD=POST ACTION="boardmodifyproc.jsp?lcode=<%=lcode %>&bnum=<%=bnum %>">

<div class="container" style="border: 0px; overflow: auto">
<div class="dashboard-style">
	<table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px">
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>제목</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="subject" SIZE=80 style="ime-mode:inactive" VALUE='<%=subject%>'>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>내용</B></TD>
		<TD WIDTH=500>
			<TEXTAREA NAME="content" COLS=100 ROWS=5><%=content %></TEXTAREA>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>패스워드</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=PASSWORD NAME="pass" SIZE=20>
		</TD>
	</TR>
	
</TABLE>
</div>
</div>

</FORM>

<%
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	finally
	{
		rs.close();
		pstmt.close();
		conn.close();
	}
%>

<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD>
			<input type=button value="수정" onClick="javascript:CheckForm(boardmodify)" STYLE=CURSOR:HAND>&nbsp;&nbsp;
			<input type=button value="취소" onClick="javascript:location.replace('boardcontent.jsp?lcode=<%=lcode %>&bnum=<%=bnum %>')" STYLE=CURSOR:HAND>
		</TD>
	</TR>
	
</TABLE>


</body>
</html>