package ncu.rent.Servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;
import java.io.*;

import ncu.rent.Controller.LoginController;
import org.json.JSONObject;
import ncu.rent.DTO.User;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class LoginServlet extends HttpServlet{
	private static LoginController loginController= new LoginController();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
			String methodName= request.getServletPath().replace("/", "");
			Class<?> classObj = loginController.getClass();
			JSONObject data = null;
			try {
				Method method= classObj.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
				method.invoke(loginController, request, response);
				data= (JSONObject) method.invoke(loginController, request, response); 
			}
			catch(Exception e){
				System.out.println(e.getCause());
			}
	
			RequestDispatcher view = request.getRequestDispatcher((data.get("page")).toString());
			view.forward((HttpServletRequest) data.get("request"), (HttpServletResponse) data.get("response"));
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
			String methodName= request.getServletPath().replace("/", "");
			Class<?> classObj = loginController.getClass();
			JSONObject data = null;
			try {
				Method method= classObj.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
				method.invoke(loginController, request, response);
				data= (JSONObject) method.invoke(loginController, request, response); 
			}
			catch(Exception e){
				System.out.println(e.getCause());
			}

			RequestDispatcher view = request.getRequestDispatcher((data.get("page")).toString());
			view.forward((HttpServletRequest) data.get("request"), (HttpServletResponse) data.get("response"));
	}

}
