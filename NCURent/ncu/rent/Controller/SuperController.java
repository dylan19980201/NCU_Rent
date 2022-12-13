package ncu.rent.Controller;

import org.json.JSONObject;


public class SuperController {
	// 傳給前端資料(request資料, response資料, 要跳轉的頁面)
	public JSONObject DataForFrontend(String status,String message, Object data, String page) {
		JSONObject json = new JSONObject();
		json.put("status", status);
		json.put("message", message);
		json.put("data", data);
		json.put("page", page);
		return json;
	}
}
