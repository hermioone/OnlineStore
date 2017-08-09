package cn.it.shop.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.it.shop.model.BackData;
import cn.it.shop.model.Forder;
import cn.it.shop.model.SendData;
import cn.it.shop.model.Status;
import cn.it.shop.model.User;
import cn.it.shop.service.ForderService;
import cn.it.shop.service.PayService;
/**
 * struts处理流程:获取请求后，先创建Action处理，在创建代理的时候顺便创建了Action,执行18个拦截器，拦截器执行成功在调用Action的方法
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/bank")
public class BankController {
	
	@Resource
	private PayService payService;
	
	@Resource
	private ForderService forderService;
	
	@RequestMapping("/pay") 
	public String pay(String pd_FrpId, HttpServletRequest request) {
		//1.补全参数
		//2.对参数进行追加
		//3.加密获取签名
		//4.存储到request域中
		//5.跳转到支付页面
		SendData sendData = new SendData();
		Forder forder = (Forder) request.getSession().getAttribute("oldForder");
		User user = (User) request.getSession().getAttribute("USER_SESSION");
		sendData.setP2_Order(forder.getId().toString());
		sendData.setP3_Amt(forder.getTotal().toString());
		sendData.setPa_MP(user.getEmail() + "," + user.getPhone());
		sendData.setPd_FrpId(pd_FrpId);
		payService.saveDataToRequest(request, sendData);
		return "/WEB-INF/front/pay";
	}
	
	@RequestMapping("/back")
	public String back(BackData data, HttpServletRequest request) {
		if(data.getR1_Code().equals("1")) {
			//1.更新订单状态
			int id = Integer.parseInt(data.getR6_Order());
			forderService.updateStatusById(id, 2);
		}
		return "redirect:/index.jsp";
	}
}
