package ncu.rent.Servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.lang.reflect.InvocationTargetException;
import java.io.*;

import ncu.rent.Controller.LoginController;
import org.json.JSONObject;
import ncu.rent.DTO.User;

import java.util.HashMap;
import java.util.Iterator;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class LoginServlet extends HttpServlet{
	private static LoginController loginController= new LoginController();
	
	/*
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
			String path = request.getServletPath().substring(1);
			String methodName= path.substring(path.indexOf("/")+1, path.length());
			Class<?> classObj = loginController.getClass();
			JSONObject data = null;
			try {
				Method method= classObj.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
				data= (JSONObject) method.invoke(loginController, request, response); 
			}
			catch(Exception e){
				System.out.println(e.getCause());
			}
	
			RequestDispatcher view = request.getRequestDispatcher((data.get("page")).toString());
			view.forward((HttpServletRequest) data.get("request"), (HttpServletResponse) data.get("response"));
			return;
	}
	*/
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String path = request.getServletPath().substring(1);
		String methodName= path.substring(path.indexOf("/")+1, path.length());
		Class<?> classObj = loginController.getClass();
		JSONObject data = null;
		try {
			Method method= classObj.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
			data= (JSONObject) method.invoke(loginController, request, response); 
			request.setCharacterEncoding("utf8");
	        //response.setCharacterEncoding("utf8");
	        response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        //JSONObject jsonObj = (JSONObject) JSONValue.parse(request.getParameter("para"));
	        //JSONObject obj = new JSONObject();
	        JSONObject obj = (JSONObject) data;
	        System.out.println(obj);
	        out.print(obj.toString());
		}
		catch(Exception e){
			System.out.println(e.getCause());
		}

		return;
	}
	
	/*
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.setCharacterEncoding("utf8");
        //response.setCharacterEncoding("utf8");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        //JSONObject jsonObj = (JSONObject) JSONValue.parse(request.getParameter("para"));
        JSONObject obj = new JSONObject();
        obj.put("message", "帳號密碼");
        out.print(obj.toString());
	}
	*/
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
			String path = request.getServletPath().substring(1);
			String methodName= path.substring(path.indexOf("/")+1, path.length());
			Class<?> classObj = loginController.getClass();
			JSONObject data = null;
			try {
				Method method= classObj.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
				data= (JSONObject) method.invoke(loginController, request, response); 
			}
			catch(Exception e){
				System.out.println(e.getCause());
			}

			RequestDispatcher view = request.getRequestDispatcher((data.get("page")).toString());
			view.forward((HttpServletRequest) data.get("request"), (HttpServletResponse) data.get("response"));
			return;
	}
}
