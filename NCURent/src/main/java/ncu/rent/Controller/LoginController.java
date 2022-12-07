package ncu.rent.Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import ncu.rent.BO.LoginBO;
import ncu.rent.BO.RegisterBO;
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
		if(user != null) {
			request.setAttribute("id", user.getID());
			request.setAttribute("password", user.getPassword());
			request.setAttribute("name", user.getName());
		}
		//session  --保持持續登入，儲存使用者資訊--
		HttpSession session = request.getSession();
		String sessionId = session.getId();
		//String sessionName = session.getAttribute(sessionId)
		
		//確認是否已經登入
		/*if (session.isNew()) {
		    try {
				response.getWriter().print("session建立成功，session的id是："+sessionId);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
		    try {
				response.getWriter().print("伺服器已經存在session，session的id是："+sessionId);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		*/

		// 傳給前端資料(request資料, response資料, 要跳轉的頁面)
		return DataForFrontend(request, response, "result.jsp");
	}
	
	public JSONObject Register(HttpServletRequest request, HttpServletResponse response) {
		String []user;
		if((request.getParameter("type")).equals("1")) {
			user = new String[]{
				request.getParameter("id"),
				request.getParameter("password"),
				request.getParameter("name"),
				request.getParameter("birth"),
				request.getParameter("gender"),
				request.getParameter("department"),
				request.getParameter("phone"),
				request.getParameter("email")};
		} else {
			user = new String[]{
				request.getParameter("id"),
				request.getParameter("password"),
				request.getParameter("name"),
				request.getParameter("birth"),
				request.getParameter("gender"),
				request.getParameter("phone"),
				request.getParameter("email")};
		}
		RegisterBO RBO = new RegisterBO();
		boolean success = RBO.addUser(user, request.getParameter("type"));
		if(success) {
			System.out.println("test");
			return DataForFrontend(request, response, "login.jsp");
		} else {
			request.setAttribute("error","新增失敗");
			return DataForFrontend(request, response, "register.jsp");
		}
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
