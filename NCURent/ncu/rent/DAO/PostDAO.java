package ncu.rent.DAO;

import ncu.rent.DTO.HouseDetail;
import ncu.rent.Database.DBHelper;

public class PostDAO {
	private int getHouse(String HID) {
		String command = """
		SELECT HAdress, HYear, Rent, Size, Equipment, GenderSpecific  FROM house WHERE HID = 'H0001';
		""";
		HouseDetail house = new  HouseDetail();
		return 0;
	}
	public int AddPost(String[] house) {
		DBHelper db = new DBHelper();
		String command = """
				INSERT INTO house(HAddress, HYear, Rent, Size, Equipment, GenderSpecific, LID, PostDatetime) 
				VALUES (?,?,?,?,?,?,?,NOW());
				SELECT LAST_INSERT_ID();
				UPDATE house
				SET PictureName = ?
				WHERE HID = ?""";
		return db.AddPost(command, house);
	}
}
