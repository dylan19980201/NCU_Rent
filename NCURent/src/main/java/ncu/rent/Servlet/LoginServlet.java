package ncu.rent.Servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;
import java.io.*;

import ncu.rent.Controller.LoginController;

public class LoginServlet extends HttpServlet{
	private static LoginController loginController= new LoginController();
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
			int number = Integer.parseInt(request.getParameter("password"));
			request.setAttribute("password", number);
			String methodName= request.getServletPath().replace("/", "");
			Class<?> classObj = loginController.getClass();
			try {
				Method method= classObj.getDeclaredMethod(methodName, String.class);
				method.invoke(loginController, "hello"); 
			}
			catch(Exception e){
				System.out.println(e.getCause());
			}
			RequestDispatcher view = request.getRequestDispatcher("result.jsp");
			view.forward(request, response);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
			int number = Integer.parseInt(request.getParameter("password"));
			request.setAttribute("password", number);
			String methodName= request.getServletPath().replace("/", "");
			Class<?> classObj = loginController.getClass();
			System.out.println(methodName);
			try {
				Method method= classObj.getDeclaredMethod(methodName, String.class);
				method.invoke(loginController, "hello"); 
			}
			catch(Exception e){
				System.out.println(e.getCause());
			}
			RequestDispatcher view = request.getRequestDispatcher("result.jsp");
			view.forward(request, response);
	}

}
