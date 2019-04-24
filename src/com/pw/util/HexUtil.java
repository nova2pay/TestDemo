package com.pw.util;

import com.pw.security.Base64;

public class HexUtil {

	/**
	 * 10进制转16进制
	 * 
	 * @param str
	 * @return
	 */
	public static String DecimalToHex(String str) {
		return ByteUtils.toHexAscii(str.getBytes());
	}

	public static byte[] HexToDecimal(String str) {
		return ByteUtils.fromHexAscii(str);
	}

	/**
	 * 16进制转10进制
	 * 
	 * @param str
	 * @return
	 */
	public static String Base64HexToDecimal(String str) {
		return Base64.encode(HexToDecimal(str));
	}
}
