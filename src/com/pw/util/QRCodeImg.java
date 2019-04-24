package com.pw.util;


import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;


public class QRCodeImg {

	private static Log logger = LogFactory.getLog(QRCodeImg.class);
	/**
	 * 
	 */
	private static final long serialVersionUID = -6825780031715175111L;

	public void init() throws ServletException {
	}

	public void service(HttpServletRequest request, HttpServletResponse response,String geturl) throws ServletException,
			IOException {
		ServletOutputStream stream = response.getOutputStream();
		String url = URLDecoder.decode(geturl);

		int width = 300;// 图片的宽度
		int height = 300;// 高度
		logger.info("生成二维码url:" + url.toString());
		QRCodeWriter writer = new QRCodeWriter();
		BitMatrix m;
		try {
			m = writer.encode(url.toString(), BarcodeFormat.QR_CODE, height, width);
			MatrixToImageWriter.writeToStream(m, "png", stream);
		} catch (WriterException e) {
			logger.info(e.getMessage(), e);
			e.printStackTrace();
		} finally {
			if (stream != null) {
				stream.flush();
				stream.close();
			}
		}
	}
}
