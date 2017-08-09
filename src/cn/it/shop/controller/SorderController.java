package cn.it.shop.controller;

import java.util.HashSet;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Sorder;
import cn.it.shop.service.ForderService;
import cn.it.shop.service.ProductService;
import cn.it.shop.service.SorderService;

@Controller
@RequestMapping("/sorder")
public class SorderController {
	
	@Resource
	private ProductService productService;
	
	@Resource
	private ForderService forderService;
	
	@Resource
	private SorderService sorderService;
	
	@RequestMapping("/addSorder")
	public String addSorder(int id, HttpServletRequest request) {
		//1.根据商品id获取响应的商品数据
		Product product = productService.get(id);
		//2.判断当前session中是否有购物车，如果没有则创建
		HttpSession session = request.getSession();
		if(session.getAttribute("forder") == null) {
			session.setAttribute("forder", new Forder());
		}
		//3.把商品信息转化为sorder，并且添加到购物车中(判断购物项是否重复)
		Forder forder = (Forder) session.getAttribute("forder");
		sorderService.addSorder(product, forder);
		//4.计算购物的总价格
		forder.setTotal(forderService.calTotal(forder));
		//5.把新的购物车存储到session中
		session.setAttribute("forder", forder);
		return "redirect:showCart.action";
	}
	
	@RequestMapping("/showCart")
	public String showCart() {
		return "showCar";
	}
	
	//根据商品编号更新商品数量
	@RequestMapping("/updateSorder")
	@ResponseBody
	public String updateSorder(Sorder sorder, HttpServletRequest request) {
		Forder forder = (Forder) request.getSession().getAttribute("forder");
		forder = sorderService.updateSorder(sorder, forder);
		forder.setTotal(forderService.calTotal(forder));
		request.getSession().setAttribute("forder", forder);
		return forder.getTotal().toString();
	}
}
