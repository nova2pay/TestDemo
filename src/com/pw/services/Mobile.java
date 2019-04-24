package com.pw.services;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.pw.security.ByteUtils;
import com.pw.security.RSA;
import com.pw.util.HttpClientUtil;
import com.pw.util.PwFunction;
/**
 * 手机H5收银台   支付范例请求DEMO
 * 页面详见mobile.jsp
 * @author 17317
 */
@WebServlet("/mobile")
public class Mobile extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		final String gateway= "http://test-nms.nova2pay.com/payment/otoSoft/v3/mweb.html";
     
        request.setCharacterEncoding("UTF-8");
        Map<String, String> map = PwFunction.findRequestParams(request);
        String privateKey = map.get("privateKey");
        String signType = map.get("signType");
        map.remove("privateKey");
        map.remove("signType");
        	String zifuchuan=RSA.generateSignContent(map);
        	String signresult=RSA.sign(zifuchuan, privateKey, "UTF-8");
        	String sixSignersult=ByteUtils.toHexAscii(signresult.getBytes());
        	map.put("sign", sixSignersult);
        	map.put("signType", signType);
        	String result=  HttpClientUtil.formSubmitHtml(gateway, "post", map);
        	response.getWriter().write(result);
    }
}
