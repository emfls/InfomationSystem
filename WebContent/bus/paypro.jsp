<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dbconnect.*, java.sql.*" %>

<%
	String source=request.getParameter("sel1");	//출발지
	String dest=request.getParameter("sel2");	//목적지
	String time=request.getParameter("userSelect");	//출발시간
	String stunum=(String)session.getAttribute("stuNum");	//로그인할때 세션에 저장된 학번을 불러옴
	String[] bustime=time.split(":");	// 출발시간을 문자형식에서 integer형식으로 바꾸기위해 자름.
	int ctime=Integer.parseInt(bustime[0]);
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		conn = Connect.getConnection();
		pstmt=conn.prepareStatement("INSERT INTO `dbase`.`busreserve` (`stunum`, `source`, `destination`, `bustime`) VALUES ('"+stunum+"', '"+source+"', '"+dest+"', "+ctime+")");
		pstmt.executeUpdate();
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		if (pstmt != null) 
			try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) 
			try { conn.close(); } catch(SQLException ex) {}
	}
	
	out.println("<script>alert(\"예매가 완료되었습니다.\");  window.close();</script>");
%>