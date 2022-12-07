package ncu.rent.DAO;

import java.util.ArrayList;
import java.util.List;
import ncu.rent.Database.DBHelper;
import ncu.rent.DTO.User;
import org.json.JSONObject;

public class DeleteUserDAO {
	public boolean DeleteUserData(String id, String password){
		String command = """
				Delete From student
				WHERE ID = ? AND Password = ?""";
		JSONObject condition = new JSONObject();
		condition.put("id", id);
		condition.put("password", password);
		DBHelper db = new DBHelper();
		if(db.DeleteUserData(command, new JSONObject(condition.toString()))==1) 
		    return true;
		else 
		    return false;
	}
	
}
