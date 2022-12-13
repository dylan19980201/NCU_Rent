package ncu.rent.DAO;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

import ncu.rent.DTO.House;
import ncu.rent.Database.DBHelper;

public class HouseDAO {
	public List<House> getHouseData(int Hid) {
	String command = """
	SELECT HAddress as hAddress, HYear as hYear, Rent as rent, Size as size, Equipment as equipment, GenderSpecific as genderSpecific, AID as aID, LID as lID ,HID as hID, PictureName as pictureName,  PostDatetime as postDatetime  
	FROM house  WHERE aID > '0' """;
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
}