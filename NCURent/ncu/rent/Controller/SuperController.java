package ncu.rent.Controller;

import org.json.JSONObject;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SuperController {
	// 傳給前端資料(request資料, response資料, 要跳轉的頁面)
	public JSONObject DataForFrontend(String message, Object data, String page) {
		JSONObject json = new JSONObject();
		json.put("message", message);
		json.put("data", (JSONObject)data);
		json.put("page", page);
		return json;
	}
}
