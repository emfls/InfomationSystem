package regist;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;

import dbconnect.*;


public class LectureDBBean {
	
	
	private static LectureDBBean instance = new LectureDBBean();
	
	public static LectureDBBean getInstance() {
		return instance;
	}
	
	private LectureDBBean() {}
	
	public ArrayList<LectureData> getLectureinDB(String sql)
	{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<LectureData> list=new ArrayList<LectureData>();
		try{
			conn = Connect.getConnection();
			stmt=conn.createStatement();
			rs= stmt.executeQuery(sql);

			while(rs.next()) {
				LectureData data=new LectureData();
				data.setCname(rs.getString("cname"));
				data.setMajor(rs.getString("major"));
				data.setClassSize(rs.getInt("classsize"));
				data.setGrade(rs.getInt("grade"));
				data.setTime(rs.getString("time"));
				data.setLike(rs.getInt("slike"));
				data.setClassroom(rs.getString("classroom"));
				data.setLcode(rs.getInt("lcode"));
				data.setOpen(rs.getInt("open"));
				data.setCampus(rs.getString("campus"));
				data.setPname(rs.getString("pname"));
				data.setDname(rs.getString("dname"));
				data.setRegist(rs.getInt("regist"));
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
	
	public int getRegistCount(String lcode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int count=0;
		try {
			conn=Connect.getConnection();
			pstmt=conn.prepareStatement("select regist from lecture where lcode=?");
			pstmt.setString(1, lcode);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}

			return count;
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return count;
	}
	
	public int getMaxRegistCount(String lcode)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int count=0;
		try {
			conn=Connect.getConnection();
			pstmt=conn.prepareStatement("select classsize from lecture where lcode=?");
			pstmt.setString(1, lcode);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}

			return count;
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return count;
	}
	
	public void updataRegistCount(String lcode, boolean sw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count=getRegistCount(lcode);
		if(sw) {
			count++;
		}else {
			count--;
		}
		try {
			conn=Connect.getConnection();
			pstmt=conn.prepareStatement("update lecture set regist="+count+ " where lcode=" + lcode);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	public boolean[] makeIndexTable(String stunum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		boolean[] index=null;
		Schedule sch=new Schedule();
		
		
		try {
			index=new boolean[180];
			Arrays.fill(index,false);
			conn=Connect.getConnection();
			pstmt=conn.prepareStatement("select time from lecture l join registation r on l.lcode= r.lcode where stunum=?");
			pstmt.setString(1, stunum);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				String[] indexArr=sch.splitIndexforSchedule(rs.getString("time"));
				
				for(int i=0;i<indexArr.length;i++)
				{
						index[Integer.parseInt(indexArr[i])]=true;
				}
			}

			//return count;
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return index;
	}
	
	public String getTimeIndex(String lcode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String timeIndex=null;
		
		try {
			conn=Connect.getConnection();
			pstmt=conn.prepareStatement("select time from lecture where lcode=?");
			pstmt.setString(1, lcode);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				timeIndex=rs.getString("time");
			}

			return timeIndex;
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return timeIndex;
	}

}
