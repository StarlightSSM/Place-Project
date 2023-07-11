package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

public class ReservationDAO {
	private PlaceDTO placeDTO;
	private PlaceDAO placeDAO;
	private UserDAO userDAO;
	private UserDTO userDTO;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private String dbURL = "jdbc:mysql://localhost:3306/place_project?serverTimezone=Asia/Seoul&useSSL=false";
	private String dbID = "root";
	private String dbPassword = "inhatc";

	public int makeReserve(String placeID, String reserverName, String placeName, String reserveDate, int payment,
			String Check_in_Day, String Check_out_Day, String Check_in_Time, String Check_out_Time, String people)
			throws SQLException {
		// SQL 쿼리문 생성
		String SQL = "insert into reservation values (?,?,?,?,?,?,?,?,?,?,?,?)";
		PlaceDTO placeDTO = new PlaceDTO();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			DriverManager.getConnection(dbURL, dbID, dbPassword);
			pstmt = conn.prepareStatement(SQL);
			// PreparedStatement에 입력값 설정
			pstmt.setInt(1, getNext());
			pstmt.setString(2, placeID);
			pstmt.setString(3, reserverName);
			pstmt.setString(4, placeName);
			pstmt.setString(5, reserveDate);
			pstmt.setInt(6, payment);
			pstmt.setString(7, Check_in_Day);
			pstmt.setString(8, Check_out_Day);
			pstmt.setString(9, Check_in_Time);
			pstmt.setString(10, Check_out_Time);
			pstmt.setString(11, people);
			pstmt.setString(12, getDate());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 장소 등록에서 date 값 가져오기 메소드
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	// 예약 등록 id 값 가져오기 메소드
	public int getNext() {
		String SQL = "SELECT reservationID FROM reservation ORDER BY reservationID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<ReservationDTO> getReservationList(String reserverName) throws SQLException {
		String SQL = "SELECT r.reservationID, r.placeID, r.reserverName, r.reserveDate, r.payment, r.Check_in_Day, r.Check_out_Day, r.Check_in_Time, r.Check_out_Time, r.people, p.placeName " +
	             "FROM reservation r " +
	             "JOIN user u ON r.reserverName = u.email COLLATE utf8mb3_unicode_ci " +
	             "JOIN `place` p ON r.placeID = p.placeID " +
	             "WHERE r.reserverName = ?";
		
    	PlaceDTO placeDTO = new PlaceDTO();
	    ArrayList<ReservationDTO> reservationList = new ArrayList<>();
	    try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			DriverManager.getConnection(dbURL, dbID, dbPassword);
	        PreparedStatement stmt = conn.prepareStatement(SQL);
	        stmt.setString(1, reserverName);
	        ResultSet rs = stmt.executeQuery();
	        
	        while (rs.next()) {
	            ReservationDTO reservation = new ReservationDTO();
	            reservation.setReservationID(rs.getInt("reservationID"));
	            reservation.setPlaceID(rs.getString("placeID"));
	            reservation.setReserverName(rs.getString("reserverName"));
	            reservation.setPlaceName(rs.getString("placeName"));
	            reservation.setReserveDate(rs.getString("reserveDate"));
	            reservation.setPayment(rs.getInt("payment"));
	            reservation.setCheck_in_Day(rs.getString("Check_in_Day"));
	            reservation.setCheck_out_Day(rs.getString("Check_out_Day"));
	            reservation.setCheck_in_Time(rs.getString("Check_in_Time"));
	            reservation.setCheck_out_Time(rs.getString("Check_out_Time"));
	            reservation.setPeople(rs.getString("people"));
	            
	            reservationList.add(reservation);
	        }
	    }  catch (Exception e) {
			e.printStackTrace();
		}
	    return reservationList;
	}

}
