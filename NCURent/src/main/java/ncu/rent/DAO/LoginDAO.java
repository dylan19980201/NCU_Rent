package ncu.rent.DAO;

import java.sql.SQLException;

import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.List;

import ncu.rent.Database.DBHelper;
import ncu.rent.DTO.User;
public class LoginDAO {
	public static void main(String[] args) throws SQLException {
		String command = """
				SELECT ID, Password, Name, Birth, Gender, Department, Phone, Email
				FROM (
					SELECT SID AS ID, SPassword as Password, SName AS Name, SBirth AS Birth, SGender as Gender, SDepartment AS Department, SPhone as Phone, SEmail as Email
					FROM student
					UNION
					SELECT LID AS ID, LPassword AS Password, LName AS Name, LBirth AS Birth, LGender AS Gender, NULL AS Department, LPhone AS Phone, LEmail AS Email
					FROM landlord) AS UserTable
				where ID = ?""";
		List<User> user = new ArrayList<User>();
		DBHelper db = new DBHelper();
		user = db.fetchUserData(command);
		Gson gson = new Gson();
		String json = gson.toJson(user);
		System.out.println(json);
	}
}
