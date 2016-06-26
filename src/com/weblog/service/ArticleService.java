package com.weblog.service;

import java.util.Date;
import java.util.List;

import com.weblog.base.DaoSupport;
import com.weblog.domain.Article;
import com.weblog.util.SearchBean;


public interface ArticleService extends DaoSupport<Article>{

	/**
	 * 通过用户名查找对应的文章集合
	 * @param username
	 * @return
	 */
	List<Article> findAllByUsername(String username);
	/**
	 * 通过时间和用户名查找文章，以供lucene找出其ID
	 * @param username
	 * @param date
	 * @return
	 */
	public Article findAllByUsernameAndDate(String username,Date date);
	/**
	 * 查找最新的5次文章集合
	 * @return
	 */
	List<Article> findLatest();
	/**
	 * 通过lucene创建的索引查询
	 * @param queryStr
	 * @return
	 * @throws Exception
	 */
	public List<SearchBean> search(String queryStr) throws Exception;
	/**
	 * 创建lucene索引
	 * @param article
	 * @throws Exception
	 */
	public void createIndexBean(Article article) throws Exception;

	

}
