package ncu.rent.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.result.BooleanValueFactory;

import ncu.rent.DTO.User;

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
		con = DriverManager.getConnection("jdbc:mysql://140.115.82.113:3306/ncu_rent", "ncu_person1", "ncuperson5");
		return con;
	}

	public List<User> fetchUserData(String command) throws SQLException {
		List<User> list = new ArrayList<User>();
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;

		try {	
			con = this.getConnection();
			statement = con.prepareStatement(command);
			// setString(第幾個問號, value)
			statement.setString(1, "L0001");
			rs = statement.executeQuery();
			while(rs.next()) {
				list.add(new User(
						rs.getString("ID"),
						rs.getString("Password"),
						rs.getString("Name"),
						rs.getString("Birth"),
						rs.getString("Gender"),
						rs.getString("Department"),
						rs.getString("Phone"),
						rs.getString("Email")));
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		finally {
			con.close();
		}
		return list;
	}
	public int addUserData(String command, String []user) {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		try {
			con = this.getConnection();
			statement = con.prepareStatement(command);
			for(int i=0;i<user.length;i++) {
				statement.setString(i+1,user[i]);
			}
			result  = statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			try {con.close();} catch (SQLException e) {System.out.println(e);}
		}

		return result;
	}
	
	
}


