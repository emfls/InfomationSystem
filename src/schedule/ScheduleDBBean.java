package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconnect.Connect;

public class ScheduleDBBean {

	private static ScheduleDBBean instance = new ScheduleDBBean();
	
	public static ScheduleDBBean getInstance() {
		return instance;
	}
	
	private ScheduleDBBean() {}
	
	public ArrayList<StudentData> getStudentData(String stuNum)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<StudentData> list = new ArrayList<StudentData>();
		
		try{
			conn = Connect.getConnection();
			            
			pstmt = conn.prepareStatement("select professor.pname, "
					+ "lecture.cname, lecture.classroom, lecture.time, "
					+ "registation.year, registation.quarter, student.name "
					+ "from lecture join professor join registation join student "
					+ "on lecture.pronum=professor.pronum "
					+ "and registation.lcode=lecture.lcode "
					+ "and registation.stunum=student.stunum "
					+ "where registation.stunum=?");
			pstmt.setString(1, stuNum);
			rs= pstmt.executeQuery();

			while(rs.next()){
				StudentData student = new StudentData();
				student.setPName(rs.getString("pname"));
				student.setCName(rs.getString("cname"));
				student.setClassroom(rs.getString("classroom"));
				student.setTime(rs.getString("time"));
				student.setYear(rs.getInt("year"));
				student.setQuarter(rs.getInt("quarter"));
				student.setName(rs.getString("name"));
				list.add(student);
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
		
		return list;
	}
}
