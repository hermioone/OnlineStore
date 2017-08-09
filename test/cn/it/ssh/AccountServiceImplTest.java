package cn.it.ssh;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.it.shop.model.Account;
import cn.it.shop.service.AccountService;


@RunWith(SpringJUnit4ClassRunner.class)   //spring-test-4.1.3.jar,基于注解的junit测试
@ContextConfiguration(locations="classpath:applicationContext-*.xml")
public class AccountServiceImplTest {
	
	@Autowired
	private AccountService accountService;

	@Test
	public void testSave() {
		accountService.save(new Account("admin", "root", "root"));
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testGet() {
		fail("Not yet implemented");
	}

	@Test
	public void testQuery() {
		fail("Not yet implemented");
	}

}
