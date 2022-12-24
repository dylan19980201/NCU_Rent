package ncu.rent.DTO;

public class StudentReview {
	private int RsID;
	private String SID;
	private String LID;
	private int RsStar;
	private String RsContent;
	private String RsDateTime;

	// GetMethod
	public int getRsID() {
		return RsID;
	}

	public String getSID() {
		return SID;
	}

	public String getLID() {
		return LID;
	}

	public int getRsStar() {
		return RsStar;
	}

	public String getRsContent() {
		return RsContent;
	}

	public String getRsDateTime() {
		return RsDateTime;
	}

	// SetMethod
	public void setRsID(int RsID) {
		this.RsID = RsID;
	}

	public void setSID(String SID) {
		this.SID = SID;
	}

	public void setLID(String LID) {
		this.LID = LID;
	}

	public void setRsStar(int RsStar) {
		this.RsStar = RsStar;
	}

	public void setRsContent(String RsContent) {
		this.RsContent = RsContent;
	}

	public void setRsDateTime(String RsDateTime) {
		this.RsDateTime = RsDateTime;
	}

}
