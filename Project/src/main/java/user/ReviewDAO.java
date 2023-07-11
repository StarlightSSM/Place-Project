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

public class ReviewDAO {

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

    public int insertReview(int reviewID, String writer, String content) {
        String SQL = "INSERT INTO review values(?, ?, ?, ?)";

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			DriverManager.getConnection(dbURL, dbID, dbPassword);
			pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, writer);
            pstmt.setString(3, content);
            pstmt.setString(4, getDate());

            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int getNext() {
		String SQL = "SELECT reviewID FROM review ORDER BY reviewID DESC";
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
 	
 	// 사용자가 작성한 리뷰 내역을 가져오는 메소드
    public List<ReviewDTO> getReviewListByWriter(String writer) {
        List<ReviewDTO> reviewList = new ArrayList<>();
        UserDTO userDTO = new UserDTO();
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			DriverManager.getConnection(dbURL, dbID, dbPassword);
            // 사용자 이름을 기준으로 user 테이블에서 사용자 정보 검색
            String userQuery = "SELECT * FROM user WHERE email = ?";
            PreparedStatement pstmt = conn.prepareStatement(userQuery);
            pstmt.setString(1, writer);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String email = rs.getString("email");

                // 해당 사용자가 작성한 리뷰 내역을 가져오는 쿼리 실행
                String reviewQuery = "SELECT * FROM review WHERE writer = ?";
                pstmt = conn.prepareStatement(reviewQuery);
                pstmt.setString(1, email);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    // 리뷰 정보를 ReviewDTO 객체에 저장
                    int reviewID = rs.getInt("reviewID");
                    String content = rs.getString("content");
                    String writeDate = rs.getString("writeDate");

                    ReviewDTO review = new ReviewDTO();
                    review.setReviewID(reviewID);
                    review.setWriter(writer);
                    review.setContent(content);
                    review.setWriteDate(writeDate);

                    // 리뷰 리스트에 추가
                    reviewList.add(review);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return reviewList;
    }
}
