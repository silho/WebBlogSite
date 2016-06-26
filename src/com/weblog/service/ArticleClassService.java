package com.weblog.service;

import java.util.List;

import com.weblog.base.DaoSupport;
import com.weblog.domain.ArticleClass;

public interface ArticleClassService extends DaoSupport<ArticleClass> {

	/**
	 * 通过用户ID查找所有有关用户的分类
	 * @param userid 用户ID
	 * @return 分类集合
	 */
	
	List<ArticleClass> findAll(long userid);

	List<ArticleClass> findAllByUsername(String username);


}
