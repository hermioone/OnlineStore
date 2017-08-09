package cn.it.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.shop.model.Category;
import cn.it.shop.service.CategoryService;
/**
 * Service和Dao整合在一起
 * 模块自身的业务逻辑
 * @author Administrator
 *
 */
@Service("categoryService")
public class CategoryServiceImpl extends BaseServiceImpl<Category> implements CategoryService {
	
	public CategoryServiceImpl() {
		super();
	}

	@Override
	public List<Category> queryJoinAccount(String type, int page, int size) {   
		//这里一定要加FETCH，不然会出现ClassCastException(取出来的数组里面既有Category也有Account)
		//[
		//	[Category [id=1, type=aaa, hot=true], Account [id=1, login=admin, name=管理员, pass=admin]], 
		//	[Category [id=2, type=.., hot=..], Account [id=.., login=.., name=.., pass=..]],
		// 	...
		//]
		return getSession().createQuery("FROM Category c LEFT JOIN FETCH c.account WHERE c.type LIKE :type")
				.setString("type", "%" + type + "%")
				.setFirstResult((page - 1) * size)
				.setMaxResults(size)
				.list();
	}

	@Override
	public Long getCount(String type) {
		String hql = "SELECT count(c) FROM Category c WHERE c.type LIKE :type";
		return (Long) getSession().createQuery(hql).setString("type", "%" + type + "%").uniqueResult();
	}

	@Override
	public void deleteByIds(String ids) {
		String hql = "DELETE FROM Category WHERE id in (" + ids + ")";
		getSession().createQuery(hql)
			.executeUpdate();
		
	}

	@Override
	public List<Category> queryByHot(boolean hot) {
		String hql = "FROM Category c WHERE c.hot = :hot";
		return getSession().createQuery(hql)
				.setBoolean("hot", hot)
				.list();
	}

}
