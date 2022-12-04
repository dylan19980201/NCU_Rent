package ncu.rent.DAO;

import java.sql.SQLException;

import com.google.gson.Gson;
import com.mysql.cj.protocol.x.ReusableOutputStream;

import java.util.ArrayList;
import java.util.List;

import javax.xml.namespace.QName;

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

		int type = 1;
		String []data1 = new String[]{"111421004","421001","Alice","2000-01-01","女","企管碩一","912345678","111421001@cc.ncu.edu.tw"};
		String []data2 = new String[]{"L0002","khsu0101","許智誠","1972-01-01","男","0912166538","khsu@mgt.ncu.edu.tw"};
		if(type==0)
			command = """
				insert into student (SID,SPassword,SName,SBirth,SGender,SDepartment,SPhone,SEmail)
				VALUES (?,?,?,?,?,?,?,?)""";
		else 
			command = """
				insert into landlord (LID,LPassword,LName,LBirth,LGender,LPhone,LEmail)
				VALUES (?,?,?,?,?,?,?)""";
		if(db.addUserData(command, data2)==1) 
			System.out.println("新增成功");
		else 
			System.out.println("新增失敗");
	}
}
