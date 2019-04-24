package com.pw.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.Header;
import org.apache.commons.lang.StringUtils;

import com.google.gson.Gson;
import com.pw.util.httpClient.HttpRequest;
import com.pw.util.httpClient.HttpResponse;
import com.pw.util.httpClient.HttpResultType;

/**
 * 支付函数工具类
 */
public class PwFunction {

	/**
	 * 除去数组中的空值和签名参数
	 * 
	 * @param sArray
	 *            签名参数组
	 * @return 去掉空值与签名参数后的新签名参数组
	 */
	public static Map<String, String> paraFilter(Map<String, String> sArray,
			String[] params) {

		Map<String, String> result = new HashMap<String, String>();

		if (sArray == null || sArray.size() <= 0) {
			return result;
		}

		for (String key : sArray.keySet()) {
			String value = sArray.get(key);
			if (value == null || value.equals("") || existParams(key, params)) {
				continue;
			}
			result.put(key, value);
		}

		return result;
	}

	/**
	 * 该参数是否在给定数组中存在
	 */
	private static boolean existParams(String key, String[] params) {
		for (String param : params) {
			if (key.equalsIgnoreCase(param)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 把数组所有元素排序，并按照“参数=参数值”的模式用“&”字符拼接成字符串
	 */
	public static String createLinkString(Map<String, String> params) {
		
		List<String> keys = new ArrayList<String>(params.keySet());
		Collections.sort(keys);

		String prestr = "";

		for (int i = 0; i < keys.size(); i++) {
			String key = keys.get(i);
			String value = params.get(key);

			if (i == keys.size() - 1) {
				prestr = prestr + key + "=" + value;
			} else {
				prestr = prestr + key + "=" + value + "&";
			}
		}

		return prestr;
	}

	public static Map<String, Object> parseJSON2Map(String jsonStr) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 最外层解析
		JSONObject json = JSONObject.fromObject(jsonStr);
		Iterator<String> it = json.keys();
		while (it.hasNext()) {
			String key = it.next();
			Object value = json.get(key);
			map.put(key, value);
		}
		return map;
	}

	public static Map<String, String> parseLinkString(String linkString) {
		Map<String, String> result = null;

		if (StringUtils.isNotBlank(linkString)) {

			String[] params = StringUtils.split(linkString, "&");
			for (String param : params) {
				if (param.indexOf("=") > 0) {
					int index = param.indexOf("=");
					String name = StringUtils.substring(param, 0, index);
					String value = StringUtils.substring(param, index + 1,
							param.length());
					if (StringUtils.isNotBlank(value)) {
						if (result == null)
							result = new HashMap<String, String>();
						result.put(name, value);
					}
				}
			}
		}
		return result;
	}

	public static String map2JsonString(Map<String, Object> sPara) {

		String message = null;
		Gson gson = new Gson();
		message = gson.toJson(sPara);
		System.out.println("请求json:" + message);
		return message;
	}

	public static String clientToServer(Map<String, Object> param, String url) {
		String msg = map2JsonString(param);
		HttpRequest httpRequest = new HttpRequest(HttpResultType.BYTES);
		httpRequest.setMethod("POST");
		httpRequest.setCharset("UTF-8");
		httpRequest.setUrl(url);

		Header[] headers = new Header[1];
		headers[0] = new Header("Content-type", "application/json");
		httpRequest.setHeader(headers);
		httpRequest.setCharset("UTF-8");
		httpRequest.setRequestBody(msg);
		System.out.println(msg);
		String responseText = "";
		try {
			HttpResponse response = HttpClientUtil.sendPostInfo(httpRequest);
			System.out.println(response.getStringResult("UTF-8").toString());
			responseText = response.getStringResult("UTF-8").toString();
			System.out.println(responseText);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return responseText;
	}
	
	
	public static Map<String, String> findRequestParams(HttpServletRequest request) {
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = iter.next();
			String[] values = requestParams.get(name);
			StringBuffer valueStr = new StringBuffer();
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr.append(values[i]) : valueStr.append(values[i]).append(
						",");
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			// try {
			// valueStr = new String(valueStr.getBytes("ISO-8859-1"), "UTF-8");
			// } catch (UnsupportedEncodingException e) {
			// e.printStackTrace();
			// }
			params.put(name, valueStr.toString());
		}
		return params;
	}
}
