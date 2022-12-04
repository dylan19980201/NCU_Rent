package ncu.rent.Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import ncu.rent.BO.LoginBO;
import ncu.rent.DTO.User;
import org.json.JSONObject;

import java.io.*;


public class LoginController{
	public static LoginBO LoginBO = new LoginBO();

	public JSONObject Login(HttpServletRequest request, HttpServletResponse response){
		// 取得使用者輸入的id, password
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		// 取得資料庫的資料
		User user = LoginBO.getUser(id, password);
		request.setAttribute("id", user.getID());
		request.setAttribute("password", user.getPassword());
		request.setAttribute("name", user.getName());
		// 傳給前端資料(request資料, response資料, 要跳轉的頁面)
		return DataForFrontend(request, response, "result.jsp");
	}
	
	

	// 傳給前端資料(request資料, response資料, 要跳轉的頁面)
	public JSONObject DataForFrontend(HttpServletRequest request, HttpServletResponse response, String page) {
		JSONObject data = new JSONObject();
		data.put("request", request);
		data.put("response", response);
		data.put("page", page);
		return data;
	}

}
