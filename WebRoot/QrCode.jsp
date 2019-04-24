<%@page import="com.pw.util.QRCodeImg"%>
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
<div style=" text-align: center;"><span id="title" style="font-size:35px; color:red";>fpglink二维码DEMO</span></div>
<div>
				<a href="./index.jsp"><input type="button" value="返回上一级"  style='width:200px;height:50px;background-color:green;border-radius:10px; outline:none;border:none;color:white;font-size:16px;letter-spacing:2px;margin:20px 0;display:block;'/></a>
			</div>
<div>

	<form action="./QrCode" method="post" target="_blank">
		<table id="formTable">
			<tr>
				<td class="col1"><span style="font-size:16px;">app Id(商户号):</span></td>
				<td><input id="app_id" name="app_id" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="752"/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
		
			<tr>
				<td class="col1"><span style="font-size:16px;">Currency(币种):</span></td>
				<td><!-- <input id="currency" name="currency" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="CNY" /> -->
					<select style='width:310px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' id="currency" name="currency">
                            <option value="CNY">CNY</option>
                            <option value="AUD">AUD</option>
                            <option value="BRL">BRL</option>
                            <option value="CAD">CAD</option>
                            <option value="DKK">DKK</option>
                            <option value="EUR">EUR</option>
                            <option value="GBP">GBP</option>
                            <option value="HKD">HKD</option>
                            <option value="ISK">ISK</option>
                            <option value="JPY">JPY</option>
                            <option value="INR">INR</option>
                            <option value="MYR">MYR</option>
                            <option value="MXN">MXN</option>
                            <option value="NZD">NZD</option>
                            <option value="NOK">NOK</option>
                            <option value="SGD">SGD</option>
                            <option value="ZAR">ZAR</option>
                            <option value="SEK">SEK</option>
                            <option value="CHF">CHF</option>
                            <option value="TWD">TWD</option>
                            <option value="USD">USD</option>
                        </select>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Amount(金额):</span></td>
				<td><input id="amount" name="amount" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="10.00" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">order_no(商户订单号):</span></td>
				<td><input id="order_no" name="order_no"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							type="text" value="<%=System.nanoTime()%>" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			
			<tr>
				<td class="col1"><span style="font-size:16px;">payment_channel(支付类型):</span></td>
				<td>
					<select style='width:310px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' id="payment_channel" name="payment_channel">
						<option value="WECHAT">WECHAT</option>
						<option value="UNIONPAY">UNIONPAY</option>
						<option value="ALIPAY">ALIPAY</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit"  style='width:200px;height:50px;background-color:green;border-radius:10px; outline:none;border:none;color:white;font-size:16px;letter-spacing:2px;margin:20px 0;display:block;'/></td>
			</tr>
		</table>
</div>
</form>
</body>
</html>
<script language="javascript">

</script>
