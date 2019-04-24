<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pw.util.PwSubmit"%>
<%@page import="com.pw.util.PwFunction"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.pw.services.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%
	/**
	 * 功能:国际信用卡支付跳转
	 * 描述:接受提交参数,生成签名并提交给PW系统
	 */
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>支付测试 接口</title>

<%
	//支付网关URL
	String gateway = "http://test-nms.nova2pay.com/icp/v3/pay.html";
	//商户编号
	String merchantId = request.getParameter("merchantId");
	//商户私钥
	String privateKey = request.getParameter("privateKey");
	//安全码
	String securityKey = request.getParameter("securityKey");
	//商户平台唯一订单号
	String merchantTradeId = request.getParameter("merchantTradeId");
	//商品名称
	String goodsTitle = request.getParameter("goodsTitle");
	//交易金额
	String amountFee = request.getParameter("amountFee");
	//交易币种
	String currency = request.getParameter("currency");
	
	String subMerchantId = request.getParameter("sub_merchant_id");
	

	Map<String,String> sParaTemp = new HashMap<String,String>();
	//sParaTemp.put("gateway", gateway);
	sParaTemp.put("privateKey", privateKey);
	sParaTemp.put("securityKey", securityKey);
	sParaTemp.put("app_id", merchantId);
	sParaTemp.put("sub_app_id", request.getParameter("sub_app_id"));
	sParaTemp.put("order_no", merchantTradeId);
	sParaTemp.put("descriptor", goodsTitle);
	sParaTemp.put("currency", currency);
	sParaTemp.put("amount", amountFee);
	sParaTemp.put("payment_channel", request.getParameter("issuingBank"));
	sParaTemp.put("sign_type", request.getParameter("signType"));

	String cardNo = request.getParameter("cardNo");
	String expire = request.getParameter("expire");
	String cvv = request.getParameter("cvv");
	String paymentCode = null;
	if (StringUtils.isNotBlank(cardNo) && StringUtils.isNotBlank(expire) && StringUtils.isNotBlank(cvv)) {
		paymentCode = cardNo + "|" + expire + "|" + cvv;
	}
	sParaTemp.put("card_info", paymentCode);
	
	Map<String,String> map = PwSubmit.buildRequest(sParaTemp);
	
	Map<String,String> billingAddress = new HashMap<String,String>();
	billingAddress.put("firstName", request.getParameter("firstName"));
	billingAddress.put("lastName", request.getParameter("lastName"));
	billingAddress.put("phone", request.getParameter("phone"));
	billingAddress.put("email", request.getParameter("email"));
	billingAddress.put("country", request.getParameter("country"));
	billingAddress.put("state", request.getParameter("state"));
	billingAddress.put("city", request.getParameter("city"));
	billingAddress.put("address", request.getParameter("address"));
	billingAddress.put("zip", request.getParameter("zip"));

	System.out.println("輸出："+billingAddress);
	Map<String,Object> ma = new HashMap<String,Object>();
	ma.put("billing_address", billingAddress);
	ma.putAll(map);
	String str2 = PwFunction.clientToServer(ma,gateway);
	System.out.println("輸出："+str2);
	out.println(str2);

%>
</head>
</html>
