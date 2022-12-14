package ncu.rent.DAO;

import ncu.rent.DTO.HouseDetail;
import ncu.rent.Database.DBHelper;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

import ncu.rent.DTO.House;

public class PostDAO {
	private int getHouse(String HID) {
		String command = """
				SELECT HAdress, HYear, Rent, Size, Equipment, GenderSpecific  FROM house WHERE HID = 'H0001';
				""";
		HouseDetail house = new HouseDetail();
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

	public List<House> getAllHouse() {
		String command = """
				SELECT HID, HAddress, LName, Size, Rent, Equipment, HYear, GenderSpecific, PictureName
				FROM house left join landlord on house.LID = landlord.LID
				ORDER BY PostDatetime DESC""";
		List<House> house = new ArrayList<House>();
		try {
			DBHelper db = new DBHelper();
			house = db.getAllHouse(command);
			// Gson gson = new Gson();
			// String json = gson.toJson(house);
			// String listJson = (JSONArray.fromObject(house)).toString();
			// System.out.println(listJson);
			// JSONArray houseData = JSONArray.fromObject(house);
			// System.out.println(houseData);
		} catch (Exception e) {
			System.out.println(e);
		}
		return house;
	}

	public boolean addReserveData(String[] reserve) {
		String command = """
				insert into reserve (HID,SID,RDate,CheckType)
				VALUES (?,?,?,?)""";
		DBHelper db = new DBHelper();
		if (db.addReserveData(command, reserve) == 1)
			return true;
		else
			return false;
	}
	public List<JSONObject> getAllReserve(String id, String type) {
		String command = "";
		if(type.equals("student"))
			command = """
				select Name,Phone,Rdate,HAddress,HYear,Rent,Size,PictureName
				from reserve,
				(select house.HID,LName Name,LPhone as Phone,HAddress,HYear,Rent,Size,PictureName from house,landlord
				where house.LID = landlord.LID) as h
				where reserve.SID = ? and reserve.HID = h.HID""";
		else 
			command = """
				select Name,Phone,Rdate,HAddress,HYear,Rent,Size,PictureName
				from (select HID,SName as Name,SPhone as Phone,RDate from ncu_rent.reserve,ncu_rent.student
				where ncu_rent.reserve.SID = ncu_rent.student.SID) as r,
				(select ncu_rent.house.LID,ncu_rent.house.HID,HAddress,HYear,Rent,Size,PictureName from ncu_rent.house,ncu_rent.landlord
				where ncu_rent.house.LID = ncu_rent.landlord.LID) as h
				where h.LID = ? and r.HID = h.HID""";
		List<JSONObject> reserve = new ArrayList<JSONObject>();
		DBHelper db = new DBHelper();
		reserve = db.getAllReserve(command,id);
		return reserve;
	}
}
