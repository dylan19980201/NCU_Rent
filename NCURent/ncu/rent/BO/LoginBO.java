package ncu.rent.BO;

import ncu.rent.DTO.User;
import net.sf.json.JSONArray;
import ncu.rent.DAO.LoginDAO;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

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
	public User getUser(String id) {
		LoginDAO LoginDAO = new LoginDAO();
		List<User> userList = LoginDAO.getUserData(id);
		User user = null;
		if(!userList.isEmpty()) {
			user = userList.get(0);
		}
		return user;
	}
	public boolean addUser(String[] user, String type) {
		LoginDAO LoginDAO = new LoginDAO();
		return LoginDAO.addUserData(user, type);
	}

	public boolean deleteUser(String id) {
		LoginDAO LoginDAO = new LoginDAO();
		return LoginDAO.deleteUserData(id);
	}

	public List<User> getAllUser() {
		LoginDAO LoginDAO = new LoginDAO();
		return LoginDAO.getAllUser();
	}
	public List<String> idList(){
		Gson gson = new Gson();
		String listJson = gson.toJson(getAllUser());
		JSONArray userData = JSONArray.fromObject(listJson);
		List<String> idList = new ArrayList<String>();
		for(int i=0;i<userData.length();i++)
        {
            net.sf.json.JSONObject jsonObject1 = userData.getJSONObject(i);
            idList.add(jsonObject1.optString("ID"));
        }
		return idList;
	}
}
