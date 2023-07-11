package user;

import java.util.Date;

public class ReservationDTO {
	private int reservationID;
	private String placeID;
	private String reserverName;
	private String placeName;
	private String reserveDate;
	private int payment;
	private String Check_in_Day;
	private String Check_out_Day;
	private String Check_in_Time;
	private String Check_out_Time;
	private String people;
	private Date regdate;
	
	public ReservationDTO() {
		
	}

	public int getReservationID() {
		return reservationID;
	}

	public void setReservationID(int reservationID) {
		this.reservationID = reservationID;
	}

	public String getPlaceID() {
		return placeID;
	}

	public void setPlaceID(String placeID) {
		this.placeID = placeID;
	}

	public String getReserverName() {
		return reserverName;
	}

	public void setReserverName(String reserverName) {
		this.reserverName = reserverName;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getCheck_in_Day() {
		return Check_in_Day;
	}

	public void setCheck_in_Day(String check_in_Day) {
		Check_in_Day = check_in_Day;
	}

	public String getCheck_out_Day() {
		return Check_out_Day;
	}

	public void setCheck_out_Day(String check_out_Day) {
		Check_out_Day = check_out_Day;
	}

	public String getCheck_in_Time() {
		return Check_in_Time;
	}

	public void setCheck_in_Time(String check_in_Time) {
		Check_in_Time = check_in_Time;
	}

	public String getCheck_out_Time() {
		return Check_out_Time;
	}

	public void setCheck_out_Time(String check_out_Time) {
		Check_out_Time = check_out_Time;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReservationDTO [reservationID=" + reservationID + ", placeID=" + placeID + ", reserverName="
				+ reserverName + ", placeName=" + placeName + ", reserveDate=" + reserveDate + ", payment=" + payment
				+ ", Check_in_Day=" + Check_in_Day + ", Check_out_Day=" + Check_out_Day + ", Check_in_Time="
				+ Check_in_Time + ", Check_out_Time=" + Check_out_Time + ", people=" + people + ", regdate=" + regdate
				+ "]";
	}

	public ReservationDTO(int reservationID, String placeID, String reserverName, String placeName, String reserveDate,
			int payment, String check_in_Day, String check_out_Day, String check_in_Time, String check_out_Time,
			String people, Date regdate) {
		super();
		this.reservationID = reservationID;
		this.placeID = placeID;
		this.reserverName = reserverName;
		this.placeName = placeName;
		this.reserveDate = reserveDate;
		this.payment = payment;
		Check_in_Day = check_in_Day;
		Check_out_Day = check_out_Day;
		Check_in_Time = check_in_Time;
		Check_out_Time = check_out_Time;
		this.people = people;
		this.regdate = regdate;
	}

	
	
}
