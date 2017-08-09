package cn.it.shop.util;

import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import cn.it.shop.model.Category;
import cn.it.shop.model.Product;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.ProductService;

/**
 * 设置一个任务，用来加载首页商品信息，因为首页的商品是在tomcat启动时加载的，所以添加的商品信息如果tomcat不启动，就不会显示在首页上
 * @author Administrator
 *
 */
@Component("productTimerTask")
public class ProductTimerTask extends TimerTask {
	
	@Resource
	private CategoryService categoryService;
	@Resource
	private ProductService productService;
	
	private ServletContext application = null;
	public void setApplication(ServletContext application) {
		this.application = application;
	}


	@Override
	public void run() {
		List<List<Product>> result = new ArrayList<List<Product>>();
		//查询出热点类别
		for(Category category : categoryService.queryByHot(true)) {
			//根据热点类别id获得推荐商品信息
			result.add(productService.queryByCid(category.getId()));		
		}
		application.setAttribute("bigList", result);
	}

}
