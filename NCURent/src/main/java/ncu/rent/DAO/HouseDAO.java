package ncu.rent.DAO;

import ncu.rent.DTO.HouseDetail;

public class HouseDAO {
	private int getHouse(String HID) {
		String command = """
		SELECT HAdress, HYear, Rent, Size, Equipment, GenderSpecific  FROM house WHERE HID = 'H0001';
		""";
		HouseDetail house = new  HouseDetail();
		
		
		
		return 0;
	}
	
}
