package ncu.rent.DTO;

public class HouseReview {
	private int RlhStar;
	private String RlContent;
	private String RlhDatetime;
	private String SID;
	private int HID;
	// GET Method
	public int getRlhStar() {return RlhStar;}
	public String RlContent() {return RlContent;}
	public String RlhDatetime() {return RlhDatetime;}
	public String SID() {return SID;}
	public int HID() {return HID;}
	// POST Method
	public void setRlhStar(int RlhStar) {this.RlhStar = RlhStar;}
	public void setRlContent(String RlContent) {this.RlContent = RlContent;}
	public void setRlhDatetime(String RlhDatetime) {this.RlhDatetime = RlhDatetime;}
	public void setSID(String SID) {this.SID = SID;}
	public void setHID(int HID) {this.HID = HID;}
}
