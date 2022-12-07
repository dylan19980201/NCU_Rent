package ncu.rent.Controller;

import org.json.JSONObject;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SuperController {
	// 傳給前端資料(request資料, response資料, 要跳轉的頁面)
		public JSONObject DataForFrontend(HttpServletRequest request, HttpServletResponse response, String page) {
			JSONObject data = new JSONObject();
			data.put("request", request);
			data.put("response", response);
			data.put("page", page);
			return data;
		}
}
