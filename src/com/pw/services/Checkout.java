package com.pw.services;

import java.io.IOException;
import java.security.PrivateKey;
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
 * 银联网关/快捷/卡对卡   支付范例请求DEMO
 * 页面详见checkout.jsp
 * @author 17317
 *
 */
@WebServlet("/checkout")
public class Checkout extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
			final String requestUrl = "http://test-nms.nova2pay.com/payment/v3/checkOut.html";
	        request.setCharacterEncoding("UTF-8");
	        Map<String, String> paramMap = PwFunction.findRequestParams(request);
	        String payType=paramMap.get("payType");
	        String privateKey=paramMap.get("privateKey");
			if(payType == "EC") {
				paramMap.remove("cardType");
				paramMap.remove("paymentCard");
				paramMap.remove("userName");
			}
			if(payType == "NC") {
				paramMap.remove("subIssuingBank");
				paramMap.remove("paymentCard");
				paramMap.remove("userName");
			}
			if(payType == "CARDBANK") {
				paramMap.remove("subIssuingBank");
			}
			paramMap.remove("signType");
			paramMap.remove("privateKey");
        	String zifuchuan=RSA.generateSignContent(paramMap);
        	String signresult=RSA.sign(zifuchuan, privateKey, "UTF-8");
        	String sixSignersult=ByteUtils.toHexAscii(signresult.getBytes());
        	paramMap.put("sign", sixSignersult);
        	paramMap.put("signType", "RSA");
        	
        	String result=  HttpClientUtil.formSubmitHtml(requestUrl, "post", paramMap);
        	response.getWriter().write(result);
    }
}
