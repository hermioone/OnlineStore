package cn.it.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.it.shop.model.User;

public class UserInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object object) throws Exception {
		User user = (User) request.getSession().getAttribute("USER_SESSION");
		if(null == user){
			//非法请求
			request.getSession().setAttribute("error", "非法请求，请登录");
			//获取当前客户想要去的url地址和参数
			//request.getRequestURI()  //返回带工程名的  比如:/shop/send/front/confirm.action
			String goURL = request.getServletPath();   //返回不带工程名的，比如:/send/front/confirm
			String param = request.getQueryString();   //参数
			if(param != null) {
				goURL = goURL + "?" + param;
			}
			//把当前客户想要访问的地址存到session中
			request.getSession().setAttribute("goURL", goURL);
			response.sendRedirect(request.getContextPath() + "/ulogin.jsp");
			return false;
		}
		return true;
	}

}
