package com.pw.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.JsonObject;
import com.pw.security.ByteUtils;
import com.pw.security.RSA;
import com.pw.util.HttpClientUtil;
import com.pw.util.PwFunction;
import com.pw.util.QRCodeImg;


/**
 * 二维码   支付范例请求DEMO
 * 页面详见QrCode.jsp
 * @author 17317
 */

@WebServlet("/QrCode")
public class QrCode extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		final String gateway="http://test-nms.nova2pay.com/payment/otoSoft/v3/getQrCode.html";
		
		try {
        	request.setCharacterEncoding("UTF-8");
        	Map<String , String >  map = PwFunction.findRequestParams(request);
        	String result = HttpClientUtil.sendPostInfo(map, gateway, "utf-8");
        	JSONObject jsonResult= JSON.parseObject(result);
        	JSONObject jsonData=(JSONObject) jsonResult.get("data");
        	
	        	 if(!jsonData.get("qrUrl").equals("") && !jsonData.get("qrUrl").equals(null)) {
	        		 String qrUrl = jsonData.get("qrUrl").toString();
	        		 QRCodeImg qrCode=new QRCodeImg();
	        		 qrCode.service(request, response,qrUrl);
	        	 }else {
	        		String results="获取二维码信息失败";
	        		 request.setAttribute("result", results);
	        		 request.getRequestDispatcher("/test.jsp").forward(request, response);
	        	 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

}
