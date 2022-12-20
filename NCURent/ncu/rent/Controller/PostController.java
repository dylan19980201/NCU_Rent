package ncu.rent.Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import ncu.rent.DTO.House;
import ncu.rent.DTO.HouseReview;
import ncu.rent.DTO.StudentReview;
import ncu.rent.DTO.User;
import net.sf.json.JSONArray;

import org.json.JSONObject;

import com.google.gson.Gson;

import java.io.*;
import java.time.LocalDateTime;
import java.util.List;

import ncu.rent.BO.UploadBO;
import ncu.rent.BO.LoginBO;
import ncu.rent.BO.PostBO;
import ncu.rent.BO.LoginBO;

public class PostController extends SuperController {
	public JSONObject AddPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		String type = (session.getAttribute("type")).toString();
		if (type.equals("landlord")) {
			UploadBO UploadBO = new UploadBO();
			PostBO PostBO = new PostBO();
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
			if (id != 0) {
				UploadBO.upload(filePart, request.getParts(), "house" + id + ".jpg");
				return DataForFrontend("success", "請求刊登成功", null, "/NCURent/post.jsp");
			}
		}
		return DataForFrontend("fail", "請求刊登失敗", null, "/NCURent/Login.jsp");
	}

	public JSONObject getAllHouse(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		PostBO PostBO = new PostBO();
		int type = Integer.parseInt(request.getParameter("type"));
		List<House> house = null;
		if (type == 1) {
			HttpSession session = request.getSession();
			house = PostBO.getAllHouse((session.getAttribute("id")).toString());
		} else {
			house = PostBO.getAllHouse();
		}
		Gson gson = new Gson();
		String listJson = gson.toJson(house);
		JSONArray houseData = JSONArray.fromObject(listJson);
		return DataForFrontend("success", "", houseData, "");
	}

	public JSONObject GetHouseData(HttpServletRequest request, HttpServletResponse response) {
		int HID = Integer.parseInt(request.getParameter("HID"));
		PostBO PostBO = new PostBO();
		// 取得資料庫的資料

		House house = PostBO.getHouseData(HID);
		List<HouseReview> houseReview = PostBO.getHouseReview(HID);
		JSONObject json = new JSONObject(house);
		String houseData = json.toString();
		Gson gson = new Gson();
		String listJson = gson.toJson(houseReview);
		JSONArray houseReviewData = JSONArray.fromObject(listJson);
		JSONObject jsonData = new JSONObject();
		jsonData.put("houseData", houseData);
		jsonData.put("houseReviewData", houseReviewData);
		return DataForFrontend("success", "", jsonData, "/NCURent/html/detail.jsp");
	}

	// 取得留言板資訊
	public JSONObject GetStudentReview(HttpServletRequest request, HttpServletResponse response) {
		String SID = request.getParameter("SID");
		PostBO PostBO = new PostBO();
		LoginBO LoginBO = new LoginBO();
		// 取得資料庫的資料
		List<StudentReview> studentReview = PostBO.getStudentReview(SID);
		User user = LoginBO.getUser(SID);
		JSONObject json = new JSONObject(user);
		String studentData = json.toString();
		Gson gson = new Gson();
		String listJson = gson.toJson(studentReview);
		JSONArray studentReviewData = JSONArray.fromObject(listJson);
		JSONObject jsonData = new JSONObject();
		jsonData.put("studentData", studentData);
		jsonData.put("studentReviewData", studentReviewData);
		return DataForFrontend("success", "", jsonData, "/NCURent/studentMainPage.jsp");
	}

	// 學生留言要存入資料庫
	public JSONObject AddStudentReview(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String[] studentReviewContext;
		String SID = request.getParameter("SID");
		HttpSession session = request.getSession();
		studentReviewContext = new String[] {
				// 這邊要寫真的星星
				request.getParameter("rsStar"),
				request.getParameter("rsContent"),
				// 這邊要寫真的學生ID，到該學生頁面時抓到的ID
				SID,
				// 下面這行僅限房東登入時抓取
				(session.getAttribute("id")).toString(),
		};
		PostBO PostBO = new PostBO();
		if (PostBO.addStudentReview(studentReviewContext))
			return DataForFrontend("success", "發布成功", studentReviewContext, "/NCURent/studentMainPage.jsp");
		else
			return DataForFrontend("fail", "發布失敗", null, "/NCURent/html/reserve.jsp");
	}

	public JSONObject addReserve(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String[] reserve;
		HttpSession session = request.getSession();
		reserve = new String[] {
				request.getParameter("hid"),
				(session.getAttribute("id")).toString(),
				request.getParameter("reservetime"),
				"0",
		};
		PostBO PostBO = new PostBO();
		if (PostBO.addReserve(reserve))
			return DataForFrontend("success", "預約成功", null, "/NCURent/html/index.jsp");
		else {
			request.setAttribute("error", "預約失敗");
			return DataForFrontend("fail", "預約失敗", null, "/NCURent/html/reserve.jsp");
		}
	}

	public JSONObject getAllReserve(HttpServletRequest request, HttpServletResponse response) {
		PostBO PostBO = new PostBO();
		HttpSession session = request.getSession();
		List<JSONObject> reserve = PostBO.getAllReserve((session.getAttribute("id")).toString(),
				(session.getAttribute("type")).toString());
		Gson gson = new Gson();
		String listJson = gson.toJson(reserve);
		JSONArray reserveData = JSONArray.fromObject(listJson);
		return DataForFrontend("success", "", reserveData, "");
	}

	public JSONObject updateReserve(HttpServletRequest request, HttpServletResponse response) {
		PostBO PostBO = new PostBO();
		if (PostBO.updateReserve(Integer.parseInt(request.getParameter("RID")),
				Integer.parseInt(request.getParameter("CheckType"))))
			return DataForFrontend("success", "預約成功", null, "/NCURent/html/lreservestate.jsp");
		else {
			request.setAttribute("error", "預約失敗");
			return DataForFrontend("fail", "預約失敗", null, "/NCURent/html/lreservestate.jsp");
		}
	}

	public JSONObject DeleteStudentReview(HttpServletRequest request, HttpServletResponse response) {
		// 被刪除的流水號 RsID
		int RsID = Integer.parseInt(request.getParameter("RsID"));
		PostBO PostBO = new PostBO();
		boolean success = PostBO.deleteStudentReview(RsID);
		return DataForFrontend("success", "刪除成功", null, "/NCURent/checkReview.jsp");

	}

	public JSONObject DeleteHouseReview(HttpServletRequest request, HttpServletResponse response) {
		// 被刪除的流水號 RlhID
		int RlhID = Integer.parseInt(request.getParameter("RlhID"));
		PostBO PostBO = new PostBO();
		// 這邊應該要寫流水號
		boolean success = PostBO.deleteHouseReview(RlhID);
		return DataForFrontend("success", "刪除成功", null, "/NCURent/checkReview.jsp");

	}

	public JSONObject checkHouse(HttpServletRequest request, HttpServletResponse response) {
		int hid = Integer.parseInt(request.getParameter("HID"));
		HttpSession session = request.getSession();
		String aid = (session.getAttribute("id")).toString();
		PostBO PostBO = new PostBO();
		boolean success = PostBO.checkHouse(hid, aid);
		if (success) {
			return DataForFrontend("success", "審核成功", null, "/NCURent/html/check.jsp");
		} else {
			return DataForFrontend("fail", "審核失敗", null, "/NCURent/html/check.jsp");
		}
	}

	public JSONObject rejectHouse(HttpServletRequest request, HttpServletResponse response) {
		int hid = Integer.parseInt(request.getParameter("HID"));
		PostBO PostBO = new PostBO();
		boolean success = PostBO.rejectHouse(hid);
		if (success) {
			return DataForFrontend("success", "刪除成功", null, "/NCURent/html/check.jsp");
		} else {
			return DataForFrontend("fail", "刪除失敗", null, "/NCURent/html/check.jsp");
		}
	}

	// 房屋留言要存入資料庫
	public JSONObject AddHouseReview(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String[] houseReviewContext;
		HttpSession session = request.getSession();
		houseReviewContext = new String[] {
				// 這邊要寫真的星星
				request.getParameter("RlhStar"),
				request.getParameter("RlContent"),
				// 下面這行僅限學生登入時抓取
				(session.getAttribute("id")).toString(),
				// 這邊要寫真的房屋刊登ID
				request.getParameter("HID")
		};
		PostBO PostBO = new PostBO();
		if (PostBO.addHouseReview(houseReviewContext))
			return DataForFrontend("success", "發布成功", houseReviewContext, "/NCURent/html/details.jsp");
		else
			return DataForFrontend("fail", "發布失敗", null, "/NCURent/html/details.jsp");
	}

}
