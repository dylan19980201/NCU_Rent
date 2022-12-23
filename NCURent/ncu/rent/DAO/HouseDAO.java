package ncu.rent.DAO;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

import ncu.rent.DTO.House;
import ncu.rent.Database.DBHelper;

public class HouseDAO {
	public List<House> getHouseData(int Hid) {
		String command = """
				SELECT HAddress as hAddress, HYear as hYear, Rent as rent, Size as size, Equipment as equipment, GenderSpecific as genderSpecific, AID as aID, LName ,HID as hID, PictureName as pictureName,  PostDatetime as postDatetime
				FROM house left join landlord on house.LID = landlord.LID  WHERE Hid = ?""";
		List<House> house = new ArrayList<House>();
		JSONObject condition = new JSONObject();
		condition.put("Hid", Hid);
		try {
			DBHelper db = new DBHelper();
			house = db.QueryHouseData(command, new JSONObject(condition.toString()));
		} catch (Exception e) {
			System.out.println(e);
		}
		return house;
	}

	public boolean checkHouse(int hid, String aid) {
		String command = """
				UPDATE house SET AID = ? WHERE HID = ? """;
		JSONObject condition = new JSONObject();
		condition.put("HID", hid);
		condition.put("AID", aid);
		try {
			DBHelper db = new DBHelper();
			if (db.checkHouse(command, new JSONObject(condition.toString())) == 1) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	public boolean deleteHouse(int hid) {
		String command = """
				Delete From house
				WHERE HID = ?""";
		JSONObject condition = new JSONObject();
		condition.put("HID", hid);
		try {
			DBHelper db = new DBHelper();
			if (db.deleteHouse(command, new JSONObject(condition.toString())) == 1) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
}
