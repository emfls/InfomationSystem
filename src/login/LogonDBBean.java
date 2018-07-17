package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import dbconnect.*;

public class LogonDBBean {
	public final int STUDENT_USER=0;
	public final int PROFESSOR_USER=1;
	public final int ADMIN_USER=2;
	
	
    private static LogonDBBean instance = new LogonDBBean();
    
    public static LogonDBBean getInstance() {
        return instance;
    }
    
    private LogonDBBean() { }
	
	 
	public int userCheck(String id, String passwd, int userCheck) 
				throws Exception {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try{
			conn = Connect.getConnection();
			String sql=null;
			switch(userCheck) 
			{
			case STUDENT_USER:
				sql="select passwd from student where stunum = ?";
				break;
				
			case PROFESSOR_USER:
				sql="select passwd from professor where pronum = ?";
				break;
				
			case ADMIN_USER:
				sql="select passwd from admin where adminnum = ?";
				break;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();

			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(passwd))
					x = 1; //인증 성공
				else
					x = 0; //비밀번호 틀림
			}else
				x = -1;//해당 아이디 없음
						
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
		return x;
	}
	
	public String getUserName(String id, int userCheck) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userName = "";
		int x = -1;
		
		try{
			conn = Connect.getConnection();
			String sql=null;
			switch(userCheck) 
			{
			case STUDENT_USER:
				sql="select name from student where stunum = ?";
				break;
				
			case PROFESSOR_USER:
				sql="select pname from professor where pronum = ?";
				break;
				
			case ADMIN_USER:
				sql="select name from admin where adminnum = ?";
				break;
			}            
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();

			if(rs.next()){
				userName= rs.getString(1); 
				return userName;
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
		return userName;
	}
	
	public int getMessageCount(String id) {	//읽지않은 메세지 숫자 카운팅
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		
		try{
			conn = Connect.getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select count(*) from message where towho = ? and reading=0");
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();

			if(rs.next()){
				cnt= rs.getInt(1); 
				return cnt;
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
		return cnt;
	}
}