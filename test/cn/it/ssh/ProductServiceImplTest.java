package cn.it.ssh;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.it.shop.service.ProductService;
@RunWith(SpringJUnit4ClassRunner.class)   //spring-test-4.1.3.jar,基于注解的junit测试
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class ProductServiceImplTest {
	
	@Autowired
	private ProductService productService;

	@Test
	public void testQueryJoinCategory() {
		productService.queryJoinCategory("", 1, 10);
	}

	@Test
	public void testGetCount() {
		System.out.println(productService.getCount(""));
		System.out.println(productService.get(1));
	}

}
