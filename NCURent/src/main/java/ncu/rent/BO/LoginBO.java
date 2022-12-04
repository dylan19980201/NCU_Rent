package ncu.rent.BO;

import ncu.rent.DTO.User;
import ncu.rent.DAO.LoginDAO;
import java.util.List;

public class LoginBO {
		public static LoginDAO LoginDAO= new LoginDAO();
		public User getUser(String id, String password){
				List<User> userList= LoginDAO.getUserData(id, password);
				User user = null;
				if(!userList.isEmpty()) {
					user = userList.get(0);
				}
				/*
				if(!userList.isEmpty()) {
					String Name = userList.get(0).getName();
					System.out.println("您好"+Name);
				}else {
					System.out.println("查無此人");
				}
				*/
				return user;  
		}
}
