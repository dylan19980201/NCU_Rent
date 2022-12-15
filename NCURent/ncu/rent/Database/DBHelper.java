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
import ncu.rent.DTO.House;
import ncu.rent.DTO.StudentReview;

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
				user.setPhone(rs.getString("Phone"));
				user.setEmail(rs.getString("Email"));
				user.setType(rs.getString("Type"));
				list.add(user);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			con.close();
		}
		return list;
	}
	public List<User> QueryUser(String command, JSONObject condition) throws SQLException{
		List<User> list = new ArrayList<User>();
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			con = this.getConnection();
			statement = con.prepareStatement(command);
			// setString(第幾個問號, value)
			statement.setObject(1, condition.get("id"));
			rs = statement.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setID(rs.getString("ID"));
				user.setName(rs.getString("Name"));
				user.setBirth(rs.getString("Birth"));
				user.setGender(rs.getString("Gender"));
				user.setDepartment(rs.getString("Department"));
				user.setPhone(rs.getString("Phone"));
				user.setEmail(rs.getString("Email"));
				user.setAmount(rs.getInt("Amount"));
				user.setStar(rs.getInt("Star"));
				list.add(user);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			con.close();
		}
		return list;
	}
	public List<House> QueryHouseData(String command, JSONObject condition) throws SQLException {
		List<House> list = new ArrayList<House>();
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			con = this.getConnection();
			statement = con.prepareStatement(command);
			statement.setObject(1, condition.get("Hid"));
			rs = statement.executeQuery();
			while (rs.next()) {
				House house = new House();
				house.setHAddress(rs.getString("hAddress"));
				house.setHYear(rs.getString("hYear"));
				house.setRent(rs.getInt("rent"));
				house.setSize(rs.getInt("size"));
				house.setEquipment(rs.getString("equipment"));
				house.setGenderSpecific(rs.getString("genderSpecific"));
				house.setAID(rs.getString("aID"));
				house.setHID(rs.getString("hID"));
				house.setLName(rs.getString("LName"));
				house.setPictureName(rs.getString("pictureName"));
				house.setPostDateTime(rs.getString("postDatetime"));
				list.add(house);
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
	public int AddPost(String command, String[] house) {
		Connection con = null;
		int Id = 0;
		String insertCommand = command.substring(0,command.indexOf("SELECT"));
		String queryCommand = command.substring(command.indexOf("SELECT"), command.indexOf("UPDATE"));
		String updateCommand = command.substring(command.indexOf("UPDATE"), command.length());
		try {
			con = this.getConnection();
			PreparedStatement getLastInsertId = con.prepareStatement(queryCommand);
			PreparedStatement statement = con.prepareStatement(insertCommand);
			PreparedStatement updatestatement = con.prepareStatement(updateCommand);
			for (int i = 0; i < house.length; i++) {
				statement.setString(i + 1, house[i]);
			}
			statement.executeUpdate();
			getLastInsertId = con.prepareStatement(queryCommand);
			ResultSet rs = getLastInsertId.executeQuery();
			if (rs.next())
			{
				Id = (rs.getInt("last_insert_id()"));
			}
			updatestatement.setString(1, "house"+Integer.toString(Id)+".jpg");
			updatestatement.setString(2, Integer.toString(Id));
			updatestatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println(e);
			}
		}
		return Id;
	}

	public List<House> getAllHouse(String command) throws SQLException{
		List<House> list = new ArrayList<House>();
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			con = this.getConnection();
			statement = con.prepareStatement(command);
			rs = statement.executeQuery();
			while(rs.next()) {
				House house = new House();
				house.setHID(rs.getString("HID"));
				house.setHAddress(rs.getString("HAddress"));
				house.setLName(rs.getString("LName"));
				house.setSize(rs.getInt("Size"));
				house.setRent(rs.getInt("Rent"));
				house.setEquipment(rs.getString("Equipment"));
				house.setHYear(rs.getString("HYear"));
				house.setGenderSpecific(rs.getString("GenderSpecific"));
				house.setPictureName(rs.getString("PictureName"));
				list.add(house);
			}
		} catch (Exception e) {
			System.out.println(e);
		}finally {
			con.close();
		}
		return list;
	}

	public int addReserveData(String command, String[] reserve) {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		try {
			con = this.getConnection();
			statement = con.prepareStatement(command);
			for (int i = 0; i < reserve.length; i++) {
				statement.setString(i + 1, reserve[i]);
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

	//讀取留言資料
	public List<StudentReview> QueryStudentReview(String command, JSONObject condition) throws SQLException {
		List<StudentReview> list = new ArrayList<StudentReview>();
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			con = this.getConnection();
			statement = con.prepareStatement(command);
		statement.setObject(1, condition.get("Sid"));
		rs = statement.executeQuery();
		while (rs.next()) {
			StudentReview studentReview = new StudentReview();
			studentReview.setSID(rs.getString("Sid"));
			studentReview.setLID(rs.getString("Lid"));
			studentReview.setRsStar(rs.getInt("rsStar"));
			studentReview.setRsContent(rs.getString("rsContent"));
			studentReview.setRsDateTime(rs.getString("rsDateTime"));
			list.add(studentReview);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			con.close();
		}
		return list;
	}

	public List<JSONObject> getAllReserve(String command,String id) {
		List<JSONObject> list = new ArrayList<JSONObject>();
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			con = this.getConnection();
			statement = con.prepareStatement(command);
			statement.setString(1, id);
			rs = statement.executeQuery();
			while(rs.next()) {
				JSONObject data = new JSONObject();
				data.put("HID", rs.getString("HID"));
				data.put("Name", rs.getString("Name"));
				data.put("Phone", rs.getString("Phone"));
				data.put("RDate", rs.getString("RDate"));
				data.put("HAddress", rs.getString("HAddress"));
				data.put("HYear", rs.getString("HYear"));
				data.put("Rent", rs.getString("Rent"));
				data.put("Size", rs.getString("Size"));
				data.put("Equipment", rs.getString("Equipment"));
				data.put("GenderSpecific", rs.getString("GenderSpecific"));
				data.put("PictureName", rs.getString("PictureName"));
				list.add(data);
			}
		} catch (Exception e) {
			System.out.println(e);
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
