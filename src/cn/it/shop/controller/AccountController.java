package cn.it.shop.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.it.shop.model.Account;
import cn.it.shop.service.AccountService;

@Controller
@RequestMapping(value = "/account")
public class AccountController {
	
	@Resource
	private AccountService accountService;
	
	@RequestMapping("/query")
	public @ResponseBody List<Account> query() {
		List<Account> accounts = accountService.query();
		return accounts;
	}
}
