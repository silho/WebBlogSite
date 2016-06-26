package com.weblog.base;

import java.lang.reflect.ParameterizedType;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.weblog.service.ArticleClassService;
import com.weblog.service.ArticleService;
import com.weblog.service.CritiqueService;
import com.weblog.service.UserService;

public abstract class BaseAction<T> extends ActionSupport implements ModelDriven<T> {
	// =============== ModelDriven的支持 ==================
	protected T model;
	// =============== Service实例的声明 ==================
	@Resource
	protected UserService userService;
	@Resource
	protected ArticleClassService articleClassService;
	@Resource
	protected ArticleService articleService;
	@Resource
	protected CritiqueService critiqueService;
	

	public BaseAction() {
		try {
			// 通过反射获取model的真实类型
			ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
			Class<T> clazz = (Class<T>) pt.getActualTypeArguments()[0];
			// 通过反射创建model的实例
			model = clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public T getModel() {
		return model;
	}

}
