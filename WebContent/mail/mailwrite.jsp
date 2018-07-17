<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.net.URLEncoder" %>
    <%@ page import="java.sql.*,dbconnect.*"%>
<%
int stuid = Integer.parseInt(request.getParameter("stuid"));
int who = Integer.parseInt(request.getParameter("who"));

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs1 = null;
String sql1;

try {
	//------------------------------- JDBC 설정

	conn = Connect.getConnection();
	//학생이 받은 메일은 mread가 0, 교수가 받은 메일은 mread가 1
	if(who==1){
		sql1 = "select distinct name,student.stunum from student,lecture,registation where lecture.lcode=registation.lcode and registation.stunum=student.stunum and lecture.pronum="+stuid;
	}
	else{
		sql1 = "select distinct pname,professor.pronum from professor,lecture,registation where lecture.lcode=registation.lcode and professor.pronum=lecture.pronum and registation.stunum="+stuid;
	}

	pstmt = conn.prepareStatement(sql1);
	rs1 = pstmt.executeQuery();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=utf-8"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css"/>
	<SCRIPT language = "javascript" SRC = "../include/script.js"></SCRIPT>		
	<TITLE>게시판</TITLE>
	
	<SCRIPT type = "text/javascript">
	
	function CheckForm(form)
	{	
		if(!form.subject.value)
			{
				alert('메일의 제목을 입력하세요.');
				form.subject.focus();
				return true;
			}
		form.submit();
	}
	
	
	</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>메일함</title>
<link rel="stylesheet" href="../css/boardstyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/homestyle.css">
</head>
<body>
<TABLE WIDTH=600 HEIGHT=150 BORDER=0 CELLSPACING=1 CELLPADDING=1>
<td width=200 align="center"><img src="../knutLogo.png" width="90px" height="90px"></td>
<td><h3 class="dashHeader" align="center">메일작성</h3></td>
</table>
<div class="container" style="border: 0px; overflow: auto">
<div class="dashboard-style">
<FORM NAME="mailwrite" METHOD=POST ACTION="mailwriteproc.jsp?stuid=<%=stuid%>&who=<%=who%>">

<table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px">

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>보낼사람</B></TD>
		<TD WIDTH=500>
			<select name="to">
				<option value="">보낼사람 선택 </option>
				<%
					while(rs1.next()){
						String name = rs1.getString(1);
						int num = rs1.getInt(2);
				%>
				<option value="<%=num%>"><%=name%></option>
				<%
					}
				%>
            </select>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>제목</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="subject" SIZE=50>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>내용</B></TD>
		<TD WIDTH=500>
			<TEXTAREA NAME="content" COLS=70 ROWS=8></TEXTAREA>
		</TD>
	</TR>
	
</TABLE>

</FORM>
</div>
</div>
<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD WIDTH=110 ALIGN=LEFT>
			<input type=button value="목록" onClick="javascript:location.replace('maillist.jsp?stuid=<%=stuid %>&who=<%=who%>')" STYLE=CURSOR:HAND>
		</TD>
		<TD WIDTH=400 ALIGN=CENTER>		
			<input type=button value="전송" STYLE=CURSOR:HAND onClick="javascript:CheckForm(mailwrite)">&nbsp;&nbsp;
			<input type=button value="취소" STYLE=CURSOR:HAND onClick="javascript:location.replace('maillist.jsp?stuid=<%=stuid %>&who=<%=who%>')">
		</TD>
		<TD WIDTH=110 ALIGN=LEFT>&nbsp;</TD>   
	</TR>
	
</TABLE>
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