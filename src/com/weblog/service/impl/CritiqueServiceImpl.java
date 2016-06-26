package com.weblog.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weblog.base.DaoSupportImpl;
import com.weblog.domain.Critique;
import com.weblog.service.CritiqueService;

@Service
@Transactional
public class CritiqueServiceImpl extends DaoSupportImpl<Critique> implements CritiqueService {

	@SuppressWarnings("unchecked")
	@Override
	public List<Critique> findAllByArticleID(long AId) {
		return getSession()
				.createQuery(//
						"FROM Critique WHERE AId = ?")//
				.setLong(0, AId)//
				.list();
	}

}
