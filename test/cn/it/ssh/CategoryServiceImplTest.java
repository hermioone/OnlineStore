package cn.it.ssh;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.it.shop.model.Category;
import cn.it.shop.service.CategoryService;
import cn.it.shop.service.impl.CategoryServiceImpl;


@RunWith(SpringJUnit4ClassRunner.class)   //spring-test-4.1.3.jar,基于注解的junit测试
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class CategoryServiceImplTest {
	
	@Autowired
	private CategoryService categoryServiceImpl;

	@Test
	public void testSave() {
		categoryServiceImpl.save(new Category("abc", true));
	}

	@Test
	public void testUpdate() {
		categoryServiceImpl.update(new Category(1, "男士热点", true));
	}

	@Test
	public void testDelete() {
		categoryServiceImpl.delete(5);
	}

	@Test
	public void testGet() {
		System.out.println(categoryServiceImpl.get(2));
	}

	@Test
	public void testQuery() {
		for(Category category : categoryServiceImpl.query()) {
			System.out.println(category);
		}
	}
	
	@Test
	public void testQueryAccount() {
		List<Category> categories = categoryServiceImpl.queryJoinAccount("", 2, 2);
		for(Category category : categories) {
			System.out.println(category + " : " + category.getAccount());
		}
	}
	
	@Test
	public void testgetCount() {
		Long count = categoryServiceImpl.getCount(""); 
		System.out.println(categoryServiceImpl.getCount(""));
	
	}
	
	@Test
	public void testdeleteByIds() {
		categoryServiceImpl.deleteByIds("2,3,4,5");
	
	}

}
