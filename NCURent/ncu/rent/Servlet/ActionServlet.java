package ncu.rent.Servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.io.*;
import org.json.JSONObject;

import ncu.rent.Controller.PostController;
import ncu.rent.Controller.LoginController;
@MultipartConfig

public class ActionServlet extends HttpServlet{
	private static LoginController loginController= new LoginController();
	private static PostController postController = new PostController();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf8");
		if(session.getAttribute("id") != null) {
			String path = request.getServletPath().substring(1);
			JSONObject data = data(path, request, response);
			if(data != null) {
				ReturnJsonData(response, data);
			}else {
				ReturnJsonData(response, data);
			}
			return;
		}else {
			JSONObject data = new JSONObject();
			data.put("message", "請登入身分");
			data.put("data", (Object)null);
			data.put("page", "/NCURent/login.jsp");
			ReturnJsonData(response, data);
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response, String page) throws IOException, ServletException{
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf8");
		if(session.getAttribute("id") != null) {
			String path = request.getServletPath().substring(1);
			JSONObject data = data(path, request, response);
			if(data != null) {
				ReturnJsonData(response, data);
			}else {
				ReturnJsonData(response, data);
			}
			return;
		}else {
			JSONObject data = new JSONObject();
			data.put("message", "請登入身分");
			data.put("data", (Object)null);
			data.put("page", "/NCURent/login.jsp");
			ReturnJsonData(response, data);
		}
	}
	
	private JSONObject data(String path, HttpServletRequest request, HttpServletResponse response){
		String className = path.substring(0,path.indexOf("/"));
		String methodName = path.substring(path.indexOf("/")+1, path.length());
		JSONObject data = null;
		try {
			switch(className) {
				case "Login":
					Class<?> loginClassObj = loginController.getClass();
					Method loginMethod = loginClassObj.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
					data = (JSONObject) loginMethod.invoke(loginController, request, response);
					break;
				case "Post":
					Class<?> postClassObj = postController.getClass();
					Method postMethod = postClassObj.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
					data = (JSONObject) postMethod.invoke(postController, request, response);
					break;
			}
		}catch(Exception e) {
			System.out.println(e.getCause());
		}
		return data;
	}
	private void ReturnJsonData(HttpServletResponse response, JSONObject data) throws IOException{
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject obj = (JSONObject) data;
        //System.out.println(obj);
        out.print(obj.toString());
	}
}
