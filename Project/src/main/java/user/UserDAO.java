package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	public static UserDAO instance = null;

	// 멤버 변수
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		System.out.println("Connecting to databses...");
		String dbURL = "jdbc:mysql://localhost:3306/place_project?serverTimezone=Asia/Seoul&useSSL=false";
//		Connection conn;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbID = "root";
			String dbPassword = "inhatc";
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("DB연결 성공!");
		} catch (Exception e) {
			System.out.println("DB Error");
			e.printStackTrace();
		}
	}

	public static UserDAO getInstance() {
		if (instance == null) {
			instance = new UserDAO();
		}
		return instance;
	}

	// login 메서드
	public int login(String email, String password) {
		String SQL = "select pw from user where email = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(password)) {
					return 1;// 로그인성공
				} else
					return 0; // 비밀번호 불일치
			}
			return -1; // 이메일이 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}

	// 회원정보를 조회하는 메서드
		public UserDTO getUser(String email) {
			UserDTO dto = null;

			String sql = "select * from user where email = ?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					dto = new UserDTO();

					dto.setEmail(email);
					dto.setName(rs.getString("name"));
					dto.setPhone(rs.getString("phone"));
					dto.setPassword(rs.getString("pw"));

					return dto;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("return: -1");
			return null;
		}
		
	/*
	 * // 회원정보를 조회하는 메서드 public UserDTO getUser(String email) { UserDTO dto = null;
	 * String sql = "select * from user where email = ?";
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1, email);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * if (rs.next()) { dto = new UserDTO();
	 * 
	 * dto.setEmail(email); dto.setPassword(rs.getString("pw"));
	 * dto.setName(rs.getString("name")); dto.setPhone(rs.getString("phone"));
	 * 
	 * return dto; } } catch (Exception e) { e.printStackTrace(); }
	 * System.out.println("return: -1"); return null; }
	 * 
	 * // update 메서드 public int update(String password, String name, String email) {
	 * String sql = "update user set pw = ?, name = ?, birth = ? where email = ?";
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setString(1, password);
	 * pstmt.setString(2, name); pstmt.setString(3, email); pstmt.executeUpdate();
	 * return 0; } catch (Exception e) { e.printStackTrace(); } return -1; }
	 * 
	 * // update 메서드 public int updateProfile(String name, String phone, String
	 * w_intro, String email) { String sql =
	 * "update user set name = ?, phone = ?, w_intro = ? where email = ?"; try {
	 * pstmt = conn.prepareStatement(sql); pstmt.setString(1, name);
	 * pstmt.setString(2, phone); pstmt.setString(3, w_intro); pstmt.setString(4,
	 * email); System.out.println(name); pstmt.executeUpdate(); return 0; } catch
	 * (Exception e) { e.printStackTrace(); } return -1; }
	 */

	// update 메서드
	public int updateImg(String imgUpload, String userName) {
		String sql = "update place set imgUpload = ? where userName = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, imgUpload);
			pstmt.setString(2, userName);
			System.out.println(userName);
			pstmt.executeUpdate();
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public String findUserNameByEmail(String email) {
		String name = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String query = "SELECT name FROM user WHERE email = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	
	public String getHiddenPassword(String password) {
	    int visibleLength = 4; // 가려지지 않을 글자 수
	    int hiddenLength = password.length() - visibleLength; // 가려질 글자 수
	    String hiddenPassword = "*".repeat(hiddenLength) + password.substring(password.length() - visibleLength);
	    return hiddenPassword;
	}
}


/*
 * // delete 메서드 public int delete(String email) { String sql =
 * "delete from user where email = ?"; try { pstmt = conn.prepareStatement(sql);
 * pstmt.setString(1, email); return pstmt.executeUpdate(); } catch (Exception
 * e) { e.printStackTrace(); } return -1; }
 * 
 * 
 * 프로필이미지 부분 public int Profile(String email, String userProfile) { Connection
 * conn=null; PreparedStatement pstmt =null; String sql =
 * "update user set userProfile = ? where email = ?"; try { conn =
 * DriverManager.getConnection("jdbc:mysql://localhost/USER", "root",
 * "202144097!"); pstmt = conn.prepareStatement(sql); pstmt.setString(1,
 * userProfile); pstmt.setString(2, email); return pstmt.executeUpdate(); }
 * catch (Exception e) { e.printStackTrace(); }finally { try {
 * if(pstmt!=null)pstmt.close(); if(conn!=null)conn.close(); }catch (Exception
 * e) { e.printStackTrace(); } } return -1;
 * 
 * }
 */
