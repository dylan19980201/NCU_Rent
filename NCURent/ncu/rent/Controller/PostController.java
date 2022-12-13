package ncu.rent.Controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import ncu.rent.DTO.House;
import net.sf.json.JSONArray;

import org.json.JSONObject;
import java.io.*;
import java.net.URLEncoder;
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
			}
			request.setAttribute("returnMessage", "刊登成功");
			return DataForFrontend("success","請求刊登成功", null, "/NCURent/post.jsp");
		}else {
			return DataForFrontend("fail", "請求刊登失敗", null, "/NCURent/Login.jsp");
		}
	}
	public JSONObject getAllHouse(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException{
		PostBO PostBO = new PostBO();
		List<House> house = PostBO.getAllHouse();
		JSONArray houseData = JSONArray.fromObject(house);
		return DataForFrontend("success", "", houseData, "/NCURent/result.jsp");
	}
	public JSONObject addReserve(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException{
		String[] reserve;
		reserve = new String[] {
					request.getParameter("name"),
					request.getParameter("gender"),
					request.getParameter("phone"),
					request.getParameter("reservetime")
		};

		return DataForFrontend("success", "", null, "/NCURent/html/reserve.jsp");
	}
}
