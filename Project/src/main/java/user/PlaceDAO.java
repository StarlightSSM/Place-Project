// ȸ�����Կ� �ʿ��� Ŭ���� ����
package user;

// util �κ��� �� �۵��ȵǴ� �� ���� ���ֹ���
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

public class PlaceDAO {
	private PlaceDTO placeDTO;
	private UserDAO userDAO;
	private UserDTO userDTO;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private String dbURL = "jdbc:mysql://localhost:3306/place_project?serverTimezone=Asia/Seoul&useSSL=false";
	private String dbID = "root";
	private String dbPassword = "inhatc";

	public int regist(int placeID, String placeName, String category, String maxPeople, String address,
			String addressDetail, String infoDetail, String imgUpload, String hourPerCost, String dayPerCost) {
		String SQL = "insert into place values (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			DriverManager.getConnection(dbURL, dbID, dbPassword);
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, placeName);
			pstmt.setString(3, category);
			pstmt.setString(4, maxPeople);
			pstmt.setString(5, address);
			pstmt.setString(6, addressDetail);
			pstmt.setString(7, infoDetail);
			pstmt.setString(8, imgUpload);
			pstmt.setString(9, hourPerCost);
			pstmt.setString(10, dayPerCost);
			pstmt.setString(11, getDate());
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

	// 작성된 장소 등록 id 값 가져오기 메소드
	public int getNext() {
		String SQL = "SELECT placeID FROM place ORDER BY placeID DESC";
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

	// 장소 수정 페이지 메소드
	/*public int updatePlace(int placeID, String placeName, String category, String maxPeople, String address,
			String addressDetail, String infoDetail, String imgUpload, String hourPerCost, String dayPerCost) {
		String sql = "UPDATE place SET placeName=?, category=?, maxPeople=?, address=?, addressDetail=?, infoDetail=?, imgUpload=?, hourPerCost=?, dayPerCost=? WHERE placeID=?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			DriverManager.getConnection(dbURL, dbID, dbPassword);
			pstmt.setString(1, placeName);
			pstmt.setString(2, category);
			pstmt.setString(3, maxPeople);
			pstmt.setString(4, address);
			pstmt.setString(5, addressDetail);
			pstmt.setString(6, infoDetail);
			pstmt.setString(7, imgUpload);
			pstmt.setString(8, hourPerCost);
			pstmt.setString(9, dayPerCost);
			pstmt.setInt(10, getNext());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}
	*/

	// 장소 정보를 조회하는 메서드
	public PlaceDTO getPlace(String placeID) {
		String sql = "select * from place where placeID = ?";
		PlaceDTO placeDTO = new PlaceDTO();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, placeID);

			UserDTO dto = null;
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new UserDTO();
				placeDTO.setPlaceID(rs.getInt("placeID"));
				placeDTO.setPlaceName(rs.getString("placeName"));
				placeDTO.setCategory(rs.getString("category"));
				placeDTO.setMaxPeople(rs.getString("maxPeople"));
				placeDTO.setAddress(rs.getString("address"));
				placeDTO.setAddressDetail(rs.getString("addressDetail"));
				placeDTO.setInfoDetail(rs.getString("infoDetail"));
				placeDTO.setImgUpload(rs.getString("imgUpload"));
				placeDTO.setHourPerCost(rs.getString("hourPerCost"));
				placeDTO.setDayPerCost(rs.getString("dayPerCost"));

				return placeDTO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 장소ID로 장소를 검색하는 메소드
    public PlaceDTO getPlaceByID(int placeID) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PlaceDTO place = null;

        try {
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            String sql = "SELECT * FROM place WHERE placeID = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, placeID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                place = new PlaceDTO();
                place.setPlaceID(rs.getInt("placeID"));
                place.setPlaceName(rs.getString("placeName"));
                place.setCategory(rs.getString("category"));
                place.setMaxPeople(rs.getString("maxPeople"));
                place.setAddress(rs.getString("address"));
                place.setAddressDetail(rs.getString("addressDetail"));
                place.setInfoDetail(rs.getString("infoDetail"));
                place.setImgUpload(rs.getString("imgUpload"));
                place.setHourPerCost(rs.getString("hourPerCost"));
                place.setDayPerCost(rs.getString("dayPerCost"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return place;
    }

    public ArrayList<PlaceDTO> getList(int pageNumber) throws SQLException {
        int pageSize = 10; // 페이지당 출력할 데이터 개수

        String SQL = "SELECT * FROM place LIMIT ? OFFSET ?";
        ArrayList<PlaceDTO> list = new ArrayList<PlaceDTO>();

        try {
        	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        	pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, pageSize); // 페이지당 데이터 개수 설정
            pstmt.setInt(2, (pageNumber - 1) * pageSize); // 페이지 번호에 따른 오프셋 설정
            rs = pstmt.executeQuery();

            while (rs.next()) {
                PlaceDTO place = new PlaceDTO();
                place.setPlaceID(rs.getInt(1));
                place.setPlaceName(rs.getString(2));
                place.setCategory(rs.getString(3));
                place.setMaxPeople(rs.getString(4));
                place.setAddress(rs.getString(5));
                place.setAddressDetail(rs.getString(6));
                place.setInfoDetail(rs.getString(7));
                place.setImgUpload(rs.getString(8));
                place.setHourPerCost(rs.getString(9));
                place.setDayPerCost(rs.getString(10));

                list.add(place);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public PlaceDTO getPlaceInfo(int placeID) throws SQLException {
        String SQL = "SELECT * FROM place WHERE placeID = ?";
        PlaceDTO place = null; // 먼저 null로 초기화
        try {
        	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        	pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, placeID);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                place = new PlaceDTO();
                place.setPlaceID(rs.getInt("placeID"));
                place.setPlaceName(rs.getString("placeName"));
                place.setCategory(rs.getString("category"));
                place.setMaxPeople(rs.getString("maxPeople"));
                place.setAddress(rs.getString("address"));
                place.setAddressDetail(rs.getString("addressDetail"));
                place.setInfoDetail(rs.getString("infoDetail"));
                place.setImgUpload(rs.getString("imgUpload"));
                place.setHourPerCost(rs.getString("hourPerCost"));
                place.setDayPerCost(rs.getString("dayPerCost"));
                return place;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; // 장소 정보가 없을 경우 null 반환
    }

 // 페이징 처리 메소드
 	public boolean nextPage(int pageNumber) {
 		String sql = "select * from place where placeID = ?";
 		try {
 			PlaceDTO dto = null;

 			dto = new PlaceDTO();
 			PreparedStatement pstmt = conn.prepareStatement(sql);
 			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
 			rs = pstmt.executeQuery();
 			if (rs.next()) {
 				return true;
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		return false;
 	}
	
    // 장소를 업데이트하는 메소드
    public void updatePlace(PlaceDTO place) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
        	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            String sql = "UPDATE place SET placeName = ?, category = ?, maxPeople = ?, address = ?, " +
                    "addressDetail = ?, infoDetail = ?, imgUpload = ?, hourPerCost = ?, dayPerCost = ? " +
                    "WHERE placeID = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, place.getPlaceName());
            stmt.setString(2, place.getCategory());
            stmt.setString(3, place.getMaxPeople());
            stmt.setString(4, place.getAddress());
            stmt.setString(5, place.getAddressDetail());
            stmt.setString(6, place.getInfoDetail());
            stmt.setString(7, place.getImgUpload());
            stmt.setString(8, place.getHourPerCost());
            stmt.setString(9, place.getDayPerCost());
            stmt.setInt(10, place.getPlaceID());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}