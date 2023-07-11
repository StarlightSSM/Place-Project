package user;

import java.util.Date;

public class PlaceDTO {
	private int placeID;
	private String placeName;
	private String category;
	private String maxPeople;
	private String address;
	private String addressDetail;
	private String infoDetail;
	private String imgUpload;
	private String hourPerCost;
	private String dayPerCost;
	private Date regdate;

	public PlaceDTO() {
	}

	public int getPlaceID() {
		return placeID;
	}

	public void setPlaceID(int placeID) {
		this.placeID = placeID;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getMaxPeople() {
		return maxPeople;
	}

	public void setMaxPeople(String maxPeople) {
		this.maxPeople = maxPeople;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getInfoDetail() {
		return infoDetail;
	}

	public void setInfoDetail(String infoDetail) {
		this.infoDetail = infoDetail;
	}

	public String getImgUpload() {
		return imgUpload;
	}

	public void setImgUpload(String imgUpload) {
		this.imgUpload = imgUpload;
	}

	public String getHourPerCost() {
		return hourPerCost;
	}

	public void setHourPerCost(String hourPerCost) {
		this.hourPerCost = hourPerCost;
	}

	public String getDayPerCost() {
		return dayPerCost;
	}

	public void setDayPerCost(String dayPerCost) {
		this.dayPerCost = dayPerCost;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "PlaceDTO [placeID=" + placeID + ", placeName=" + placeName + ", category=" + category + ", maxPeople="
				+ maxPeople + ", address=" + address + ", addressDetail=" + addressDetail + ", infoDetail=" + infoDetail
				+ ", imgUpload=" + imgUpload + ", hourPerCost=" + hourPerCost + ", dayPerCost=" + dayPerCost
				+ ", regdate=" + regdate + "]";
	}

	public PlaceDTO(int placeID, String placeName, String category, String maxPeople, String address,
			String addressDetail, String infoDetail, String imgUpload, String hourPerCost, String dayPerCost,
			Date regdate) {
		super();
		this.placeID = placeID;
		this.placeName = placeName;
		this.category = category;
		this.maxPeople = maxPeople;
		this.address = address;
		this.addressDetail = addressDetail;
		this.infoDetail = infoDetail;
		this.imgUpload = imgUpload;
		this.hourPerCost = hourPerCost;
		this.dayPerCost = dayPerCost;
		this.regdate = regdate;
	}

	
	
	

	
}
