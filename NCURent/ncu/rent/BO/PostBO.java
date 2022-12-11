package ncu.rent.BO;

import ncu.rent.DAO.PostDAO;
import java.util.List;

public class PostBO {
	public int AddPost(String[] house) {
		PostDAO PostDAO = new PostDAO();
		return PostDAO.AddPost(house);
	}
}
