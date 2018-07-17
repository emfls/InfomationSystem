<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, dbconnect.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String stunum=(String)session.getAttribute("stuNum");
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		conn = Connect.getConnection();
		pstmt=conn.prepareStatement("UPDATE `dbase`.`student` SET `address`='"+address+"', `tel`='"+tel+"', `email`='"+email+"' WHERE `stunum`='"+stunum+"'");
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
	

    	out.println("<script>alert(\"수정이 완료되었습니다.\"); history.go(-1); </script>");

%>