<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*, dbconnect.*"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%
	request.setCharacterEncoding("utf-8");
%>

<%

	String name = (String) session.getAttribute("name");
	int lcode = Integer.parseInt(request.getParameter("lcode"));
	//int lcode = 1000;

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

		String sql1 = "select cname,blike,bhate,bnum,subject,wdate,look,content,blevel from board,lecture where lecture.lcode=board.lcode and board.lcode="
				+ lcode + " order by grpnum desc, border asc LIMIT " + FirstRecord + " , " + PageRecords;
		String sql2 = "select count(bnum),cname,count(if(blike=1,blike,null)),count(if(bhate=1,bhate,null)) from board,lecture where lecture.lcode=board.lcode and board.lcode="+ lcode;

		pstmt = conn.prepareStatement(sql1);
		rs1 = pstmt.executeQuery();
		pstmt = conn.prepareStatement(sql2);
		rs2 = pstmt.executeQuery();

		rs2.next();
		TotalRecords = rs2.getInt(1);
		String cname = rs2.getString(2);
		int blike = rs2.getInt(3);
		int bhate = rs2.getInt(4);

		//------------------------------- 페이지별 가상 시작번호 생성
		Number = TotalRecords - FirstRecord;
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
<td width=400 align="center"><h3 class="dashHeader" align="center"><%=cname %>의 게시판</h3></td>
<td width=200>
</td>
	</TABLE>
<div class="container" style="border: 0px; overflow: auto">
<div class="dashboard-style">
	<table class="table table-striped padding " style="table-layout:fixed; margin-bottom: 0px">

		<TR ALIGN=CENTER>
			<TD WIDTH=45><B>번호</B></TD>
			<TD WIDTH=395><B>제목</B></TD>
			<TD WIDTH=70><B>작성일</B></TD>
			<TD WIDTH=45><B>조회수</B></TD>
		</TR>

		<%
			while (rs1.next()) {
					//String cname = rs1.getString("cname");
					//int blike = rs1.getInt("blike");
					//int bhate = rs1.getInt("bhate");
					int bnum = rs1.getInt("bnum");
					String subject = rs1.getString("subject");
					String wdate = rs1.getString("wdate");
					int look = rs1.getInt("look");
					String content = rs1.getString("content");
					int blevel = rs1.getInt("blevel");
		%>

		<TR>
			<TD WIDTH=45 ALIGN=CENTER><%=Number%></TD>
			<TD WIDTH=350 ALIGN=LEFT>
				<%
					for (int i = 0; i < blevel; i++) {
								out.println("&nbsp;&nbsp;");
							}
							if (blevel > 0) {
								out.println("[RE]");
							}
				%> <A HREF="boardcontent.jsp?lcode=<%=lcode%>&bnum=<%=bnum%>"><%=subject%></A>
			</TD>
			<TD ALIGN=CENTER><%=wdate%></TD>
			<TD ALIGN=CENTER><%=look%></TD>
		</TR>

		<%
			Number--;
				}
		%>
	</TABLE>
</div>
</div>
		<TABLE WIDTH=800 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1
			ALIGN=CENTER>

			<TR>
				<TD width=200 align=left><input type=button value="글쓰기"
					onClick="javascript:location.replace('boardwrite.jsp?lcode=<%=lcode%>')"
					; STYLE="CURSOR: HAND"></TD>
				<TD width=400 align=center>
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
								String retUrl = "boardlist.jsp?CurrentPage=" + BeforePageSetLastPage + "&lcode=" + lcode;

								String click = "javascript:location.replace('" + retUrl + "')";
								out.println("<input type=button value=" + bf_block + " onClick=" + click + " STYLE=CURSOR:HAND>");
							} else {
								out.println("<input type=button value=" + bf_block + ">");
							}

							//---------------------------- 이전 페이지로의 링트 작성
							if (CurrentPage > 1) {
								int BeforePage = CurrentPage - 1;
								String retUrl = "boardlist.jsp?CurrentPage=" + BeforePage + "&lcode=" + lcode;

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
									String retUrl = "boardlist.jsp?CurrentPage=" + i + "&lcode=" + lcode;
									out.println("<A HREF=" + retUrl + ">" + i + "</A>");
								}
							}

							//---------------------------- 다음 페이지로의 링크 작성
							if (TotalPages > CurrentPage) {
								int NextPage = CurrentPage + 1;
								String retUrl = "boardlist.jsp?CurrentPage=" + NextPage + "&lcode=" + lcode;

								String click = "javascript:location.replace('" + retUrl + "')";
								out.println("<input type=button value=" + nxt_page + " onClick=" + click + " STYLE=CURSOR:HAND>");
							} else {
								out.println("<input type=button value=" + nxt_page + ">");
							}

							//---------------------------- 다음 페이지 집합으로의 링크 작성
							if (TotalPageSets > CurrentPageSet) {
								int NextPageSet = PageSets * CurrentPageSet + 1;
								String retUrl = "boardlist.jsp?CurrentPage=" + NextPageSet + "&lcode=" + lcode;

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
			rs2.close();
			rs1.close();
			pstmt.close();
			conn.close();
		}
	%>


</body>
</html>