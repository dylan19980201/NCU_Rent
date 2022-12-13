package ncu.rent.DAO;

import ncu.rent.DTO.HouseDetail;
import ncu.rent.Database.DBHelper;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

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
				SELECT HID, HAddress, LName, Size, Rent, Equipment, HYear, GenderSpecific
				FROM house inner join landlord on house.LID = landlord.LID
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

	public boolean addReserveData() {
		String command = """
				insert into student (SID,SPassword,SName,SBirth,SGender,SDepartment,SPhone,SEmail)
				VALUES (?,?,?,?,?,?,?,?)""";
		List<House> house = new ArrayList<House>();
		try {
			DBHelper db = new DBHelper();
			house = db.getAllHouse(command);
		} catch (Exception e) {
			System.out.println(e);
		}
		return house;
	}
}
