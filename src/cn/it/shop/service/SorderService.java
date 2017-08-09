package cn.it.shop.service;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Sorder;

public interface SorderService extends BaseService<Sorder> {
	//把购物项添加到购物车中
	public void addSorder(Product product, Forder forder);
	
	//把Product数据转化成Sorder
	public Sorder toSorder(Product product);
	
	public Forder updateSorder(Sorder sorder, Forder forder);
}
