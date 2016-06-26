package com.weblog.base;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@SuppressWarnings("unchecked")

public abstract class DaoSupportImpl<T> implements DaoSupport<T> {

	@Resource
	private SessionFactory sessionFactory;
	private Class<T> clazz;

	public DaoSupportImpl() {
		// 使用反射技术得到T的真实类型 this.getClass() 获得new的类型
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		// 获取当前new的对象的 泛型的父类 类型
		this.clazz = (Class<T>) pt.getActualTypeArguments()[0];

		// 获取第一个类型参数的真实类型
		// System.out.println("clazz ---> " + clazz);
		// getSession().get(clazz, id); 获取实例
	}

	/**
	 * 获取当前可用的Session
	 * 
	 * @return
	 */
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public void save(T entity) {
		getSession().save(entity);
	}

	public void update(T entity) {
		getSession().update(entity);
	}

	public void delete(Long id) {
		Object obj = getById(id);
		if (obj != null) {
			getSession().delete(obj);
		}
	}

	public T getById(Long id) {
		return (T) getSession().get(clazz, id);
	}

	public List<T> getByIds(Long[] ids) {
		return getSession()
				.createQuery(//
						"FROM "+clazz.getSimpleName()+ "WHERE id IN (:ids)")//
				.setParameterList("ids", ids)//
				.list();
	}

	public List<T> findAll() {
		return getSession()
				.createQuery(//
						"FROM " + clazz.getSimpleName())//
				.list();
	}

}
