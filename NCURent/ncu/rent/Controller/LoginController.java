package ncu.rent.Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import ncu.rent.BO.LoginBO;
import ncu.rent.DTO.User;
import net.sf.json.JSONArray;

import org.json.JSONObject;

import com.google.gson.Gson;

public class LoginController extends SuperController {
	public JSONObject Login(HttpServletRequest request, HttpServletResponse response) {
		LoginBO LoginBO = new LoginBO();
		// 取得使用者輸入的id, password
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		// 取得資料庫的資料
		User user = LoginBO.getUser(id, password);
		JSONObject data = new JSONObject();
		if (user != null) {
			// session --保持持續登入，儲存使用者資訊--
			HttpSession session = request.getSession();
			String sessionId = session.getId();
			session.setAttribute("id", user.getID());
			session.setAttribute("password", user.getPassword());
			session.setAttribute("name", user.getName());
			session.setAttribute("type", user.getType());
			session.setAttribute("gender", user.getGender());
			data.put("sessionId", session.getId());
			return DataForFrontend("success", "", data, "/NCURent/html/index.jsp");
		}
		// 傳給前端資料(request資料, response資料, 要跳轉的頁面)
		return DataForFrontend("fail", "", data, "/NCURent/login.jsp");
	}

	public JSONObject Register(HttpServletRequest request, HttpServletResponse response) {
		String[] user;
		LoginBO LoginBO = new LoginBO();
		if (!LoginBO.idList().contains(request.getParameter("id"))) {
			if ((request.getParameter("type")).equals("1")) {
				user = new String[] {
						request.getParameter("id"),
						request.getParameter("password"),
						request.getParameter("name"),
						request.getParameter("birth"),
						request.getParameter("gender"),
						request.getParameter("department"),
						request.getParameter("phone"),
						request.getParameter("email") };
			} else {
				user = new String[] {
						request.getParameter("id"),
						request.getParameter("password"),
						request.getParameter("name"),
						request.getParameter("birth"),
						request.getParameter("gender"),
						request.getParameter("phone"),
						request.getParameter("email") };
			}
			boolean success = LoginBO.addUser(user, request.getParameter("type"));
			return DataForFrontend("success", "新增成功", null, "/NCURent/login.jsp");
		} else {
			request.setAttribute("error", "新增失敗");
			if ((request.getParameter("type")).equals("1"))
				return DataForFrontend("fail", "帳號名稱已存在", null, "/NCURent/registerforlandlord.jsp");
			else
				return DataForFrontend("fail", "帳號名稱已存在", null, "/NCURent/registerforstudent.jsp");
		}
	}

	public JSONObject deleteUser(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("delID");
		LoginBO LoginBO = new LoginBO();
		boolean success = LoginBO.deleteUser(id);
		if (success) {
			return DataForFrontend("success", "刪除成功", null, "/NCURent/html/manageAccount.jsp");
		} else {
			request.setAttribute("error", "錯誤");
			return DataForFrontend("fail", "刪除失敗", null, "/NCURent/html/manageAccount.jsp");
		}
	}

	public JSONObject updateUser(HttpServletRequest request, HttpServletResponse response) {
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		String id = (session.getAttribute("id")).toString(), type = (session.getAttribute("type")).toString();
		LoginBO LoginBO = new LoginBO();
		boolean success = LoginBO.updateUser(id, password, type);
		if (success) {
			return DataForFrontend("success", "更改成功", null, "");
		} else {
			request.setAttribute("error", "錯誤");
			return DataForFrontend("fail", "更改失敗", null, "");
		}
	}

	public JSONObject getAllUser(HttpServletRequest request, HttpServletResponse response) {
		LoginBO LoginBO = new LoginBO();
		Gson gson = new Gson();
		String listJson = gson.toJson(LoginBO.getAllUser());
		JSONArray userData = JSONArray.fromObject(listJson);
		return DataForFrontend("success", "", userData, "/NCURent/html/manageAccount.jsp");
	}
}
