package com.pw.util;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;

import com.pw.security.Base64;
import com.pw.security.RSA;

/**
 * 支付提交工具类
 * 
 */
public class PwSubmit {

	/**
	 * 构造请求参数及签名
	 * 
	 * @throws UnsupportedEncodingException
	 */
	public static Map<String, String> buildRequest2(
			Map<String, String> sParaTemp) throws Exception {
		// 除去数组中的空值和无需签名的参数
		// 如果使用paysite方式,paymentType和payBank也不能参与签名
		Map<String, String> sPara = PwFunction.paraFilter(sParaTemp,
				new String[] { "privateKey", "securityKey", "gateway",
						"signType", "sign", "card_info", "paymentCard", "userName"});
		// 生成签名结果
		String prestr = PwFunction.createLinkString(sPara); // 把数组所有元素，按照“参数=参数值”的模式用“&”字符拼接成字符串
		System.out.println("签名拼接字符串：" + prestr);
		String mysign = "";
		if ("RSA".equals(sParaTemp.get("signType"))) {
			System.out.println("签名key:" + sParaTemp.get("privateKey"));
			mysign = HexUtil.DecimalToHex(RSA.sign(prestr,
					sParaTemp.get("privateKey"), "UTF-8"));// V3

		} else if ("MD5".equals(sParaTemp.get("signType"))) {
			System.out.println("签名key:" + sParaTemp.get("securityKey"));
			mysign = DigestUtils.md5Hex((prestr + sParaTemp.get("securityKey"))
					.getBytes("UTF-8"));
		}
		System.out.println("签名：" + mysign);
		// 签名结果与签名方式加入请求提交参数组中
		sPara.put("sign", mysign);
		sPara.put("signType", sParaTemp.get("signType"));
		sPara.put("userName", sParaTemp.get("userName"));
		sPara.put("paymentCard", sParaTemp.get("paymentCard"));
		System.out.println("请求map：" + sPara);
		return sPara;
	}

	public static String buildForm3(Map<String, String> sParaTemp,
			String strMethod, String strButtonName) throws Exception {
		Map<String, String> sPara = buildRequest2(sParaTemp);

		// 待请求参数数组
		List<String> keys = new ArrayList<String>(sPara.keySet());

		StringBuffer sbHtml = new StringBuffer();

		sbHtml.append("<form id=\"pwsubmit\" name=\"pwsubmit\" action=\""
				+ sParaTemp.get("gateway")
				// + "_input_charset=" + sPara.get("inputCharset")
				/*+ "\"enctype=\"application/json\""*/

				+ "\" method=\"" + strMethod + "\">");

		for (int i = 0; i < keys.size(); i++) {
			String name = (String) keys.get(i);
			String value = (String) sPara.get(name);

			sbHtml.append("<input type=\"hidden\" name=\"" + name
					+ "\" value=\"" + value + "\"/>");
		}

		// submit按钮控件请不要含有name属性
		sbHtml.append("<input type=\"submit\" value=\"" + strButtonName
				+ "\" style=\"display:none;\"></form>");
		sbHtml.append("<script>document.forms['pwsubmit'].submit();</script>");
		System.out.println(sbHtml.toString());
		return sbHtml.toString();
	}

	/**
	 * 设置签名
	 * 
	 * @param param
	 * @param securityKey
	 */
	public static void setSign(Map<String, String> param, String key) {
		String signString = "Version=" + param.get("Version") + "&DeviceType="
				+ param.get("DeviceType") + "&CharacterSet="
				+ param.get("CharacterSet") + "&GatewayName="
				+ param.get("GatewayName") + "&OrderId=" + param.get("OrderId")
				+ "&MerchantNo=" + param.get("MerchantNo") + "&OrderCurr="
				+ param.get("OrderCurr") + "&OrderAmt=" + param.get("OrderAmt")
				+ "&SignType=" + param.get("SignType");
		System.out.println(signString);
		String signature = SHA256Util.SHA256Encode(
				SHA256Util.SHA256Encode(signString, "UTF-8") + key, "UTF-8");
		System.out.println(signature);
		param.put("Signature", signature);
	}
	
	
	public static Map<String, String> buildRequest(Map<String, String> sParaTemp)
		    throws Exception
		  {
		    Map sPara = PwFunction.paraFilter(sParaTemp, 
		      new String[] { "privateKey", "securityKey", "gateway", 
		      "sign_type", "sign", "card_info" });

		    String prestr = PwFunction.createLinkString(sPara);
		    System.out.println("签名拼接字符串：" + prestr);
		    String mysign = "";
		    if ("RSA".equals(((String)sParaTemp.get("sign_type")).toString())) {
		      System.out.println("签名key:" + (String)sParaTemp.get("privateKey"));

		      mysign = HexUtil.DecimalToHex(RSA.sign(prestr, 
		        (String)sParaTemp.get("privateKey"), "UTF-8"));
		    }
		    else if ("MD5".equals(((String)sParaTemp.get("sign_type")).toString())) {
		      System.out.println("签名key:" + (String)sParaTemp.get("securityKey"));
		      mysign = DigestUtils.md5Hex((prestr + (String)sParaTemp.get("securityKey"))
		        .getBytes("UTF-8"));
		    }
		    System.out.println("签名：" + mysign);

		    sPara.put("sign", mysign);
		    sPara.put("sign_type", (String)sParaTemp.get("sign_type"));

		    if (StringUtils.isNotBlank((String)sParaTemp.get("card_info"))) {
		      String paymentCode = Base64.encode(RSA.encrypt(
		        ((String)sParaTemp.get("card_info")).getBytes(), 
		        (String)sParaTemp.get("privateKey")));

		      sPara.put("card_info", HexUtil.DecimalToHex(paymentCode));
		    }
		    System.out.println("请求map：" + sPara);
		    return sPara;
		  }

}
