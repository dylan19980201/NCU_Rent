package ncu.rent.Controller;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import ncu.rent.DTO.House;
import org.json.JSONObject;
import java.io.*;
import java.net.URLEncoder;

import ncu.rent.BO.UploadBO;
import ncu.rent.BO.PostBO;


public class PostController extends SuperController{
	public JSONObject AddPost(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException{
		UploadBO UploadBO = new UploadBO();
		PostBO  PostBO = new PostBO();
		HttpSession session = request.getSession();
		String userId = (session.getAttribute("id")).toString();
		String[] house = null;
		Part filePart = request.getPart("file");
		house = new String[] {
				request.getParameter("HAddress"),
				request.getParameter("HYear"),
				request.getParameter("Rent"),
				request.getParameter("Size"),
				request.getParameter("Equipment"),
				request.getParameter("GenderSpecific"),
				userId
		};
		int id = PostBO.AddPost(house);
		if(id != 0) {
			UploadBO.upload(filePart, request.getParts(), "house"+id+".jpg");
		}
		request.setAttribute("returnMessage", "刊登成功");
		//request.setAttribute("returnPath", "/NCURent/post.jsp");
		return DataForFrontend(request, response, "../post.jsp");
	}
}
