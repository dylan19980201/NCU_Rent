package ncu.rent.DTO;

public class House {
	private String HAddress;
	private String HYear;
	private String Rent;
	private String Size;
	private String Equipment;
	private String GenderSpecific;
	private String AID;
	private String HID;
	private String PictureName;
	private String PostDateTime;
	//GET method
	public String getHAddress() {return HAddress;}
	public String getHYear() {return HYear;}
	public String getRent() {return Rent;}
	public String getSize() {return Size;}
	public String getEquipment() {return Equipment;}
	public String getGenderSpecific() {return GenderSpecific;}
	public String getAID() {return AID;}
	public String getHID() {return HID;}
	public String getPictureName() {return PictureName;}
	public String getPostDateTime() {return PostDateTime;}
	//POST method
	public void setHAddress(String HAddress) {this.HAddress = HAddress;}
	public void setHYear(String HYear) {this.HYear = HYear;}
	public void setRent(String Rent) {this.Rent = Rent;}
	public void setSize(String Size) {this.Size = Size;}
	public void setEquipment(String Equipment) {this.Equipment = Equipment;}
	public void setGenderSpecific(String GenderSpecific) {this.GenderSpecific = GenderSpecific;}
	public void setAID(String AID) {this.AID = AID;}
	public void setHID(String HID) {this.HID = HID;}
	public void setPictureName(String PictureName) {this.PictureName = PictureName;}
	public void setPostDateTime(String PostDateTime) {this.PostDateTime = PostDateTime;}	
}
