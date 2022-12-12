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
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String path = request.getServletPath().substring(1);
		String methodName= path.substring(path.indexOf("/")+1, path.length());
		Class<?> classObj = loginController.getClass();
		JSONObject data = null;
		try {
			Method method= classObj.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
			data= (JSONObject) method.invoke(loginController, request, response); 
			request.setCharacterEncoding("utf8");
	        response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        JSONObject obj = (JSONObject) data;
	        //System.out.println(obj);
	        out.print(obj.toString());
		}
		catch(Exception e){
			System.out.println(e.getCause());
		}

		return;
	}
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String path = request.getServletPath().substring(1);
		String methodName= path.substring(path.indexOf("/")+1, path.length());
		Class<?> classObj = loginController.getClass();
		JSONObject data = null;
		try {
			Method method= classObj.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
			data= (JSONObject) method.invoke(loginController, request, response); 
			request.setCharacterEncoding("utf8");
	        response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        JSONObject obj = (JSONObject) data;
	        out.print(obj.toString());
		}
		catch(Exception e){
			System.out.println(e.getCause());
		}

		return;
	}
}
