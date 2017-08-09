package cn.it.shop.controller;

import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Sorder;
import cn.it.shop.model.User;
import cn.it.shop.service.ForderService;

@Controller
@RequestMapping("/forder")
public class ForderController {
	
	@Resource
	private ForderService forderService;
	
	/**
	 * 实现购物车(订单)和购物项(订单项)级联入库
	 * @return
	 */
	@RequestMapping("/save")
	public String save(HttpServletRequest request, String post, String address, String name, String phone, String remark) {
		//把session中的购物项交给Forder对象
		Forder forder = (Forder) request.getSession().getAttribute("forder");
		forder.setAddress(address);
		forder.setPost(post);
		forder.setUser((User)request.getSession().getAttribute("USER_SESSION"));
		forder.setName(name);
		forder.setPhone(phone);
		forder.setRemark(remark);
		//级联入库(需要在Forder.hbm.xml中配置inverse和cascade)
		//需要sorder关联forder，在SorderServiceImpl中添加代码(sorder.setForder(forder)  )
		forderService.save(forder);
		request.getSession().setAttribute("oldForder", request.getSession().getAttribute("forder"));
		request.getSession().setAttribute("forder", new Forder());
		return "redirect:/send/front/bank";  //redirect:后面不要工程名
	}
	
	@RequestMapping("/showCart")
	public String showCart() {
		return "showCar";
	}
}
