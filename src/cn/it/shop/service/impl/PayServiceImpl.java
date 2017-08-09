package cn.it.shop.service.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import cn.it.shop.model.BackData;
import cn.it.shop.model.SendData;
import cn.it.shop.service.PayService;
import cn.it.shop.util.DigestUtil;

@Service("payService")
public class PayServiceImpl implements PayService {
	//密钥
	@Value("#{prop.key}")
	private String key;
	//商户账号(不是订单号)
	@Value("#{prop.p1_MerId}")
	private String p1_MerId;
	//支付成功的地址
	@Value("#{prop.p8_Url}")
	private String p8_Url;
	
	public void setKey(String key) {
		this.key = key;
	}
	
	public void setP1_MerId(String p1_MerId) {
		this.p1_MerId = p1_MerId;
	}
	
	public void setP8_Url(String p8_Url) {
		this.p8_Url = p8_Url;
	}

	// 补全SendData的数据, P2 p3 pd Pa 是前台注入
	private SendData finishSendData(SendData sendData) {
		sendData.setP0_Cmd("Buy");    //固定值
		sendData.setP1_MerId(p1_MerId);   
		sendData.setP4_Cur("CNY");     //交易币种
		sendData.setP5_Pid("");
		sendData.setP6_Pcat("");
		sendData.setP7_Pdesc("");
		sendData.setP8_Url(p8_Url);
		sendData.setP9_SAF("0");       //送货地址
		sendData.setPr_NeedResponse("0");
		return sendData;
	}
	
	// 完成数据的追加，返回的事追加的铭文
	private String joinSendDataParam(SendData sendData) {
		// 填充的所有数据
		sendData = this.finishSendData(sendData);
		StringBuffer infoBuffer = new StringBuffer();
		infoBuffer.append(sendData.getP0_Cmd());
		infoBuffer.append(sendData.getP1_MerId());
		infoBuffer.append(sendData.getP2_Order());
		infoBuffer.append(sendData.getP3_Amt());
		infoBuffer.append(sendData.getP4_Cur());
		infoBuffer.append(sendData.getP5_Pid());
		infoBuffer.append(sendData.getP6_Pcat());
		infoBuffer.append(sendData.getP7_Pdesc());
		infoBuffer.append(sendData.getP8_Url());
		infoBuffer.append(sendData.getP9_SAF());
		infoBuffer.append(sendData.getPa_MP());
		infoBuffer.append(sendData.getPd_FrpId());
		infoBuffer.append(sendData.getPr_NeedResponse());
		return infoBuffer.toString();
	}
	
	//@Override
	/* (non-Javadoc)
	 * @see cn.it.shop.service.impl.PayService#saveDataToRequest(java.util.Map, cn.it.shop.model.SendData)
	 */
	@Override
	public void saveDataToRequest(HttpServletRequest request,
			SendData sendData) {
		// 返回了被追加的字符串，明文
		String joinParam = joinSendDataParam(sendData);
		request.setAttribute("p0_Cmd", sendData.getP0_Cmd());
		request.setAttribute("p1_MerId", sendData.getP1_MerId());
		request.setAttribute("p2_Order", sendData.getP2_Order());
		request.setAttribute("p3_Amt", sendData.getP3_Amt());
		request.setAttribute("p4_Cur", sendData.getP4_Cur());
		request.setAttribute("p5_Pid", sendData.getP5_Pid());
		request.setAttribute("p6_Pcat", sendData.getP6_Pcat());
		request.setAttribute("p7_Pdesc", sendData.getP7_Pdesc());
		request.setAttribute("p8_Url", sendData.getP8_Url());
		request.setAttribute("p9_SAF", sendData.getP9_SAF());
		request.setAttribute("pa_MP", sendData.getPa_MP());
		request.setAttribute("pd_FrpId", sendData.getPd_FrpId());
		request.setAttribute("pr_NeedResponse", sendData.getPr_NeedResponse());
		request.setAttribute("hmac", DigestUtil.hmacSign(joinParam, key));
		return;
	}
	
	/******************************上面是发送请求的方法**************************************/
	// 完成返回数据的追加
	private String joinBackDataParam(BackData backData) {
		// 追加字符串,为加密验证做准备
		StringBuffer infoBuffer = new StringBuffer();
		infoBuffer.append(backData.getP1_MerId());
		infoBuffer.append(backData.getR0_Cmd());
		infoBuffer.append(backData.getR1_Code());
		infoBuffer.append(backData.getR2_TrxId());
		infoBuffer.append(backData.getR3_Amt());
		infoBuffer.append(backData.getR4_Cur());
		infoBuffer.append(backData.getR5_Pid());
		infoBuffer.append(backData.getR6_Order());
		infoBuffer.append(backData.getR7_Uid());
		infoBuffer.append(backData.getR8_MP());
		infoBuffer.append(backData.getR9_BType());
		return infoBuffer.toString();
	}
	
	// 对返回来的数据进行加密,并且和传过来的密文进行比较,如果OK则说明数据没有被篡改
	public boolean checkBackData(BackData backData){
		String joinParam=this.joinBackDataParam(backData);
		// 加密后得到自己的密文
		String md5 = DigestUtil.hmacSign(joinParam.toString(),key);
		// 密文和传过来密文比较
		return md5.equals(backData.getHmac());
	}
	
}
