<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, dbconnect.*" %>
<%
request.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html;charset=UTF-8");
String buscode=request.getParameter("buscode");

Connection conn = null;
PreparedStatement pstmt = null;

try {
	conn = Connect.getConnection();
	pstmt=conn.prepareStatement("DELETE FROM `dbase`.`busreserve` WHERE `reservecode`=?");
	pstmt.setString(1, buscode);
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

out.println("<script>alert(\"예약이 취소되었습니다.\"); opener.parent.location.reload();  window.close();</script>");
%>