package ncu.rent.BO;

import ncu.rent.DTO.User;
import ncu.rent.DAO.LoginDAO;
import java.util.List;

public class LoginBO {
	public User getUser(String id, String password) {
		LoginDAO LoginDAO = new LoginDAO();
		List<User> userList = LoginDAO.getUserData(id, password);
		User user = null;
		if (!userList.isEmpty()) {
			user = userList.get(0);
		}
		return user;
	}

	public boolean addUser(String[] user, String type) {
		LoginDAO LoginDAO = new LoginDAO();
		return LoginDAO.addUserData(user, type);
	}

	public boolean deleteUser(String id, String password) {
		LoginDAO LoginDAO = new LoginDAO();
		return LoginDAO.DeleteUserData(id, password);
	}
}
