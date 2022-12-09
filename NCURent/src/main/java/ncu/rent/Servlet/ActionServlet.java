package ncu.rent.Servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.io.*;
import org.json.JSONObject;

import ncu.rent.Controller.PostController;
import ncu.rent.Controller.LoginController;


public class ActionServlet extends HttpServlet{
	private static LoginController loginController= new LoginController();
	private static PostController postController = new PostController();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null) {
			String path = request.getServletPath().substring(1);
			JSONObject data = data(path, request, response);
			RequestDispatcher view = request.getRequestDispatcher((data.get("page")).toString());
			view.forward((HttpServletRequest) data.get("request"), (HttpServletResponse) data.get("response"));
			return;
		}else {
			LoginMessageBox(response);
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response, String page) throws IOException, ServletException{
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null) {
			String path = request.getServletPath().substring(1);
			JSONObject data = data(path, request, response);
			RequestDispatcher view = request.getRequestDispatcher((data.get("page")).toString());
			view.forward((HttpServletRequest) data.get("request"), (HttpServletResponse) data.get("response"));
		}else {
			LoginMessageBox(response);
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
					Method postMethod = postClassObj.getDeclaredMethod(methodName, String.class);
					data = (JSONObject) postMethod.invoke(postController, request, response);
					break;
			}
		}catch(Exception e) {
			System.out.println(e.getCause());
		}
		return data;
	}
	private void LoginMessageBox(HttpServletResponse response) throws IOException{
		String a = URLEncoder.encode("沒登入還想用阿！", "UTF-8"); 
		PrintWriter out = response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert(decodeURIComponent('"+a+"'));");
		out.println("location='../login.jsp';");
		out.println("</script>");
	}
}
