package ncu.rent.DAO;

import java.util.ArrayList;
import java.util.List;
import ncu.rent.Database.DBHelper;
import ncu.rent.DTO.User;
import org.json.JSONObject;

public class LoginDAO {
	public List<User> getUserData(String id, String password) {
		String command = """
				SELECT ID, Password, Name, Birth, Gender, Department, Phone, Email, Type
				FROM (
					SELECT SID AS ID, SPassword as Password, SName AS Name, SBirth AS Birth, SGender as Gender, SDepartment AS Department, SPhone as Phone, SEmail as Email, 'student' AS Type
					FROM student
					UNION
					SELECT LID AS ID, LPassword AS Password, LName AS Name, LBirth AS Birth, LGender AS Gender, NULL AS Department, LPhone AS Phone, LEmail AS Email, 'landlord' AS Type
					FROM landlord
					UNION
					SELECT AID AS ID, APassword AS Password, AName as Name, NULL AS Birth, NULL AS Gender, NULL AS Department, APhone AS Phone, AEmail AS Email, 'administrator' AS Type
				                FROM administrator
					) AS UserTable
				WHERE ID = ? AND Password = ?""";
		List<User> user = new ArrayList<User>();
		JSONObject condition = new JSONObject();
		condition.put("id", id);
		condition.put("password", password);
		try {
			DBHelper db = new DBHelper();
			user = db.QueryUserData(command, new JSONObject(condition.toString()));
		} catch (Exception e) {
			System.out.println(e);
		}
		return user;
	}
	public List<User> getUserData(String id) {
		String command = """
				Select s.SID AS ID, SName AS Name, SBirth AS Birth, SGender as Gender, SDepartment AS Department, SPhone as Phone, SEmail as Email, Amount, Star
				FROM student as s LEFT JOIN 
				(SELECT s.SID AS SID, COUNT(*) AS Amount, AVG(RsStar) AS Star
				FROM student as s inner join reviewstudent as r on s.SID = r.SID
				GROUP BY SID) AS r ON s.SID = r.SID 
				WHERE s.SID = ? """;
		List<User> user = new ArrayList<User>();
		JSONObject condition = new JSONObject();
		condition.put("id", id);
		try {
			DBHelper db = new DBHelper();
			user = db.QueryUser(command, new JSONObject(condition.toString()));
		} catch (Exception e) {
			System.out.println(e);
		}
		return user;
	}
	public boolean addUserData(String[] user, String type) {
		DBHelper db = new DBHelper();
		String command = "";
		if (type.equals("1"))
			command = """
					insert into student (SID,SPassword,SName,SBirth,SGender,SDepartment,SPhone,SEmail)
					VALUES (?,?,?,?,?,?,?,?)""";
		else
			command = """
					insert into landlord (LID,LPassword,LName,LBirth,LGender,LPhone,LEmail)
					VALUES (?,?,?,?,?,?,?)""";
		if (db.addUserData(command, user) == 1)
			return true;
		else
			return false;
	}

	public boolean DeleteUserData(String id, String password) {
		String command1 = """
				Delete From student
				WHERE SID = ? AND SPassword = ?""";
		String command2 = """
				Delete From landlord
				WHERE LID = ? AND LPassword = ?""";
		JSONObject condition = new JSONObject();
		condition.put("id", id);
		condition.put("password", password);
		DBHelper db = new DBHelper();
		if (db.DeleteUserData(command1, new JSONObject(condition.toString())) == 1)
			return true;
		else if (db.DeleteUserData(command2, new JSONObject(condition.toString())) == 1)
			return true;
		else
			return false;
	}
}
