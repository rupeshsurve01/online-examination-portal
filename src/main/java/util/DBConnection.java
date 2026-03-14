package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	private static String URL = "jdbc:mysql://localhost:3306/examnova";
	private static String USER = "root";
	private static String PASS = "rupeshmysql.com";
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(URL,USER,PASS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

}
