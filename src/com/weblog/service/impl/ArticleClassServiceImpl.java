package com.weblog.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weblog.base.DaoSupportImpl;
import com.weblog.domain.ArticleClass;
import com.weblog.service.ArticleClassService;

@Service
@Transactional
public class ArticleClassServiceImpl extends DaoSupportImpl<ArticleClass> implements ArticleClassService {

	@SuppressWarnings("unchecked")
	@Override
	/*
	 * (non-Javadoc)
	 * @see com.weblog.service.ArticleClassService#findAll(long)
	 */
	
	public List<ArticleClass> findAll(long userid) {
		return getSession()
				.createQuery(//
						"FROM ArticleClass WHERE userid = ?")//
				.setParameter(0, userid)//
				.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArticleClass> findAllByUsername(String username) {
		return getSession()
				.createQuery(//
						//"FROM ArticleClass WHERE userid = (select id from)")//
						"SELECT a.id,a.userid,a.name FROM ArticleClass AS a,User AS u WHERE u.username = ? AND a.userid = u.id")//
				.setParameter(0, username)//
				.list();
		
	}

}
