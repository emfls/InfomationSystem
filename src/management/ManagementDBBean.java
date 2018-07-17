package management;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dbconnect.Connect;
import rollbook.RollbookDBBean;

public class ManagementDBBean {
	private static ManagementDBBean instance = new ManagementDBBean();
	
	public static ManagementDBBean getInstance() {
		return instance;
	}
	
	public String getClassList(String sql) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String list=null;
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sql);
			int count=0;


			while(rs.next()) {
				if(count<1) {
					list=rs.getString(1);
				}else {
					list=list + ","+rs.getString(1);
				}
				count++;
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
	
	public ArrayList<ProfessorListData> getProfessorManagementList(String sql)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<ProfessorListData> list=new ArrayList<ProfessorListData>();
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sql);

			while(rs.next()) {
				ProfessorListData professordata=new ProfessorListData();
				professordata.setProfessorNumber(rs.getInt("pronum"));
				professordata.setDepartmentName(rs.getString("dname"));
				professordata.setProfessorName(rs.getString("pname"));
				professordata.setLab(rs.getString("lab"));
				professordata.setTel(rs.getString("tel"));
				list.add(professordata);
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
	
	public ArrayList<StudentListData> getStudentManagementList(String sql)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<StudentListData> list=new ArrayList<StudentListData>();
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sql);

			while(rs.next()) {
				StudentListData studentdata=new StudentListData();
				studentdata.setStunum(rs.getInt("stunum"));
				studentdata.setDname(rs.getString("dname"));
				studentdata.setName(rs.getString("name"));
				studentdata.setBirth(rs.getString("birth"));
				studentdata.setTel(rs.getString("tel"));
				list.add(studentdata);
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
	
	public ArrayList<DepartmentData> getDepartmentData(String sql)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<DepartmentData> list=new ArrayList<DepartmentData>();
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sql);

			while(rs.next()) {
				DepartmentData data=new DepartmentData();
				data.setDcode(rs.getInt("dcode"));
				data.setDname(rs.getString("dname"));
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
	
	public void registDB(String sql)
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
	
	public int getDcode(String dname) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int dcode=0;
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery("select dcode from department where dname ='"+dname+"'");

			if(rs.next()) {
				dcode=rs.getInt("dcode");
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
		return dcode;
	
	}
	
	public String getDname(int dcode) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String dname=null;
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery("select dname from department where dcode ='"+dcode+"'");

			if(rs.next()) {
				dname=rs.getString("dname");
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
		return dname;
	}
	
	public int getPronum(String pname) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int pronum=0;
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery("select pronum from professor where pname ='"+pname+"'");

			if(rs.next()) {
				pronum=rs.getInt("pronum");
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
		return pronum;
	
	}
	
	public StudentRegistData getStudentModifyList(String sql)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		StudentRegistData studentdata=new StudentRegistData();
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sql);

			if(rs.next()) {
				
				studentdata.setStunum(rs.getInt("stunum"));
				studentdata.setName(rs.getString("name"));
				studentdata.setAddress(rs.getString("address"));
				studentdata.setBirth(rs.getString("birth"));
				studentdata.setProfessor(rs.getString("professor"));
				studentdata.setYear(rs.getInt("year"));
				studentdata.setPasswd(rs.getString("passwd"));
				studentdata.setTel(rs.getString("tel"));
				studentdata.setStatus(rs.getString("staus"));
				studentdata.setEmail(rs.getString("email"));
				studentdata.setDcode(rs.getInt("dcode"));
				
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
		return studentdata;
	}

}
