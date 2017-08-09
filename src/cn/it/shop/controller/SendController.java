package cn.it.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 此Controller用来完成请求转发的功能(jsp与jsp),此Controller不处理任何的逻辑
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/send")
public class SendController {

	@RequestMapping("/back/{path1}/{path2}")
	public String sendBack(@PathVariable() String path1, @PathVariable String path2) {
		return "/WEB-INF/back/" + path1 + "/" + path2;    //转发
	}
	
	@RequestMapping("/front/{path}")
	public String sendFront(@PathVariable() String path) {
		return "/WEB-INF/front/" + path;
	}
}
