package ncu.rent.Controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import ncu.rent.DTO.House;
import net.sf.json.JSONArray;

import org.json.JSONObject;

import com.google.gson.Gson;

import java.io.*;
import java.util.List;

import ncu.rent.BO.UploadBO;
import ncu.rent.BO.PostBO;


public class PostController extends SuperController{
	public JSONObject AddPost(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException{
		HttpSession session = request.getSession();
		String type = (session.getAttribute("type")).toString();
		if(type.equals("landlord")) {
			UploadBO UploadBO = new UploadBO();
			PostBO  PostBO = new PostBO();
			String userId = (session.getAttribute("id")).toString();
			String[] house = null;
			Part filePart = request.getPart("file");
			house = new String[] {
					request.getParameter("HAddress"),
					request.getParameter("HYear"),
					request.getParameter("Rent"),
					request.getParameter("Size"),
					request.getParameter("Equipment"),
					request.getParameter("GenderSpecific"),
					userId
			};
			int id = PostBO.AddPost(house);
			if(id != 0) {
				UploadBO.upload(filePart, request.getParts(), "house"+id+".jpg");
				return DataForFrontend("success","請求刊登成功", null, "/NCURent/post.jsp");
			}
		}
		return DataForFrontend("fail", "請求刊登失敗", null, "/NCURent/Login.jsp");
	}
	
	public JSONObject getAllHouse(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException{
		PostBO PostBO = new PostBO();
		List<House> house = PostBO.getAllHouse();
		Gson gson = new Gson();
		String listJson = gson.toJson(house);
		JSONArray houseData = JSONArray.fromObject(listJson);
		return DataForFrontend("success", "", houseData, "/NCURent/result.jsp");
	}
	
	public JSONObject GetHouseData(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("hello");
		PostBO PostBO = new PostBO();
		// 取得資料庫的資料
		
		House house = PostBO.getHouseData(11103);
		JSONObject data = new JSONObject(house);
			request.setAttribute("HAddress", house.getHAddress());
			request.setAttribute("HYear", house.getHYear());
			request.setAttribute("Rent", house.getRent());
			request.setAttribute("Size", house.getSize());
			request.setAttribute("Equipment", house.getEquipment());
			request.setAttribute("GenderSpecific", house.getGenderSpecific());
			request.setAttribute("AID", house.getAID());
			request.setAttribute("HID", house.getHID());
			request.setAttribute("LID", house.getLID());
			request.setAttribute("PictureName", house.getPictureName());
			request.setAttribute("PostDateTime", house.getPostDateTime());
			return DataForFrontend("success", "", data, "/NCURent/house_ver2.jsp");
	}
	public JSONObject addReserve(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException{
		String[] reserve;
		HttpSession session = request.getSession();
		reserve = new String[] {
					request.getParameter("hid"),
					(session.getAttribute("id")).toString(),
					request.getParameter("reservetime"),
					"0",
		};
		PostBO PostBO = new PostBO();
		if(PostBO.addReserve(reserve))
			return DataForFrontend("success", "預約成功", null, "/NCURent/html/index.jsp");
		else {
			request.setAttribute("error", "預約失敗");
			return DataForFrontend("fail","預約失敗", null, "/NCURent/html/reserve.jsp");
		}
	}
}
