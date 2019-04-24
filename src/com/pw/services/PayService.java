package com.pw.services;

import java.util.Map;

import com.pw.util.PwSubmit;

/**
 * 外卡支付   支付业务类
 * 页面及逻辑请看wildcard.jsp，pwto3.jsp
 */
public class PayService {

	public static String forward3(Map<String, String> sParaTemp)
			throws Exception {

		// 增加基本配置
		String strButtonName = "确认";

		return PwSubmit.buildForm3(sParaTemp, "post", strButtonName);
	}

	
	
	/*@RequestMapping(value = "/queryOrderExists.html", method = RequestMethod.POST)
	public void queryOrderExists(HttpServletRequest request, HttpServletResponse response) {
		JsonResult jsonResult = JsonResult.ERROR_RESULT;
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String startTime = RequestUtil.getParameterNullSafe(request, "startTime");
			String endTime = RequestUtil.getParameterNullSafe(request, "endTime");
			String orderNo = RequestUtil.getParameterNullSafe(request, "orderNo");
			if(StringUtil.isEmpty(orderNo)) {
				throw new ParameterException("1003", "parameter[" + orderNo + "] can not be null");
			}
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			format.setLenient(false);
			Map<String, Object> map = new HashMap<String,Object>();
			if (TextUtils.isEmpty(startTime)) {
				map.put("startTime", format.format(new Date()));
			} else {
				map.put("startTime", startTime);
			}
			if (TextUtils.isEmpty(endTime)) {
				map.put("endTime", format.format(new Date()));
			} else {
				map.put("endTime", endTime);
			}
			map.put("orderNo", orderNo);
			Map<String, Object> retMap = new HashMap<String,Object>();
			List<PwTradeRecord> queryResult = pwTradeRecordService.queryOrderExists(map);
			if(queryResult == null || queryResult.size() == 0) {
				List<PwMidDisSummary> queryMidResult = pwMidDisService.queryOrderExists(map);
				if(queryMidResult == null || queryMidResult.size() == 0) {
					retMap.put("queryResult", null);
				}else {
					List<Object> rechargeList = new ArrayList<Object>();
					for (PwMidDisSummary pwMidDisSummary : queryMidResult) {
						Map<String, Object> item = new HashMap<String, Object>();
						item.put("MerchantId", new Integer(pwMidDisSummary.getMerchantId()) == null ? "" : pwMidDisSummary.getMerchantId());
						item.put("BatchNo", pwMidDisSummary.getBatchNo() == null ? "" : pwMidDisSummary.getBatchNo());
						item.put("TotalAmount", pwMidDisSummary.getTotalAmount() == null ? "" : pwMidDisSummary.getTotalAmount());
						item.put("TotalFactorge", pwMidDisSummary.getTotalFactorge() == null ? "" : pwMidDisSummary.getTotalFactorge());
						item.put("IsWithdrawNow", new Integer(pwMidDisSummary.getIsWithdrawNow()) == null ? "" : pwMidDisSummary.getIsWithdrawNow());
						item.put("CreateTime", pwMidDisSummary.getCreateTime() == null ? "" : pwMidDisSummary.getCreateTime());
						item.put("UpdateTime", pwMidDisSummary.getUpdateTime() == null ? "" : pwMidDisSummary.getUpdateTime());
						item.put("Status", new Integer(pwMidDisSummary.getStatus()) == null ? "" : pwMidDisSummary.getStatus());
						rechargeList.add(item);
					}
					retMap.put("orderType", "withdrawal");
					retMap.put("queryResult", rechargeList);
				}
			}else {
				List<Object> rechargeList = new ArrayList<Object>();
				for (PwTradeRecord pwTradeRecord : queryResult) {
					Map<String, Object> item = new HashMap<String, Object>();
					item.put("MerchantId", new Integer(pwTradeRecord.getMerchantId().getId()) == null ? "" : pwTradeRecord.getMerchantId().getId());
					item.put("PwTradeId", pwTradeRecord.getPwTradeId() == null ? "" : pwTradeRecord.getPwTradeId());
					item.put("MerchantTradeId", pwTradeRecord.getMerchantTradeId() == null ? "" : pwTradeRecord.getMerchantTradeId());
					item.put("BankTradeId", pwTradeRecord.getBankTradeId() == null ? "" : pwTradeRecord.getBankTradeId());
					item.put("TradeTime", pwTradeRecord.getTradeTime() == null ? "" : pwTradeRecord.getTradeTime());
					item.put("PaymentCompletionTime", pwTradeRecord.getPaymentCompletionTime() == null ? "" : pwTradeRecord.getPaymentCompletionTime());
					item.put("Amount", pwTradeRecord.getAmount() == null ? "" : pwTradeRecord.getAmount());
					item.put("Factorage", pwTradeRecord.getFactorage() == null ? "" : pwTradeRecord.getFactorage());
					item.put("ErrorMsg", pwTradeRecord.getErrorMsg() == null ? "" : pwTradeRecord.getErrorMsg());
					item.put("PaymentStatus", pwTradeRecord.getPaymentStatus() == null ? "" : pwTradeRecord.getPaymentStatus());
					item.put("PspProductId", pwTradeRecord.getPspProductId().getProductType().getName() == null ? "" : pwTradeRecord.getPspProductId().getProductType().getName());
					rechargeList.add(item);
				}
				retMap.put("orderType", "payment");
				retMap.put("queryResult", rechargeList);
			}
			logger.info(retMap);
			jsonResult = JsonResult.getResult(retMap);
		}catch (Exception e) {
			String errorCode = "";
			String errorMsg = "";
			logger.info(e.getMessage(), e);
			if (e instanceof ParameterException) {
				errorCode = ((ParameterException) e).getErrorCode();
				errorMsg = ((ParameterException) e).getErrorMsg();
			} else {
				PwSystemException pe = new PwSystemException("SYSTEM_EXCEPTION", redis.getMessage("SYSTEM_EXCEPTION"));
				errorCode = pe.getErrorCode();
				errorMsg = pe.getErrorMsg();
			}
			jsonResult.setErrorCode(errorCode);
			jsonResult.setErrorMsg(errorMsg);
		}finally {
			String data = jsonResult.toJson();
			logger.info(data);
			out.print(data);
		}
	}
	*/
}
