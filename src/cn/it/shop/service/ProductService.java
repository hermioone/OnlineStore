package cn.it.shop.service;

import java.util.List;

import cn.it.shop.model.Product;

public interface ProductService extends BaseService<Product> {

	public List<Product> queryJoinCategory(String name, int page, int size);
	
	public Long getCount(String name);
	
	//根据热点类别查询当前类别推荐商品(仅仅查询前四个)
	public List<Product> queryByCid(int cid);

}
