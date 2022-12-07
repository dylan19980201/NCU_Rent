package ncu.rent.BO;

import ncu.rent.DTO.User;
import ncu.rent.DAO.RegisterDAO;
import java.util.List;

public class RegisterBO {
		public boolean addUser(String []user, String type){
			RegisterDAO RegisterDAO = new RegisterDAO();
			return RegisterDAO.addUserData(user, type);
		}
}
