package ncu.rent.DAO;

import java.util.ArrayList;
import java.util.List;
import ncu.rent.Database.DBHelper;
import ncu.rent.DTO.User;
import org.json.JSONObject;

public class LoginDAO {
	public List<User> getUserData(String id, String password){
		String command = """
				SELECT ID, Password, Name, Birth, Gender, Department, Phone, Email
				FROM (
					SELECT SID AS ID, SPassword as Password, SName AS Name, SBirth AS Birth, SGender as Gender, SDepartment AS Department, SPhone as Phone, SEmail as Email
					FROM student
					UNION
					SELECT LID AS ID, LPassword AS Password, LName AS Name, LBirth AS Birth, LGender AS Gender, NULL AS Department, LPhone AS Phone, LEmail AS Email
					FROM landlord
					) AS UserTable
				WHERE ID = ? AND Password = ?""";
		List<User> user = new ArrayList<User>();
		JSONObject condition = new JSONObject();
		condition.put("id", id);
		condition.put("password", password);
		try {
			DBHelper db = new DBHelper();
			user = db.QueryUserData(command, new JSONObject(condition.toString()));
		}
		catch (Exception e){
			System.out.println(e);
		}
		return user;
	}
}
