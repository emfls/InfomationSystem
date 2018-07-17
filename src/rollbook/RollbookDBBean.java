package rollbook;

import java.sql.*;
import java.util.ArrayList;

import dbconnect.Connect;
import regist.LectureData;

public class RollbookDBBean {
	
	private static RollbookDBBean instance = new RollbookDBBean();
	
	public static RollbookDBBean getInstance() {
		return instance;
	}
	
	private RollbookDBBean() {}
	
	public ArrayList<RollbookData> getRollbookinDB(String sql)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<RollbookData> list=new ArrayList<RollbookData>();
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sql);

			while(rs.next()) {
				RollbookData data=new RollbookData();
				data.setCname(rs.getString("cname"));
				data.setDname(rs.getString("dname"));
				data.setStuNum(rs.getInt("stunum"));
				data.setName(rs.getString("name"));
				data.setS1(rs.getString("s1"));
				data.setS2(rs.getString("s2"));
				data.setS3(rs.getString("s3"));
				data.setS4(rs.getString("s4")); 
				data.setS5(rs.getString("s5"));
				data.setS6(rs.getString("s6"));
				data.setS7(rs.getString("s7"));
				data.setS8(rs.getString("s8"));
				data.setS9(rs.getString("s9"));
				data.setS10(rs.getString("s10"));
				data.setS11(rs.getString("s11"));
				data.setS12(rs.getString("s12"));
				data.setS13(rs.getString("s13"));
				data.setS14(rs.getString("s14"));
				data.setS15(rs.getString("s15"));
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
	
	public String getLectureList(String sql) {
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
	
	public ArrayList<String> getRollbookProfessorData(String sql)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<String> list=new ArrayList<String>();
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sql);

			while(rs.next()) {
				String checkdata=null;
				checkdata=rs.getString("dname") + "," + rs.getInt("stunum") + "," + rs.getString("name") + "," + rs.getString("s1")
				+ "," + rs.getString("s2")+ "," + rs.getString("s3")+ "," + rs.getString("s4")+ "," + rs.getString("s5")+ "," + rs.getString("s6")
				+ "," + rs.getString("s7")+ "," + rs.getString("s8")+ "," + rs.getString("s9")+ "," + rs.getString("s10")+ "," + rs.getString("s11")
				+ "," + rs.getString("s12")+ "," + rs.getString("s13")+ "," + rs.getString("s14")+ "," + rs.getString("s15");
				list.add(checkdata);
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
	
	public void saveCheckingInDB(String sql)
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

}
