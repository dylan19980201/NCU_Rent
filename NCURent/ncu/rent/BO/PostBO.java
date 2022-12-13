package ncu.rent.BO;

import ncu.rent.DAO.HouseDAO;
import ncu.rent.DAO.PostDAO;
import java.util.List;
import ncu.rent.DTO.House;
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
	
}
