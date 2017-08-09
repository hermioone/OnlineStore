package cn.it.shop.controller;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;



import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.fasterxml.jackson.core.JsonProcessingException;


import cn.it.shop.model.Product;
import cn.it.shop.service.ProductService;
import cn.it.shop.util.FileUpload;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	@Resource
	private ProductService productService;
	
	@Resource
	private FileUpload fileUpload;
	
	@RequestMapping("/queryJoinCategory")
	@ResponseBody
	public Map<String, Object> queryJoinCategory(String name, int page, int rows) throws JsonProcessingException {
		List<Product> products = productService.queryJoinCategory(name, page, rows);
		for(Product product : products) {
			product.getCategory().setAccount(null);
		}
		Long count = productService.getCount(name);
		Map<String, Object> map = new HashedMap();
		map.put("total", count);
		map.put("rows", products);
		return map;
	}
	
	@RequestMapping("/save") 
	public void save(Product product, MultipartFile upload) throws IllegalStateException, IOException {
		//实现文件上传的功能，然后把生成的唯一UUID文件名交给pic，然后商品数据入库
		String pic = fileUpload.uploadFile(upload);

		// 设置图片名到商品中
		product.setPic(pic);
		//商品信息入库
		productService.save(product);

	}
	
	@RequestMapping("/get")
	public String get(Model model, int id) {
		Product product = productService.get(id);
		model.addAttribute("product", product);
		return "detail";
	}
	
}
