package ncu.rent.DAO;

import java.sql.SQLException;

import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.List;

import ncu.rent.Database.DBHelper;
import ncu.rent.Database.Student;
public class LoginDAO {
	public static void main(String[] args) throws SQLException {
		String command = "select * from Student";
		List<Student> students = new ArrayList<Student>();
		DBHelper db = new DBHelper();
		students = db.fetchStudentData(command);
		Gson gson = new Gson();
		String json = gson.toJson(students);
		System.out.println(json);
//		for(Student student:students) {
//			System.out.print(student.SID + " ");
//			System.out.println(student.SPassword);
//		}
	}
}
