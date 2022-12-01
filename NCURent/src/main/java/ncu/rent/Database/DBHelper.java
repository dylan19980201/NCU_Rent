package ncu.rent.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import ncu.rent.Database.Student;

public class DBHelper {
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws SQLException {
		Connection con = null;
		con = DriverManager.getConnection("jdbc:mysql://20.187.102.32:3306/test", "developer", "developer5");
		return con;
	}

	public List<Student> fetchStudentData(String command) throws SQLException {
		List<Student> list = new ArrayList<Student>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {	
			con = this.getConnection();
			pstmt = con.prepareStatement(command);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				// System.out.println(rs.getString("SID"));
				// System.out.println(rs.getString(1)+" "+rs.getString(2));
				list.add(new Student(rs.getString("SID"),
						rs.getString("SPassword"),
						rs.getString("SName"),
						rs.getString("SBirth"),
						rs.getString("SGender"),
						rs.getString("SDepartment"),
						rs.getString("SPhone"),
						rs.getString("SEmail")));
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
		try { rs.close(); } catch (Exception e) { /* Ignored */ }
    	try { pstmt.close(); } catch (Exception e) { /* Ignored */ }
    	try { con.close(); } catch (Exception e) { /* Ignored */ }
		}
		return list;
	}
	
	/*
	public static void main(String[] args) {
		try 
		{
			// MySQL 官方網站下載的 JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://20.187.102.32:3306/test", "developer", "developer5");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from NCU");
			while(rs.next()) {
				System.out.println(rs.getString("NAME"));
				//System.out.println(rs.getString(1)+" "+rs.getString(2));
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	*/
	
}


