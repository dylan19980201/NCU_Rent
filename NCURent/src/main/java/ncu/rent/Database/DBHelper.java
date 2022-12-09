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
import org.json.JSONObject;

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

	public List<User> QueryUserData(String command, JSONObject condition) throws SQLException {
		List<User> list = new ArrayList<User>();
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			con = this.getConnection();
			statement = con.prepareStatement(command);
			// setString(第幾個問號, value)
			statement.setObject(1, condition.get("id"));
			statement.setObject(2, condition.get("password"));
			rs = statement.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setID(rs.getString("ID"));
				user.setPassword(rs.getString("Password"));
				user.setName(rs.getString("Name"));
				user.setBirth(rs.getString("Birth"));
				user.setGender(rs.getString("Gender"));
				user.setDepartment(rs.getString("Department"));
				user.setPhone(rs.getNString("Phone"));
				user.setEmail(rs.getString("Email"));
				list.add(user);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			con.close();
		}
		return list;
	}

	public int addUserData(String command, String[] user) {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		try {
			con = this.getConnection();
			statement = con.prepareStatement(command);
			for (int i = 0; i < user.length; i++) {
				statement.setString(i + 1, user[i]);
			}
			result = statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e);
			}
		}
		return result;
	}

	public int DeleteUserData(String command, JSONObject condition) {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		try {
			con = this.getConnection();
			statement = con.prepareStatement(command);
			statement.setObject(1, condition.get("id"));
			statement.setObject(2, condition.get("password"));
			result = statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e);
			}
		}
		return result;
	}
<<<<<<< HEAD
	
=======

>>>>>>> 95d6d8dcd15035d802c6a7665bf8ab4f5701b743
}
