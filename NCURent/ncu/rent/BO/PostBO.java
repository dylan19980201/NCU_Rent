package ncu.rent.BO;

import ncu.rent.DAO.PostDAO;
import java.util.List;
import ncu.rent.DTO.House;

public class PostBO {
	public int AddPost(String[] house) {
		PostDAO PostDAO = new PostDAO();
		return PostDAO.AddPost(house);
	}
	public List<House> getAllHouse(){
		PostDAO PostDAO = new PostDAO();
		return PostDAO.getAllHouse();
	}
	public boolean addReserve(String[] reserve){
		PostDAO PostDAO = new PostDAO();
		return PostDAO.addReserveData();
	}
	
}
