package ncu.rent.BO;

import ncu.rent.DAO.RegisterDAO;

public class RegisterBO {
		public boolean addUser(String []user, String type){
			RegisterDAO RegisterDAO = new RegisterDAO();
			return RegisterDAO.addUserData(user, type);
		}
}
