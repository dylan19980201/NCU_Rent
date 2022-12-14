package ncu.rent.DAO;

import ncu.rent.DTO.HouseDetail;
import ncu.rent.DTO.StudentReview;
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
	
	public List<StudentReview> getStudentReview(String Sid) {
		String command = """
		SELECT SID as Sid, LID as Lid, RsStar as rsStar, RsContent as rsContent ,
		RsDateTime as rsDateTime FROM reviewstudent  WHERE Sid = ?
		""";
		List<StudentReview> studentReview = new ArrayList<StudentReview>();
		JSONObject condition = new JSONObject();
		condition.put("Sid", Sid);
		try {
		DBHelper db = new DBHelper();
		studentReview = db.QueryStudentReview(command, new JSONObject(condition.toString()));
		} catch (Exception e) {
		System.out.println(e);
		}
		return studentReview;
		}
	public List<JSONObject> getAllReserve(String id, String type) {
		String command = "";
		if(type.equals("student"))
			command = """
				select reserve.HID,Name,Phone,Rdate,HAddress,HYear,Rent,Size,Equipment,GenderSpecific,PictureName
				from reserve,
				(select house.HID,LName Name,LPhone as Phone,HAddress,HYear,Rent,Size,Equipment,GenderSpecific,PictureName from house,landlord
				where house.LID = landlord.LID) as h
				where reserve.SID = ? and reserve.HID = h.HID""";
		else 
			command = """
				select r.HID,Name,Phone,Rdate,HAddress,HYear,Rent,Size,Equipment,GenderSpecific,PictureName
				from (select HID,SName as Name,SPhone as Phone,RDate from reserve,student
				where reserve.SID = student.SID) as r,
				(select house.LID,house.HID,HAddress,HYear,Rent,Size,Equipment,GenderSpecific,PictureName from house,landlord
				where house.LID = landlord.LID) as h
				where h.LID = ? and r.HID = h.HID""";
		List<JSONObject> reserve = new ArrayList<JSONObject>();
		DBHelper db = new DBHelper();
		reserve = db.getAllReserve(command,id);
		return reserve;
	}
}
