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
    width: 400px;
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
<div style=" text-align: center;"><span id="title" style="font-size:35px; color:red";>fpglink下发DEMO</span></div>
<div>
				<a href="./index.jsp"><input type="button" value="返回上一级"  style='width:200px;height:50px;background-color:green;border-radius:10px; outline:none;border:none;color:white;font-size:16px;letter-spacing:2px;margin:20px 0;display:block;'/></a>
			</div>
<div>

		<table id="formTable">
			<tr>
				<td class="col1"><span style="font-size:16px;">merchantId(商户号):</span></td>
				<td><input id="merchantId" name="merchantId" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="752"/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">batchNo(批次号):</span></td>
				<td><input id="batchNo" name="batchNo" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="<%=System.nanoTime()%>"/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">batchRecord(总笔数):</span></td>
				<td><input id="batchRecord" name="batchRecord" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="1"/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			
			
			<tr>
				<td class="col1"><span style="font-size:16px;">currencyCode(币种):</span></td>
				<td>
					<select style='width:310px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' id="currencyCode" name="currencyCode">
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
				<td class="col1"><span style="font-size:16px;">totalAmount(订单总金额):</span></td>
				<td><input id="totalAmount" name="totalAmount" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value=""/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">payDate(付款日期):</span></td>
				<td><input id="payDate" name="payDate" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value=""/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">isWithdrawNow(下发类型):</span></td>
				<td>
					<select style='width:310px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' id="isWithdrawNow" name="isWithdrawNow">
						<option value="1">1：可结算额度</option>
						<option value="2">2：可垫资额度</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">notifyUrl(异步回调地址):</span></td>
				<td><input id="notifyUrl" name="notifyUrl" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="http://2342r042d6.51mypc.cn/"/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			
			
			<tr>
				<td class="col1"><span style="font-size:16px;">signType(签名类型):</span></td>
				<td><input id="signType" name="signType" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="RSA" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
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
			<!-- <tr>
				<td class="col1"><span style="font-size:16px;">sign(签名数据):</span></td>
				<td><textarea style='resize:none;width:300px;height:150px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' id='sign' name='sign'  readonly="true" value='系统已自动生成' required /></textarea>
						<input id="sign" name="sign" type="text"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							value="此demo中签名数据系统已自动生成"  readonly="true"/>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr> -->
			<tr><td><span style="color:red"><h2>detailsList(本demo以一个批次一单下发为例)</h2></span></td></tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">receiveType(收款类型):</span></td>
				<td>
					<select style='width:310px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' id="receiveType" name="receiveType">
						<option value="个人">个人</option>
						
					</select> 
					
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">accountType(账户类型):</span></td>
				<td>
					<select style='width:310px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' id="accountType" name="accountType">
						<option value="储蓄卡">储蓄卡</option>
						
					</select> 
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">serialNo(商户流水号):</span></td>
				<td><input id="serialNo" name="serialNo"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							type="text" value="<%=System.nanoTime()%>" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">amount(金额):</span></td>
				<td><input id="amount" name="amount"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							type="text" value="" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">bankName(银行名称简码):</span></td>
				<td><select style='width:310px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;' id='bankName' name='bankName'>
						<option value="ICBC">工商银行ICBC</option>
						<option value="ABC">农业银行ABC</option>
						<option value="BOC">中国银行BOC</option>
						<option value="CCB">建设银行CCB</option>
						<option value="CMB">招商银行CMB</option>
						<option value="COMM">交通银行COMM</option>
						<option value="CEB">光大银行CEB</option>
						<option value="CMBC">民生银行CMBC</option>
						<option value="CIB">兴业银行CIB</option>
						<option value="SPABANK">平安银行SPABANK</option>
						<option value="CITIC">中信银行CITIC</option>
						<option value="HXB">华夏银行HXB</option>
						<option value="POSTGC">中国邮政储蓄POSTGC</option>
						<option value="SPDB">浦发银行SPDB</option>
						<option value="GDB">广发银行GDB</option>
				</select></td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">bankNo(银行账户):</span></td>
				<td><input id="bankNo" name="bankNo"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							type="text" value="" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<td class="col1"><span style="font-size:16px;">receiveName(收款人姓名):</span></td>
				<td><input id="receiveName" name="receiveName"
							style='width:300px;height:35px;border-radius: 10px;outline: none;border:1px solid #000;padding-left:10px;'
							type="text" value="" />&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">*必填</span>
				</td>
			</tr>
			<tr>
				<input type='button' id='submit' onclick="test()" value='下发按钮' style='width:200px;height:50px;background-color:green;border-radius:10px; outline:none;border:none;color:white;font-size:16px;letter-spacing:2px;margin:20px 0;display:block;'/>
			</tr>
		</table>
</div>
<!-- </form> -->
</body>
</html>
<script language="javascript">
function test(){
var data={
		merchantId:$("#merchantId").val(),	
		batchNo:$("#batchNo").val(),
		batchRecord:$("#batchRecord").val(),
		currencyCode:$("#currencyCode").val(),
		totalAmount:$("#totalAmount").val(),
		payDate:$("#payDate").val(),
		isWithdrawNow:$("#isWithdrawNow").val(),
		notifyUrl:$("#notifyUrl").val(),
		signType:$("#signType").val(),
		sign:$("#sign").val(),
		privateKey:$("#privateKey").val(),
			receiveType:$("#receiveType").val(),
			accountType:$("#accountType").val(),
			serialNo:$("#serialNo").val(),
			amount:$("#amount").val(),
			bankName:$("#bankName").val(),
			bankNo:$("#bankNo").val(),
			receiveName:$("#receiveName").val(),
		gateway:$("#gateway").val()
}
$.ajax({
	url:"./withdrawal",
	type:"post",
	dataType:"json",
	data:data,
	success:function(result){
		 document.write(result.param);
	}
})
}
</script>
