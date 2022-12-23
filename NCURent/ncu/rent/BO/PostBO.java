package ncu.rent.BO;

import ncu.rent.DAO.HouseDAO;
import ncu.rent.DAO.PostDAO;
import java.util.List;

import org.json.JSONObject;

import ncu.rent.DTO.House;
import ncu.rent.DTO.StudentReview;
import ncu.rent.DTO.HouseReview;

public class PostBO {
	public int AddPost(String[] house) {
		PostDAO PostDAO = new PostDAO();
		return PostDAO.AddPost(house);
	}
	public List<House> getAllHouse(String LID){
		PostDAO PostDAO = new PostDAO();
		return PostDAO.getAllHouse(LID);
	}
	public List<House> getAllHouse(){
		PostDAO PostDAO = new PostDAO();
		return PostDAO.getAllHouse();
	}

	public House getHouseData(int Hid){
		HouseDAO HouseDAO = new HouseDAO();
		List<House> houseList =HouseDAO.getHouseData(Hid);
		House house = null;
		if (!houseList.isEmpty()) {
			house = houseList.get(0);
		}
		return house;
	}

	public boolean addReserve(String[] reserve){
		PostDAO PostDAO = new PostDAO();
		return PostDAO.addReserveData(reserve);
	}
	public List<StudentReview> getStudentReview(String SID) {
		PostDAO PostDAO = new PostDAO();
		return PostDAO.getStudentReview(SID);
	}

	public List<HouseReview> getHouseReview(int HID){
		PostDAO PostDAO = new PostDAO();
		return PostDAO.getHouseReview(HID);
	}

	
	public boolean addStudentReview(String[] studentReview){
		PostDAO PostDAO = new PostDAO();
		return PostDAO.addStudentReview(studentReview);
	}
	public boolean addHouseReview(String[] houseReview){
		PostDAO PostDAO = new PostDAO();
		return PostDAO.addHouseReview(houseReview);
	}
	
	public boolean deleteHouseReview(int RlhID) {
		PostDAO PostDAO = new PostDAO();
		return PostDAO.DeleteHouseReview(RlhID);
	}

	public List<JSONObject> getAllReserve(String id,String type) {
		PostDAO PostDAO = new PostDAO();
		return PostDAO.getAllReserve(id, type);
	}

	public boolean updateReserve(int id,int type) {
		PostDAO PostDAO = new PostDAO();
		return PostDAO.updateReserve(id, type);
	}
	
	public boolean deleteStudentReview(int RsID) {
		PostDAO PostDAO = new PostDAO();
		return PostDAO.DeleteStudentReview(RsID);
	}

	public boolean checkHouse(int hid,String aid) {
		HouseDAO HouseDAO = new HouseDAO();
		return HouseDAO.checkHouse(hid,aid);
	}
	public boolean deleteHouse(int hid) {
		HouseDAO HouseDAO = new HouseDAO();
		return HouseDAO.deleteHouse(hid);
	}

}
