<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<%
	int lcode = Integer.parseInt(request.getParameter("lcode"));
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String id1 = (String) session.getAttribute("stuNum");
	int no = Integer.parseInt(request.getParameter("no"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK REL="stylesheet" type="text/css" href="../include/style.css" />
<script type="text/javascript">
	function CheckForm(form) {
		if (!form.pass.value) {
			alert('패스워드를 입력하세요.');
			form.pass.focus();
			return true;
		}
		form.submit();
	}
</script>
<title>Insert title here</title>
<link rel="stylesheet" href="../css/boardstyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/homestyle.css">
</head>
<body>
	<TABLE WIDTH=800 HEIGHT=150 BORDER=0 CELLSPACING=1 CELLPADDING=1	ALIGN=CENTER>
		<td width=200 align="left"><img src="../knutLogo.png" width="90px" height="90px"></td>
<td width=400 align="center"><h3 class="dashHeader" align="center">댓글삭제</h3></td>
<td width=200>
</td>
	</TABLE>

	<FORM NAME="boardreplydelete" METHOD=POST
		ACTION="boardreplydeleteproc.jsp?lcode=<%=lcode%>&bnum=<%=bnum%>&no=<%=no%>">

		<div class="container" style="border: 0px; overflow: auto">
<div class="dashboard-style">
	<table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px">

			<TR>
				<TD WIDTH=120 ALIGN=CENTER><B>패스워드</B></TD>
				<TD WIDTH=500><INPUT TYPE=PASSWORD NAME="pass" SIZE=20>
				</TD>
			</TR>

		</TABLE>
</div>
</div>
	</FORM>

	<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1
		ALIGN=CENTER>

		<TR ALIGN=CENTER>
			<TD><input type=button value="삭제"
				onClick="javascript:CheckForm(boardreplydelete)" STYLE="CURSOR: HAND">&nbsp;&nbsp;
				<input type=button value="취소"
				onClick="javascript:location.replace('boardreplycontent.jsp?lcode=<%=lcode%>&bnum=<%=bnum%>&no=<%=no %>')"
				STYLE="CURSOR: HAND"></TD>
		</TR>

	</TABLE>

</body>
</html>