package cn.it.shop.listener;

import java.util.ArrayList;
import java.util.List;
import java.util.Timer;

import javax.annotation.Resource;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.it.shop.model.Category;
import cn.it.shop.model.Product;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.ProductService;
import cn.it.shop.util.FileUpload;
import cn.it.shop.util.ProductTimerTask;

/**
 * 用于项目启动的时候数据初始化
 * 解决方案二：启动的时候tomcat加载web.xml，是tomcat实例化的这个监听器，不是spring，所以不能用@Resource注入productService
 * @author Administrator
 *
 */

public class InitDataListener implements ServletContextListener {
	
	
	//解决方案一：不能new，因为new的话那么productService中的自动注入就失效了
	private ApplicationContext context;
	
	private ProductTimerTask productTimerTask = null;
	
	private FileUpload fileUpload = null;

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		//1.获取业务逻辑类，查询商品信息

	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		/*//解决方案三：不可取，会把spring配置文件加载两次，一次是这个监听器，一次是监听spring的监听器
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext-*.xml");
		productService = (ProductService) context.getBean("productService");
		System.out.println(productService);*/
		
		/*//2.项目在启动的时候把Spring配置文件通过监听器加载，存储在ServletContext中，只需要获取即可
		//解决方案四：直接到ServletContext中获取Spring配置文件，此方案的key不容易记住
		ApplicationContext context = (ApplicationContext) event.getServletContext()
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		productService = (ProductService) context.getBean("productServiceImpl");
		System.out.println("productServiceImpl" + productService);*/
		
		//解决方案五：通过工具类加载即可
		context = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		
		productTimerTask = (ProductTimerTask) context.getBean("productTimerTask");
		fileUpload = (FileUpload) context.getBean("fileUpload");
		//把内置对象交给productTimerTask
		productTimerTask.setApplication(event.getServletContext());
		//通过设置定时器，让首页的数据每隔一小时同步一次
		//守护线程:主线程结束了，那这个线程也结束了
		//非守护线程:主线程结束了，这个线程还会接着运行
		//要设置成守护线程
		new Timer(true).schedule(productTimerTask, 0, 1000 * 60 * 60);
		
		
		//项目启动时候要加载银行的图标
		event.getServletContext().setAttribute("bankList", fileUpload.getBankImage());
	}

}
