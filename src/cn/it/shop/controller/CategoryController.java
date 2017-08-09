package cn.it.shop.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import net.sf.json.JSONObject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.it.shop.model.Account;
import cn.it.shop.model.Category;
import cn.it.shop.service.CategoryService;

@Controller
@RequestMapping(value = "/category")
public class CategoryController {
	
	@Resource
	private CategoryService categoryService;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	
	
	@RequestMapping("/queryJoinAction") 
	@ResponseBody
	public Map<String, Object> queryJoinAccount(String type, int page, int rows) {
		List<Category> categories = categoryService.queryJoinAccount(type, page, rows);
		
		Long total = categoryService.getCount(type);
		Map<String, Object> map = new HashedMap();
		map.put("total", total);
		map.put("rows", categories);
		//JSONObject object = JSONObject.fromObject(map);
		return map;
	}
	

	@RequestMapping("/deleteByIds")
	@ResponseBody
	public String deleteByIds(String ids) {
		try {
			categoryService.deleteByIds(ids);
			return "true";
		}catch (Exception e) {
			return "false";
		}
	}
	
	@RequestMapping("/save")
	public void save(Category category) {
		categoryService.save(category);
	}
	
	@RequestMapping("/update")
	public void update(Category category) {
		categoryService.update(category);
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public List<Category> query() {
		List<Category> categories = categoryService.query();
		for(Category category : categories) {
			category.setAccount(null);
		}
		return categories;
	}
}
