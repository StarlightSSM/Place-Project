// ȸ�����Կ� �ʿ��� Ŭ���� ����
package user;

// util �κ��� �� �۵��ȵǴ� �� ���� ���ֹ���
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Sign_upDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private String dbURL = "jdbc:mysql://localhost:3306/place_project?serverTimezone=Asia/Seoul&useSSL=false";
	private String dbID="root";
	private String dbPassword = "inhatc";
	
	public int join(String name, String email, String phone, String pw) {
		String SQL = "insert into user values(?,?,?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			DriverManager.getConnection(dbURL, dbID, dbPassword);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			pstmt.setString(4, pw);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}