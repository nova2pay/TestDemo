package com.pw.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringBufferInputStream;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.Set;

import org.apache.commons.httpclient.Header;

import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.CoreConnectionPNames;

import com.alibaba.fastjson.JSONObject;
import com.pw.util.httpClient.HttpProtocolHandler;
import com.pw.util.httpClient.HttpRequest;
import com.pw.util.httpClient.HttpResponse;
import com.pw.util.httpClient.HttpResultType;
import com.sun.org.apache.bcel.internal.generic.IFNONNULL;


public class HttpClientUtil {

	/**
	 * MAP类型数组转换成NameValuePair类型
	 * 
	 * @param properties
	 *            MAP类型数组
	 * @return NameValuePair类型数组
	 */
	private static NameValuePair[] generatNameValuePair(
			Map<String, String> properties) {
		NameValuePair[] nameValuePair = new NameValuePair[properties.size()];
		int i = 0;
		for (Map.Entry<String, String> entry : properties.entrySet()) {
			nameValuePair[i++] = new NameValuePair(entry.getKey(),
					entry.getValue());
		}

		return nameValuePair;
	}

	/**
	 * 构造模拟远程HTTP的POST请求，获取返回处理结果
	 * 
	 * @param sParaTemp
	 *            请求参数数组
	 * @param gateway
	 *            网关地址
	 * @return 处理结果
	 * @throws Exception
	 */
	public static String sendPostInfo(Map<String, String> sPara,
			String gateway, String inputCharset) throws Exception {
		HttpProtocolHandler httpProtocolHandler = HttpProtocolHandler
				.getInstance();

		HttpRequest request = new HttpRequest(HttpResultType.STRING);
		// 设置编码集
		request.setCharset(inputCharset);

		request.setParameters(generatNameValuePair(sPara));
		request.setUrl(gateway);

		HttpResponse response = httpProtocolHandler.execute(request);
		if (response == null) {
			return null;
		}

		String strResult = response.getStringResult(inputCharset);

		return strResult;
	}
	
	/*-------------------------------------------------*/
	public static String httpPostWithJson(String prasa,String url){
		
	    boolean isSuccess = false;
	    String sd = "";
	    HttpPost post = null;
	    try {
	        HttpClient httpClient = new DefaultHttpClient();

	        // 设置超时时间
	        httpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 30000);
	        httpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 30000);
	            
	        post = new HttpPost(url);
	        // 构造消息头
	        post.setHeader("Content-type", "application/json; charset=utf-8");
            
	        // 构建消息实体
	        StringEntity entity = new StringEntity(prasa, Charset.forName("UTF-8"));
	        entity.setContentEncoding("UTF-8");
	        // 发送Json格式的数据请求
	        entity.setContentType("application/json");
	        post.setEntity(entity);
	            
	      org.apache.http.HttpResponse response = httpClient.execute(post);
	        InputStream is=response.getEntity().getContent();
//	        StringBufferInputStream sdf = new StringBufferInputStream(is);
	        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is, "utf-8"));
	        StringBuffer aa=new StringBuffer();
	        while (null != (sd = bufferedReader.readLine())) {
	        	System.out.println("hahah"+sd);
	        	aa.append(sd);
	        }
	sd=aa.toString();
	System.out.println(sd+"333");
	           
	    } catch (Exception e) {
	        e.printStackTrace();
	        isSuccess = false;
	    }finally{
	        if(post != null){
	            try {
	                post.releaseConnection();
	                Thread.sleep(500);
	            } catch (InterruptedException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return sd;
	}

	
	/*---------------------------------------------------*/
	
	public static String sendPostInfoJson(String sPara,
			String gateway, String inputCharset) throws Exception {
		HttpProtocolHandler httpProtocolHandler = HttpProtocolHandler
				.getInstance();

		HttpRequest request = new HttpRequest(HttpResultType.STRING);
		// 设置编码集
		request.setCharset(inputCharset);
		
		request.setRequestBody(sPara);
		Header[] aaa= {new Header("Content-type","application/json")};
		
		request.setHeader(aaa);
		request.setUrl(gateway);

		HttpResponse response = httpProtocolHandler.execute(request);
		if (response == null) {
			return null;
		}

		String strResult = response.getStringResult(inputCharset);

		return strResult;
	}
	
	public static String sendPostInfo(Map<String, String> sPara,
			HttpMethod method, String inputCharset) throws Exception {
		HttpProtocolHandler httpProtocolHandler = HttpProtocolHandler
				.getInstance();

		HttpRequest request = new HttpRequest(HttpResultType.STRING);

		request.setParameters(generatNameValuePair(sPara));

		HttpResponse response = httpProtocolHandler.execute(request,method);
		if (response == null) {
			return null;
		}

		String strResult = response.getStringResult(inputCharset);

		return strResult;
	}
	
	/**
	 * 构造模拟远程HTTP的POST请求，获取返回处理结果
	 * 
	 * @param sParaTemp
	 *            请求参数数组
	 * @param gateway
	 *            网关地址
	 * @return 处理结果
	 * @throws Exception
	 */
	public static String sendGetInfo(Map<String, String> sPara,
			String gateway, String inputCharset) throws Exception {
		HttpProtocolHandler httpProtocolHandler = HttpProtocolHandler
				.getInstance();

		HttpRequest request = new HttpRequest(HttpResultType.BYTES);
		// 设置编码集
		request.setCharset(inputCharset);
		String queryString = PwFunction.createLinkString(sPara);
		System.out.println(queryString);
		request.setQueryString(queryString);
		request.setUrl(gateway);

		request.setMethod(HttpRequest.METHOD_GET);
		HttpResponse response = httpProtocolHandler.execute(request);
		if (response == null) {
			return null;
		}

		String strResult = response.getStringResult(inputCharset);

		return strResult;
	}
	

	public static HttpResponse sendPostInfo(HttpRequest request) throws Exception {
		HttpProtocolHandler httpProtocolHandler = HttpProtocolHandler
				.getInstance();


		HttpResponse response = httpProtocolHandler.execute(request);
		if (response == null) {
			return null;
		}		

		return response;
	}
	//动态组装form表单
	 public static String formSubmitHtml(String url, String type, Map<String, String> param){
	        StringBuffer strBuf = new StringBuffer();
	        strBuf.append("<html><head><title>Deposit Gateway</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"></head><form name=\"f1\" method=\""+type+"\" action=\"" + url + "\">");
	        if (null != param && !param.isEmpty()) {
	        	Set<String> keySet = param.keySet();
	            for(String key : keySet) {
	            	strBuf.append("<input type=\"hidden\" name=\"" + key + "\" value=\"" + param.get(key) + "\"></input>");
	            }
	        }
	        strBuf.append("</form></html><script language=\"JavaScript\">document.f1.submit();</script>");
	        return strBuf.toString();
	    }
}
