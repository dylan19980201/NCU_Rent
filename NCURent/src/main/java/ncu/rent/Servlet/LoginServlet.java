package ncu.rent.Servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

public class LoginServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws IOException, ServletException{
			//System.out.println("HelloWorld");
			int number = Integer.parseInt(request.getParameter("digits"));
			request.setAttribute("password", number+1);
			RequestDispatcher view = request.getRequestDispatcher("result.jsp");
			view.forward(request, response);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws IOException, ServletException{
			//System.out.println("HelloWorld");
			//response.getWriter().write("hello, hello");
			int number = Integer.parseInt(request.getParameter("digits"));
			request.setAttribute("password", number);
			RequestDispatcher view = request.getRequestDispatcher("result.jsp");
			view.forward(request, response);
	}

}
