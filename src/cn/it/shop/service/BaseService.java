package cn.it.shop.service;

import java.util.List;

import cn.it.shop.model.Category;

public interface BaseService<T> {
	public void save(T t);
	
	public void update(T t);
	
	public void delete(int id);
	
	
	public T get(int id);
	
	public List<T> query();
}
