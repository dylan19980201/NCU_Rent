package ncu.rent.Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import ncu.rent.BO.LoginBO;
import ncu.rent.BO.RegisterBO;
import ncu.rent.DTO.User;
import org.json.JSONObject;

import java.io.*;


public class LoginController extends SuperController{
	public static LoginBO LoginBO = new LoginBO();

	public JSONObject Login(HttpServletRequest request, HttpServletResponse response) {
		// 取得使用者輸入的id, password
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		// 取得資料庫的資料
		User user = LoginBO.getUser(id, password);
		if(user != null) {
			//request.setAttribute("id", user.getID());
			//request.setAttribute("password", user.getPassword());
			//request.setAttribute("name", user.getName());
			
			//session  --保持持續登入，儲存使用者資訊--
			HttpSession session = request.getSession();
			String sessionId = session.getId();
			session.setAttribute("id", user.getID());
			session.setAttribute("password", user.getPassword());
			session.setAttribute("name", user.getName());
			session.setAttribute("sessionID", sessionId);
		}
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
}
