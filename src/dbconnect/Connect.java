package dbconnect;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Connect {
	
	
	public static Connection getConnection() throws Exception {
		 Context init = new InitialContext();
	    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/dbase");
	   

	    return  ds.getConnection();
	}
	
}
