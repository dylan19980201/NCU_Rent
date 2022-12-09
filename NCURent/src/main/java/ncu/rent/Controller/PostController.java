package ncu.rent.Controller;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import ncu.rent.BO.LoginBO;
import ncu.rent.BO.RegisterBO;
import ncu.rent.DTO.User;
import org.json.JSONObject;

import java.io.*;

public class PostController extends SuperController{
	/*
	public static void main(String arg[]) {
		System.out.println("Hello");
	}
	*/
	public void Hi(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Hi");
	}
	public void Hello(String param) {
		System.out.println("Hello");
	}
}
