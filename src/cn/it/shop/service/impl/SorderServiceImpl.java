package cn.it.shop.service.impl;

import org.springframework.stereotype.Service;

import cn.it.shop.model.Forder;
import cn.it.shop.model.Product;
import cn.it.shop.model.Sorder;
import cn.it.shop.service.SorderService;

@Service("sorderService")
public class SorderServiceImpl extends BaseServiceImpl<Sorder> implements SorderService{

	@Override
	public void addSorder(Product product, Forder forder) {
		Sorder sorder = toSorder(product);
		//判断当前购物项是否重复，如果重复，则添加数量即可
		boolean flag = false;
		for(Sorder temp : forder.getSorderList()) {
			if(temp.getProduct().getId().equals(sorder.getProduct().getId())) {
				//购物项有重复，添加数量即可
				temp.setNumber(temp.getNumber() + 1);
				flag = true;
				break;
			}
		}
		//当前购物项在购物车中不存在
		if(!flag) {
			//简历购物项和购物车之间的关联，此时forder.id为null(因为forder是从session中取出来的，不是从数据库查出来的)，
			//但是在入库的时候是先入库购物车，再入库购物项，那时就有主键了
			sorder.setForder(forder);  
			forder.getSorderList().add(sorder);
		}
		return;
	}

	@Override
	public Sorder toSorder(Product product) {
		Sorder sorder = new Sorder();
		sorder.setName(product.getName());
		sorder.setNumber(1);
		sorder.setPrice(product.getPrice());
		sorder.setProduct(product);
		return sorder;
	}

	@Override
	public Forder updateSorder(Sorder sorder, Forder forder) {
		for(Sorder temp : forder.getSorderList()) {
			if(temp.getProduct().getId().equals(sorder.getProduct().getId())) {
				temp.setNumber(sorder.getNumber());
			}
		}
		return forder;
	}
	

}
