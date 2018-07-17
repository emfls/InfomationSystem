<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*, dbconnect.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	int stuid = Integer.parseInt(request.getParameter("stuid"));
	int who = Integer.parseInt(request.getParameter("who"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	
	int TotalRecords = 0;

	//---------------------------------- 페이지 네비게이션에 필요한 변수 지정
	int CurrentPage = 0;
	int Number = 0;
	int TotalPages = 0;
	int TotalPageSets = 0;
	int CurrentPageSet = 0;
	
	String sql1="";
	String sql2="";
	String sql3="";

	//---------------------------------- 페이지의 크기와 페이지 집합의 크기 지정
	int PageRecords = 5;
	int PageSets = 5;

	//---------------------------------- 페이지 번호 전달이 없을 경우 페이지 번호의 지정
	if (request.getParameter("CurrentPage") == null) {
		CurrentPage = 1;
	} else {
		CurrentPage = Integer.parseInt(request.getParameter("CurrentPage"));
	}

	//---------------------------------- 페이지별 첫 레코드 인덱스 추출
	int FirstRecord = PageRecords * (CurrentPage - 1);

	try {
		//------------------------------- JDBC 설정

		conn = Connect.getConnection();
		//학생이 받은 메일은 mread가 0, 교수가 받은 메일은 mread가 1
		if(who==1){
			sql1 = "select subject,mdate,name,mnum, reading from message,student where student.stunum=message.fromwho and towho="+stuid+" and mread="+who+" LIMIT " + FirstRecord + " , " + PageRecords;
			sql2 = "select count(subject) from message where towho="+stuid;
			//sql3 = "select name from student,message where student.stunum=message.fromwho and message.towho="+stuid;
		}
		else{
			sql1 = "select subject,mdate,pname,mnum, reading from message,professor where professor.pronum=message.fromwho and towho="+stuid+" and mread="+who+" LIMIT " + FirstRecord + " , " + PageRecords;
			sql2 = "select count(subject) from message where towho="+stuid;
			//sql3 = "select pname from professor,message where professor.pronum=message.fromwho and message.towho="+stuid;
		}

		pstmt = conn.prepareStatement(sql1);
		rs1 = pstmt.executeQuery();
		
		pstmt = conn.prepareStatement(sql2);
		rs2 = pstmt.executeQuery();
		rs2.next();
		TotalRecords = rs2.getInt(1);

		//------------------------------- 페이지별 가상 시작번호 생성
		Number = TotalRecords - FirstRecord;
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<LINK REL="stylesheet" type="text/css" href="../include/style.css" />
<title>메일함</title>
<link rel="stylesheet" href="../css/boardstyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/homestyle.css">
</head>
<body>
<TABLE WIDTH=600 HEIGHT=150 BORDER=0 CELLSPACING=1 CELLPADDING=1>
<td width=200 align="center"><img src="../knutLogo.png" width="90px" height="90px"></td>
<td><h3 class="dashHeader" align="center">메일함</h3></td>
</table>

<div class="container" style="border: 0px; overflow: auto">
<div class="dashboard-style">
	<table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px">
		<TR ALIGN=CENTER>
			<TD WIDTH=70><B>보낸사람</B></TD>
			<TD WIDTH=370 align="left"><B>제목</B></TD>
			<TD WIDTH=70><B>수신시간</B></TD>
		</TR>
		<%
			while (rs1.next()) {
					String subject = rs1.getString("subject");
					String mdate = rs1.getString("mdate");
					String fromwho = rs1.getString(3);
					int mnum = rs1.getInt("mnum");
					int reading =rs1.getInt("reading");
		%>

		<TR>
			<TD WIDTH=45 ALIGN=CENTER><%=fromwho%></TD>
			<TD WIDTH=350 ALIGN=LEFT>
			<%if(reading==0){ %>
			<A HREF="mailcontent.jsp?stuid=<%=stuid %>&who=<%=who %>&mnum=<%=mnum%>" style="font-weight: bold;"><%=subject%></A>
			<%}else{ %>
			<A HREF="mailcontent.jsp?stuid=<%=stuid %>&who=<%=who %>&mnum=<%=mnum%>" style="color: gray;"><%=subject%></A>
			<%} %>
			</TD>
			<TD ALIGN=CENTER><%=mdate%></TD>
		</TR>

		<%
			Number--;
				}
		%>
	</TABLE>
</div>
</div>

		<TABLE WIDTH=600 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1
			ALIGN=CENTER>

			<TR>
				<TD ALIGN=LEFT WIDTH=200><input type=button value="메일쓰기"
					onClick="javascript:location.replace('mailwrite.jsp?stuid=<%=stuid %>&who=<%=who %>')"
					; STYLE="CURSOR: HAND"></TD>
				<TD WIDTH=200 ALIGN=CENTER>
					<%
						// ---------------------------- 전체 페이지 수, 전체 페이지집합의 수, 현재 페이지집합 번호 추출
							TotalPages = (int) Math.ceil((double) TotalRecords / PageRecords);
							TotalPageSets = (int) Math.ceil((double) TotalPages / PageSets);
							CurrentPageSet = (int) Math.ceil((double) CurrentPage / PageSets);

							//---------------------------- 네비게이션에서 사용할 이미지 지정 
							String bf_block = "<<";
							String bf_page = "<";
							String nxt_page = "&#62";
							String nxt_block = "&#62&#62";

							//---------------------------- 이전 페이지 집합으로의 링크 작성
							if (CurrentPageSet > 1) {
								int BeforePageSetLastPage = PageSets * (CurrentPageSet - 1);
								String retUrl = "maillist.jsp?CurrentPage=" + BeforePageSetLastPage + "&stuid=" + stuid + "&who=" + who;

								String click = "javascript:location.replace('" + retUrl + "')";
								out.println("<input type=button value=" + bf_block + " onClick=" + click + " STYLE=CURSOR:HAND>");
							} else {
								out.println("<input type=button value=" + bf_block + ">");
							}

							//---------------------------- 이전 페이지로의 링트 작성
							if (CurrentPage > 1) {
								int BeforePage = CurrentPage - 1;
								String retUrl = "maillist.jsp?CurrentPage=" + BeforePage + "&stuid=" + stuid + "&who=" + who;

								String click = "javascript:location.replace('" + retUrl + "')";
								out.println("<input type=button value=" + bf_page + " onClick=" + click + " STYLE=CURSOR:HAND>");
							} else {
								out.println("<input type=button value=" + bf_page + ">");
							}

							//---------------------------- 현재 페이지 집합에서 출력할 첫 패이지번호와 마지막 페이지번호 추출
							int FirstPage = PageSets * (CurrentPageSet - 1);
							int LastPage = PageSets * CurrentPageSet;

							if (CurrentPageSet == TotalPageSets) {
								LastPage = TotalPages;
							}

							//---------------------------- 현재 페이지 집합에서 페이지로의 링크 작성
							for (int i = FirstPage + 1; i <= LastPage; i++) {
								if (CurrentPage == i) {
									out.println("<B>" + i + "</B>");
								} else {
									String retUrl = "maillist.jsp?CurrentPage=" + i + "&stuid=" + stuid + "&who=" + who;
									out.println("<A HREF=" + retUrl + ">" + i + "</A>");
								}
							}

							//---------------------------- 다음 페이지로의 링크 작성
							if (TotalPages > CurrentPage) {
								int NextPage = CurrentPage + 1;
								String retUrl = "maillist.jsp?CurrentPage=" + NextPage + "&stuid=" + stuid + "&who=" + who;

								String click = "javascript:location.replace('" + retUrl + "')";
								out.println("<input type=button value=" + nxt_page + " onClick=" + click + " STYLE=CURSOR:HAND>");
							} else {
								out.println("<input type=button value=" + nxt_page + ">");
							}

							//---------------------------- 다음 페이지 집합으로의 링크 작성
							if (TotalPageSets > CurrentPageSet) {
								int NextPageSet = PageSets * CurrentPageSet + 1;
								String retUrl = "maillist.jsp?CurrentPage=" + NextPageSet + "&stuid=" + stuid + "&who=" + who;

								String click = "javascript:location.replace('" + retUrl + "')";
								out.println("<input type=button value=" + nxt_block + " onClick=" + click + " STYLE=CURSOR:HAND>");
							} else {
								out.println("<input type=button value=" + nxt_block + ">");
							}
					%>

			</TD>
		<td width=200>
		</td>
				</TR>

		</TABLE>
	<%
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rs1.close();
			rs2.close();
			pstmt.close();
			conn.close();
		}
	%>


</body>
</html>