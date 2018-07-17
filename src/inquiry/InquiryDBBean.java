package inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconnect.Connect;

public class InquiryDBBean {
	
	private static InquiryDBBean instance = new InquiryDBBean();
	
	public static InquiryDBBean getInstance() {
		return instance;
	}
	
	private InquiryDBBean() {}
	
	public StudentData getStudentData(String stuNum)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudentData student = new StudentData();
		
		try{
			conn = Connect.getConnection();
			            
			pstmt = conn.prepareStatement("select stunum, name, address, birth, picture, professor, year, passwd, tel, staus, email, dname from student join department on student.dcode=department.dcode where student.stunum=?");
			pstmt.setString(1, stuNum);
			rs= pstmt.executeQuery();

			if(rs.next()){
				student.setStunum(rs.getInt("stunum"));
				student.setName(rs.getString("name"));
				student.setAddress(rs.getString("address"));
				student.setBirth(rs.getString("birth"));
				student.setPicture(rs.getString("picture"));
				student.setProfessor(rs.getString("professor"));
				student.setYear(rs.getInt("year"));
				student.setTel(rs.getString("tel"));
				student.setStaus(rs.getString("staus"));
				student.setEmail(rs.getString("email"));
				student.setDepart(rs.getString("dname"));
				return student;
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return student;
	}
}
