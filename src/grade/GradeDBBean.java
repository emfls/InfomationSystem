package grade;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dbconnect.Connect;

public class GradeDBBean {

	private static GradeDBBean instance = new GradeDBBean();
	
	public static GradeDBBean getInstance() {
		return instance;
	}
	
	private GradeDBBean() {}
	
	public ArrayList<GradeData> getGradeinDB(String sql) 
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<GradeData> list=new ArrayList<GradeData>();
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sql);

			while(rs.next()) {
				GradeData data=new GradeData();
				data.setCname(rs.getString("cname"));
				data.setMajor(rs.getString("major"));
				data.setPname(rs.getString("pname"));
				data.setGrade(rs.getInt("grade"));
				data.setGradenum(rs.getFloat("gradenum"));
				list.add(data);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {

			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (stmt != null) 
				try { stmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}

		}
		return list;
	}
	
	public ArrayList<String> getGradeProfessorData(String sql)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<String> list=new ArrayList<String>();
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sql);
			GradeHandler hd=new GradeHandler();
			while(rs.next()) {
				String gradedata=null;
				gradedata=rs.getString("dname")+","+rs.getInt("stunum") +","+rs.getString("name")+","+rs.getInt("score")+","+hd.gradenumToGrade(rs.getFloat("gradenum"));
				list.add(gradedata);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {

			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (stmt != null) 
				try { stmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}

		}
		return list;
	}
	
	public int changeCnameToLcode(String className) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int lcode=0;
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery("select lcode from lecture where cname=\""+className+"\"");

			if(rs.next()) {
				lcode=rs.getInt(1);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {

			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (stmt != null) 
				try { stmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}

		}
		return lcode;
	}
	
	public void saveGradeInDB(String sql)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = Connect.getConnection();
			pstmt=conn.prepareStatement(sql);
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
	}

}
