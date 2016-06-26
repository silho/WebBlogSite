package com.weblog.service;

import java.util.List;

import com.weblog.base.DaoSupport;
import com.weblog.domain.Critique;

public interface CritiqueService extends DaoSupport<Critique>{
	
	public List<Critique> findAllByArticleID(long Aid);
	
}
