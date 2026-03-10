package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	private static String URL = "jdbc:mysql://localhost:3306/exam_portal";
	private static String USER = "root";
	private static String PASS = "";
	
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
