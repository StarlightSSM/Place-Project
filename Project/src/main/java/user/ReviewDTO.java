package user;

public class ReviewDTO {
	private int reviewID;
	private String writer;
	private String content;
	private String writeDate;
	
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "ReviewDTO [reviewID=" + reviewID + ", writer=" + writer + ", content=" + content + ", writeDate="
				+ writeDate + "]";
	}
	public ReviewDTO() {

	}
	public ReviewDTO(int reviewID, String writer, String content, String writeDate) {
		super();
		this.reviewID = reviewID;
		this.writer = writer;
		this.content = content;
		this.writeDate = writeDate;
	}
	
	
}
