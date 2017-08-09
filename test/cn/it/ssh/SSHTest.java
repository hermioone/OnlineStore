package cn.it.ssh;



import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.it.shop.model.Category;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.impl.CategoryServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)   //spring-test-4.1.3.jar,基于注解的junit测试
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class SSHTest {
/*	@Resource  //参照bean中id的名字
	private Date date;*/
	
	@Resource
	private CategoryService categoryService;
	
/*	@Test  //测试spring IOC的开发环境
	public void springIOC() {
		System.out.println(date);
	}*/
	
	//测试Hibernate开发环境，因为没有整合可以直接new
	@Test
	public void hibernate() {
		categoryService.save(new Category("女士热点", true));
	}
	
	@Test
	public void hibernateAndSpring() {
		categoryService.update(new Category(1, "男士热点", true));
	}

}
