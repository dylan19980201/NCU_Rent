package ncu.rent.DAO;

import ncu.rent.Database.DBHelper;

public class RegisterDAO {
    public boolean addUserData(String[] user,String type) {
		DBHelper db = new DBHelper();
		String command = "";
		if(type=="1")
			command = """
				insert into student (SID,SPassword,SName,SBirth,SGender,SDepartment,SPhone,SEmail)
				VALUES (?,?,?,?,?,?,?,?)""";
		else 
			command = """
				insert into landlord (LID,LPassword,LName,LBirth,LGender,LPhone,LEmail)
				VALUES (?,?,?,?,?,?,?)""";
		if(db.addUserData(command, user)==1) 
		    return true;
		else 
		    return false;
	}
}
