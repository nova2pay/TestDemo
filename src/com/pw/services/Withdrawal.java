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
import com.pw.util.QRCodeImg;

/**
 * 代付下发   支付范例请求DEMO
 * 页面详见withdrawal.jsp
 * @author 17317
 */
@WebServlet("/withdrawal")
public class Withdrawal extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		final String gateway =  "http://test-nms.nova2pay.com/v2/distribute/withdraw.html";
      
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String merchantId=request.getParameter("merchantId");
        String batchNo=request.getParameter("batchNo");
        String batchRecord=request.getParameter("batchRecord");
        String currencyCode=request.getParameter("currencyCode");
        String totalAmount=request.getParameter("totalAmount");
        String payDate=request.getParameter("payDate");
        String isWithdrawNow=request.getParameter("isWithdrawNow");
        String notifyUrl=request.getParameter("notifyUrl");
        String signType=request.getParameter("signType");
        String sign=request.getParameter("sign");
        String receiveType=request.getParameter("receiveType");
        String accountType=request.getParameter("accountType");
        String serialNo=request.getParameter("serialNo");
        String amount=request.getParameter("amount");
        String bankName=request.getParameter("bankName");
        String bankNo=request.getParameter("bankNo");
        String receiveName=request.getParameter("receiveName");
        String privateKey=request.getParameter("privateKey");
        Map map=new HashMap();
        	map.put("merchantId", merchantId);
        	map.put("batchNo", batchNo);
        	map.put("batchRecord", batchRecord);
        	map.put("currencyCode", currencyCode);
        	map.put("totalAmount", totalAmount);
        	map.put("payDate", payDate);
        	map.put("isWithdrawNow",isWithdrawNow);
        	map.put("notifyUrl", notifyUrl);
        	String zifuchuan=RSA.generateSignContent(map);
        	String signresult=RSA.sign(zifuchuan, privateKey, "UTF-8");
        	String sixSignersult=ByteUtils.toHexAscii(signresult.getBytes());
        	map.put("signType", "RSA");
        	map.put("sign", sixSignersult);
        	List<Map<String,String>> detailList=new ArrayList<Map<String,String>>();
    		Map<String,String> detailInfo1=new HashMap<String, String>();
    		detailInfo1.put("receiveType", receiveType);
    		detailInfo1.put("accountType", accountType);
    		detailInfo1.put("serialNo", serialNo);
    		detailInfo1.put("amount", amount);
    		detailInfo1.put("bankName", bankName);
    		detailInfo1.put("bankNo", bankNo);
    		detailInfo1.put("receiveName", receiveName);
    		detailList.add(detailInfo1);
        	map.put("detailList", JSON.toJSONString(detailList));
        	String sPara=JSON.toJSONString(map);
        	System.out.println(sPara);
        	
        	
        	String result="";
        	try {
				 result = HttpClientUtil.httpPostWithJson(sPara, gateway);
				 System.out.println(result);
				 JSONObject obj=new JSONObject();
		 	       obj.put("param", result);
		 	       System.out.println(obj.toJSONString());
		 	       response.getWriter().println(obj.toJSONString());
			} catch (Exception e) {
				e.printStackTrace();
			}
        	

    }
}
