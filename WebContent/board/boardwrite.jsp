<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.net.URLEncoder" %>
<%
String lcode1 = request.getParameter("lcode");
int lcode = Integer.parseInt(lcode1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=utf-8"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css"/>
	<SCRIPT language = "javascript" SRC = "../include/script.js"></SCRIPT>		
	<TITLE>게시글 입력</TITLE>
	
	<SCRIPT type = "text/javascript">
	
	function CheckForm(form)
	{	
		if(!form.subject.value)
			{
				alert('게시판의 제목을 입력하세요.');
				form.subject.focus();
				return true;
			}
		if(!form.pass.value)
			{
				alert('패스워드를 입력하세요.');
				form.pass.focus();
				return true;
			}
		form.submit();
	}
	
	
	</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/boardstyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/homestyle.css">
</head>
<body>
<TABLE WIDTH=800 HEIGHT=150 BORDER=0 CELLSPACING=1 CELLPADDING=1	ALIGN=CENTER>
		<td width=200 align="left"><img src="../knutLogo.png" width="90px" height="90px"></td>
<td width=400 align="center"><h3 class="dashHeader" align="center">글작성</h3></td>
<td width=200>
</td>
	</TABLE>

<FORM NAME="boardwrite" METHOD=POST ACTION="boardwriteproc.jsp?lcode=<%=lcode%>">
<div class="container" style="border: 0px; overflow: auto">
<div class="dashboard-style">
	<table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px">


	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>제목</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="subject" SIZE=80>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>내용</B></TD>
		<TD WIDTH=500>
			<TEXTAREA NAME="content" COLS=100 ROWS=8></TEXTAREA>
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

<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD WIDTH=110 ALIGN=LEFT>
			
		</TD>
		<TD WIDTH=400 ALIGN=CENTER>		
			<input type=button value="저장" STYLE=CURSOR:HAND onClick="javascript:CheckForm(boardwrite)">&nbsp;&nbsp;
			<input type=button value="취소" STYLE=CURSOR:HAND onClick="javascript:location.replace('boardlist.jsp?lcode=<%=lcode %>')">
		</TD>
		<TD WIDTH=110 ALIGN=LEFT>&nbsp;</TD>   
	</TR>
	
</TABLE>

</body>
</html>