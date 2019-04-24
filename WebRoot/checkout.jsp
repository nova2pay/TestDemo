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
<div style=" text-align: center;"><span id="title" style="font-size:35px; color:red";>fpglink网关银联/快捷/C2C充值DEMO</span></div>
<div>
				<a href="./index.jsp"><input type="button" value="返回上一级"  style='width:200px;height:50px;background-color:green;border-radius:10px; outline:none;border:none;color:white;font-size:16px;letter-spacing:2px;margin:20px 0;display:block;'/></a>
			</div>
<div>
	<form action="./checkout" method="post" target="_blank">
		<table id="formTable">
			<tr>
				<td class="col1"><span style="font-size:16px;">Version(版本号):</span></td>
				<td><input id="version" name="version" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="1.0"/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">inputCharset(编码集):</span></td>
				<td><input id="inputCharset" name="inputCharset" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="UTF-8"/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">SignType(签名类型):</span></td>
				<td><input id="signType" name="signType" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="RSA"/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Merchant Id(商户号):</span></td>
				<td><input id="merchantId" name="merchantId" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="752"/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Private Key(私钥数据):</span></td>
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
				<td>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Pay Type(交易类型):</span></td>
				<td><!-- <input id="payType" name="payType" type="text" value="EC" />[EC] -->
					<select style='width:310px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' id="payType" name="payType">
						<option value="EC" id="ec" selected>EC</option>
						<option value="NC" >NC</option>
						<option value="CARDBANK" >C2C</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Payment Method(银行ID):</span></td>
				<td><input id="issuingBank" name="issuingBank" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="UNIONPAY" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span><!-- <span style="font-size:16px;">[PSP code or Bank code]</span> -->
				</td>
			</tr>
			<tr id="tr_subIssuingBank">
				<td class="col1"><span style="font-size:16px;">Sub Bank(子银行ID):</span></td>
				<td>
					<!-- <input id="subIssuingBank" name="subIssuingBank" type="text"
					value="" /> -->
					<select style='width:310px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' id="subIssuingBank" name="subIssuingBank">
						<option value="">请选择子银行</option>
						<option value="ICBC">ICBC</option>
						<option value="ABC">ABC</option>
						<option value="BOC">BOC</option>
						<option value="CCB">CCB</option>
						<option value="CMB">CMB</option>
						<option value="COMM">COMM</option>
						<option value="CEB">CEB</option>
						<option value="CMBC">CMBC</option>
						<option value="CIB">CIB</option>
						<option value="SPABANK">SPABANK</option>
						<option value="CITIC">CITIC</option>
						<option value="HXB">HXB</option>
						<option value="POSTGC">POSTGC</option>
						<option value="SPDB">SPDB</option>
						<option value="GDB">GDB</option>
						<option value="HKASB">HKASB</option>
						
				</select>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">可以为空</span>
				</td>
			</tr>
			
			<tr>
				<td class="col1"><span style="font-size:16px;">Synchronous URL(同步通知地址):</span></td>
				<td><input id="returnUrl" name="returnUrl" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							size="79" value="http://test.zhdayue.com/settleAccount/mytest.html" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Asynchronous URL(异步通知地址):</span></td>
				<td><input id="notifyUrl" name="notifyUrl" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							size="79" value="http://test.zhdayue.com/settleAccount/mytest.html" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
					<!-- <td><input id="notifyUrl" name="notifyUrl" type="text"
					size="79" value="http://www.qmqhaitao.com/NMS/payment/gateway/nova2Pay/mytest.html" /></td> -->
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Trade No(商户订单号):</span></td>
				<td><input id="merchantTradeId" name="merchantTradeId"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							type="text" value="<%=System.nanoTime()%>" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">Description(商品名称/说明):</span></td>
				<td><input id="goodsTitle" name="goodsTitle" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="payment test" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">DeviceType(设备类型):</span></td>
				<td>
					<!-- <select id="deviceType" name="deviceType">
						<option value="WEB">WEB</option>
						<option value="H5">H5</option>
					</select> -->
					<select style='width:310px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' id="deviceType" name="deviceType">
						<option value="">请选择设备类型</option>
						<option value="WEB" id="pc">PC</option>
						<option value="H5" id="mobile">MOBILE</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">可以为空</span>
				</td>
			</tr>
			<tr id="tr_cardType">
				<td class="col1"><span style="font-size:16px;">CardType(银行卡类型):</span></td>
				<td>
					<!-- <select id="cardType" name="cardType">
						<option value="D">Debit Card</option>
						<option value="C">Credit Card</option>
					</select> -->
					<select style='width:310px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' id="cardType" name="cardType">
						<option value="D">D</option>
						<option value="C" id="C">C</option>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
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
				<td><input id="amountFee" name="amountFee" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="0.1" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr id="pcard">
				<td class="col1"><span style="font-size:16px;">paymentCard(支付卡号):</span></td>
				<td><input id="paymentCard" name="paymentCard" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="" />
				</td>
			</tr>
			<tr id= "uname">
				<td class="col1"><span style="font-size:16px;">userName(卡名称):</span></td>
				<td><input id="userName" name="userName" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="" />
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit"  style='width:200px;height:50px;background-color:green;border-radius:10px; outline:none;border:none;color:white;font-size:16px;letter-spacing:2px;margin:20px 0;display:block;'/></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>
<script language="javascript">
$(function(){
	$("#pcard").hide();
	$("#uname").hide();
	$("#mobile").attr("disabled","true");
	$('#C').attr("disabled","true");
	/* $('#ec').attr("disabled","true"); */
	$("#tr_cardType").hide();
	
})
	$("#payType").bind("change",function(){
		if($("#payType").val()=="EC"){
			$("#tr_subIssuingBank").show();
			$("#tr_cardType").hide();
			$("#pcard").hide();
			$("#uname").hide();
			$("#mobile").attr("disabled","true");
		}else if($("#payType").val()=="NC"){
			$("#tr_subIssuingBank").hide();
			$("#pcard").hide();
			$("#uname").hide();
			$("#tr_cardType").show();
			$("#mobile").attr("disabled",false);
		}else if($("#payType").val()=="CARDBANK"){
			$("#tr_subIssuingBank").hide();
			$("#tr_cardType").show();
			$("#pcard").show();
			$("#uname").show();
			$("#mobile").attr("disabled",false);
		}
	})
	

</script>
