package ncu.rent.BO;

import ncu.rent.DAO.HouseDAO;
import ncu.rent.DAO.LoginDAO;
import ncu.rent.DAO.PostDAO;
import java.util.List;

import org.json.JSONObject;

import ncu.rent.DTO.House;
import ncu.rent.DTO.StudentReview;
import ncu.rent.DTO.User;

public class PostBO {
	public int AddPost(String[] house) {
		PostDAO PostDAO = new PostDAO();
		return PostDAO.AddPost(house);
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
	public StudentReview getStudentReview(String SID) {
		PostDAO PostDAO = new PostDAO();
		List<StudentReview> studentReviewList = PostDAO.getStudentReview(SID);
		StudentReview studentReview = null;
		if (!studentReviewList.isEmpty()) {
			studentReview = studentReviewList.get(0);
		}
		return studentReview;
	}
	
	public boolean addStudentReview(String[] studentReview){
		PostDAO PostDAO = new PostDAO();
		return PostDAO.addStudentReview(studentReview);
	}
	
	public List<JSONObject> getAllReserve(String id,String type) {
		PostDAO PostDAO = new PostDAO();
		return PostDAO.getAllReserve(id, type);
	}
	
	public boolean deleteStudentReview(int RsID) {
		PostDAO PostDAO = new PostDAO();
		return PostDAO.DeleteStudentReview(RsID);
	}
}
