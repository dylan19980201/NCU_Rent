package ncu.rent.DAO;

import ncu.rent.Database.DBHelper;

public class RegisterDAO {
    public static void main(String[] args) {
		DBHelper db = new DBHelper();
		String command = "";
		int type = 1;
		String []data1 = new String[]{"111421004","421001","Alice","2000-01-01","女","企管碩一","912345678","111421001@cc.ncu.edu.tw"};
		String []data2 = new String[]{"L0003","khsu0101","許智誠","1972-01-01","男","0912166538","khsu@mgt.ncu.edu.tw"};
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
