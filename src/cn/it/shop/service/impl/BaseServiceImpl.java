package cn.it.shop.service.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import cn.it.shop.model.Category;
import cn.it.shop.service.BaseService;


@Service("baseService")  
@Lazy //这里必须设置为多例，因为@Service默认为单例，这样就会在spring容器启动时创建，这样构造器中的this就指BaseServiceImpl对象本身，
		//父类就是Object类，不是一个泛型类，会报错
		//也就意味着BaseServiceImpl只能作为父类被初始化，比如在CategoryServiceImpl初始化中调用BaseServiceImpl初始化
public class BaseServiceImpl<T> implements BaseService<T>{
	
	private Class clazz;   //clazz存储当前操作的类型
	
	public BaseServiceImpl() {
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();  
		clazz = (Class) type.getActualTypeArguments()[0];   //可能不止一个泛型
		//获取父类，包括泛型信息, (this:CategoryServiceImpl, this.getGenericSuperclass: BaseServiceImpl<Category>)
	}
	
	@Autowired
	private SessionFactory sessionFactory;

	
	protected Session getSession() {
		//从当前线程获取session，如果没有，则创建新的
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void save(T t) {
		getSession().save(t);
	}

	@Override
	public void update(T t) {
		// TODO Auto-generated method stub
		getSession().update(t);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		String hql = "DELETE " + clazz.getSimpleName() + " WHERE id = :id";
		getSession().createQuery(hql).setInteger("id", id).executeUpdate();
	}

	@Override
	public T get(int id) {
		return (T) getSession().get(clazz, id);
	}

	@Override
	public List<T> query() {
		String hql = "FROM " + clazz.getSimpleName();
		return getSession().createQuery(hql).list();
	}
	
}
