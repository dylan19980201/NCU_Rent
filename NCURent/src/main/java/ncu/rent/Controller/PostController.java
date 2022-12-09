package ncu.rent.Controller;


import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import ncu.rent.BO.LoginBO;
import ncu.rent.BO.RegisterBO;
import ncu.rent.DTO.User;
import org.json.JSONObject;
import java.io.*;

import jakarta.servlet.http.Part;


public class PostController extends SuperController{
	/*
	public static void main(String arg[]) {
		System.out.println("Hello");
	}
	*/
	/*
	public void Hi(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Hi");
	}
	public void Hello(String param) {
		System.out.println("Hello");
	}
	*/
	public void Add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Part filePart = request.getPart("file");
		String fileName = filePart.getSubmittedFileName();
		
		for(Part part : request.getParts()) {
			part.write(path()+"\\HouseImage\\"+fileName);
		}
		response.getWriter().print("success");
	}
	public String path(){
		String path = getClass().getResource("/").getPath();
		path = path.substring(1, path.indexOf(".metadata"));
		path = path.replace("/", "\\");
		//System.out.println(path);
		return path;
		/*
		try {
			File directory = new File("");
			System.out.println(directory.getCanonicalPath());
			System.out.println(directory.getAbsolutePath());
		}
		catch(Exception e){
			System.out.println(e);
		}
		*/
	}
}
