package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DatabaseUtil {

	// 멤버 변수
		private static Connection conn;
		private static PreparedStatement pstmt;
		private static ResultSet rs;
		
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/place_project?serverTimezone=Asia/Seoul";
			String dbID="root";
			String dbPassword="inhatc";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			System.out.println(conn + "\n\n\n\n\n\nTEST\n\n\n\n\n");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
