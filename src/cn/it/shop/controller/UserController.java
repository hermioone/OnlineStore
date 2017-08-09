package cn.it.shop.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.it.shop.model.User;
import cn.it.shop.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/login" )
	public String toLogin(HttpServletRequest request) {
		User oldUser = (User) request.getSession().getAttribute("USER_SESSION");
		if(oldUser != null) {
			return "redirect:/index.jsp";
		}
		return "redirect:/ulogin.jsp";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(User user, HttpServletRequest request) {
		User oldUser = (User) request.getSession().getAttribute("USER_SESSION");
		if(oldUser != null) {
			return "redirect:/index.jsp";
		}
		user = userService.login(user);
		if(user == null) {
			request.getSession().setAttribute("error", "登录失败");
			return "ulogin";
		}
		//登录完成后先存储到session
		request.getSession().setAttribute("USER_SESSION", user);
		//根据session中goURL是否有值来决定页面的跳转
		if(request.getSession().getAttribute("goURL") == null) return "redirect:/index.jsp";
		return "redirect:" + request.getSession().getAttribute("goURL");   
		//redirect:/index.jsp  == http://localhost:8080/shop/index.jsp
	}
}
