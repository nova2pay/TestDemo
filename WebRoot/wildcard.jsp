<%@ page contentType="text/html; charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>Payment test</title>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
body {
	font: 12px/1.5 tahoma, arial, 宋体b8b\4f53;
}


#formTable tr td{
    margin: 15px;
    width: 250px;
}
div{
	margin:20px;
}
a{
	text-decoration:none;
}



</style>
</head>
<body>
<div style=" text-align: center;"><span id="title" style="font-size:35px; color:red";>fpglink外卡DEMO</span></div>
		<div>
				<a href="./index.jsp"><input type="button" value="返回上一级"  style='width:200px;height:50px;background-color:green;border-radius:10px; outline:none;border:none;color:white;font-size:16px;letter-spacing:2px;margin:20px 0;display:block;'/></a>
			</div>
<div>
	<form action="pwto3.jsp" method="post" target="_blank">
		<table>
			<tr>
				<td class="col1"><span style="font-size:16px;">Merchant Id:</span></td>
				<td><input id="merchantId" name="merchantId" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="752" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Sub Merchant Id:</span></td>
				<td><input id="sub_app_id" name="sub_app_id" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Private Key:</span></td>
				<td><textarea name="privateKey" rows="15" cols="80"
						id="privateKey">MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALVhKEW/vMjKTa00r3P4/6UWOwP3
qECxKSf7WBKEuySdFsF/So5BysLbNwto3O99cxbuSDz/86E7/WoA+d5NsHwl6hi2ps5wH0E0rN4X
ogW4ZvzIKk/BFxLT2zByUqO6SGRkV0noXHUHRqtsSEzdf5l7frsSsdcYT76WjWiZO8ApAgMBAAEC
gYAsjXr49woGQDsoSoK2d/lDsdw5M0Iu8dVsLr8JfXUCn1uRmBTWMK7/gh1ZPh7W7PeyMEGqSiyr
9DJhMXAu/OJWkorN2g+tWn7ZYVHqtwoWLbHtbTZCLHHPiGvWSYDRKRrHN46ibl3cT+yxHgODT0+b
7yr3gQzJaoHQJqYNZEFsoQJBAN2G6kQSQHMxHMWdile08G5WyaOtUqdnW72mRflHIzt6fcIoBuyM
kdUYP5SHBMPvKvkE12KDPJ9tRv80aTvczgUCQQDRmt22VTU/r6Wn1+PgKfBd8JlxFIS03TqQ02PR
9GabbhEWj+r2dtJ4S7qlFE3PyxerTLcg/Y1pWBqmKmb7LN7VAkEAksqKw46gnHQnz58EA/hG9aaW
uNnqEjnAJdxfM756zzfsy1JAvFCtddo6j04kzzzVaetWWdYCvtXnnMZ7EQrQjQJANmFSglqq/QHq
HZiyY1ceKJEijib/oxj+d9KQREl/UXYF8u+VyynawyEKpIeXBIExe9zkaie+R4V3LIM1wpbKnQJB
ALsqiQX9MOemmo9iSAnLKT2G+S2P4H1uJY9eA/kdMaTW5s9bUKSvhxdc+DtTPi5WwgphrBzDaer6
6uAk+SnzfpE=</textarea></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">SecurityKey:</span></td>
				<td><input id="securityKey" name="securityKey" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="6fe10108c39cb752982ff3061067f09c" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">SignType:</span></td>
				<td><input id="signType" name="signType" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="RSA" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">CharSet:</span></td>
				<td><input id="inputCharset" name="inputCharset" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="UTF-8" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Asynchronous URL:</span></td>
				<td><input id="notifyUrl" name="notifyUrl" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					size="79"
					value="http://test-nms.nova2pay.com/CLIENT/notify_url.jsp" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Trade No:</span></td>
				<td><input id="merchantTradeId" name="merchantTradeId" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					type="text" value="<%=System.nanoTime()%>" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Description:</span></td>
				<td><input id="goodsTitle" name="goodsTitle" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="payment test" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Currency:</span></td>
				<td><input id="currency" name="currency" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="USD" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Amount:</span></td>
				<td><input id="amountFee" name="amountFee" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="1" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Name:</span></td>
				<td><input id="firstName" name="firstName" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="John" />
					&nbsp;
					<input id="lastName" name="lastName" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="Smith" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Payment Method:</span></td>
				<td><input id="issuingBank" name="issuingBank" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="VISA" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Phone:</span></td>
				<td><input id="phone" name="phone" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' 
					value="15125487547" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Email:</span></td>
				<td><input id="email" name="email" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="sean0913@gmail.com" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Country:</span></td>
				<td><input id="country" name="country" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' value="CHN" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">State:</span></td>
				<td><input id="state" name="state" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' value="SHANGHAI" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">City:</span></td>
				<td><input id="city" name="city" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' value="SHANGHAI" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Address:</span></td>
				<td><input id="address" name="address" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="WAN RONG ROAD" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Zip Code:</span></td>
				<td><input id="zip" name="zip" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' value="200000" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Card Number:</span></td>
				<td><input id="cardNo" name="cardNo" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="4775889400000171" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Expiration Date:</span></td>
				<td><input id="expire" name="expire" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' value="1217" />(MMYY)</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;"><span style="font-size:16px;">CVV:</span></td>
				<td><input id="cvv" name="cvv" type="text" value="313"  style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'/></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">IP:</span></td>
				<td><input id="payIp" name="payIp" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' 
					value="112.65.137.210" /></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">终端号:</span></td>
				<td><input id="terminalNo" name="terminalNo" type="text" style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
					value="" /></td>
			</tr>
			<tr>
				<td colspan="2" align="left"><input type="submit" style='width:200px;height:50px;background-color:green;border-radius:10px; outline:none;border:none;color:white;font-size:16px;letter-spacing:2px;margin:20px 0;display:block;'
					value="Submit" /></td>
			</tr>
		</table>
	</form>

</div>
</body>
</html>
<script language="javascript">

</script>
