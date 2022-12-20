package ncu.rent.DAO;

import ncu.rent.DTO.HouseDetail;
import ncu.rent.DTO.StudentReview;
import ncu.rent.Database.DBHelper;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

import ncu.rent.DTO.House;
import ncu.rent.DTO.HouseReview;

public class PostDAO {
	// private int getHouse(String HID) {
	// 	String command = """
	// 			SELECT HAdress, HYear, Rent, Size, Equipment, GenderSpecific  FROM house WHERE HID = 'H0001';
	// 			""";
	// 	HouseDetail house = new HouseDetail();
	// 	return 0;
	// }

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

	public List<House> getAllHouse(String LID) {
		String command = """
				SELECT HID, HAddress, LName, Size, Rent, Equipment, HYear, GenderSpecific, PictureName, AID
				FROM house left join landlord on house.LID = landlord.LID
				WHERE house.LID = ?
				ORDER BY PostDatetime DESC""";
		List<House> house = new ArrayList<House>();
		JSONObject condition = new JSONObject();
		condition.put("LID", LID);
		try {
			DBHelper db = new DBHelper();
			house = db.getAllHouse(command, new JSONObject(condition.toString()));
		} catch (Exception e) {
			System.out.println(e);
		}
		return house;
	}

	public List<House> getAllHouse() {
		String command = """
				SELECT HID, HAddress, LName, Size, Rent, Equipment, HYear, GenderSpecific, PictureName, AID
				FROM house left join landlord on house.LID = landlord.LID
				ORDER BY PostDatetime DESC""";
		List<House> house = new ArrayList<House>();
		try {
			DBHelper db = new DBHelper();
			house = db.getAllHouse(command);
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

	public boolean addStudentReview(String[] studentReview) {
		String command = """
				insert into reviewstudent (RsStar,RsContent,RsDateTime,SID,LID)
				VALUES (?,?,NOW(),?,?)""";
		DBHelper db = new DBHelper();
		if (db.addStudentReview(command, studentReview) == 1)
			return true;
		else
			return false;
	}

	public boolean addHouseReview(String[] studentReview) {
		String command = """
				insert into reviewlandlordandhouse (RlhStar,RlContent,RlhDateTime,SID,HID)
				VALUES (?,?,NOW(),?,?)""";
		DBHelper db = new DBHelper();
		if (db.addHouseReview(command, studentReview) == 1)
			return true;
		else
			return false;
	}

	public boolean DeleteHouseReview(int RlhID) {
		String command = """
				delete from reviewlandlordandhouse where RlhID=  ? """;
		DBHelper db = new DBHelper();
		if (db.deleteHouseReview(command, RlhID) == 1)
			return true;
		else
			return false;
	}

	public boolean DeleteStudentReview(int RsID) {
		String command = """
				delete from reviewstudent where RsID=  ? """;
		DBHelper db = new DBHelper();
		if (db.deleteStudentReview(command, RsID) == 1)
			return true;
		else
			return false;
	}

	public List<StudentReview> getStudentReview(String Sid) {
		String command = """
				SELECT RsID, SID as Sid, LID as Lid, RsStar as rsStar, RsContent as rsContent ,
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

	public List<HouseReview> getHouseReview(int HID) {
		String command = """
				SELECT RlhID, RlhStar, RlContent, RlhDatetime, SID
				FROM reviewlandlordandhouse
				WHERE HID = ?
				""";
		List<HouseReview> houseReview = new ArrayList<HouseReview>();
		JSONObject condition = new JSONObject();
		condition.put("HID", HID);
		try {
			DBHelper db = new DBHelper();
			houseReview = db.QueryHouseReview(command, new JSONObject(condition.toString()));
		} catch (Exception e) {
			System.out.println(e);
		}
		return houseReview;
	}

	public List<JSONObject> getAllReserve(String id, String type) {
		String command = "";
		if (type.equals("student"))
			command = """
					select RID,Name,Phone,Rdate,HAddress,HYear,Rent,Size,Equipment,GenderSpecific,PictureName,CheckType
					from reserve,
					(select house.HID,LName Name,LPhone as Phone,HAddress,HYear,Rent,Size,Equipment,GenderSpecific,PictureName from house,landlord
					where house.LID = landlord.LID) as h
					where reserve.SID = ? and reserve.HID = h.HID""";
		else
			command = """
					select RID,Name,Phone,Rdate,HAddress,HYear,Rent,Size,Equipment,GenderSpecific,PictureName,CheckType
					from (select RID,HID,SName as Name,SPhone as Phone,RDate,CheckType from reserve,student
					where reserve.SID = student.SID) as r,
					(select house.LID,house.HID,HAddress,HYear,Rent,Size,Equipment,GenderSpecific,PictureName from house,landlord
					where house.LID = landlord.LID) as h
					where h.LID = ? and r.HID = h.HID""";
		List<JSONObject> reserve = new ArrayList<JSONObject>();
		DBHelper db = new DBHelper();
		reserve = db.getAllReserve(command, id);
		return reserve;
	}

	public boolean updateReserve(int id, int type) {
		String command = """
				UPDATE reserve SET CheckType = ? WHERE RID = ?""";
		JSONObject condition = new JSONObject();
		condition.put("RID", id);
		condition.put("CheckType", (type + 1) % 2);
		try {
			DBHelper db = new DBHelper();
			if (db.updateReserve(command, new JSONObject(condition.toString())) == 1)
				return true;
			else
				return false;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
}
