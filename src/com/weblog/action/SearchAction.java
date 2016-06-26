package com.weblog.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.weblog.base.BaseAction;
import com.weblog.domain.Article;
import com.weblog.service.ArticleService;
import com.weblog.service.impl.ArticleServiceImpl;
import com.weblog.util.SearchBean;
import com.weblog.util.SearchUtil;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class SearchAction extends BaseAction<Article>{
	public String execute() throws Exception {
		SearchUtil search = new SearchUtil();
	     SearchBean bean = new SearchBean();
	     List<Article> list;
	     list=articleService.findAll();
	     for(Article article:list){
	    	 bean.setId(article.getId());
	         bean.setTitle(article.getTitle());
	         try {
	        	search.createIndexBean(bean);
	        	System.out.println("添加");
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	     }
	     
	    List<SearchBean> beanlist = null;
		try {
			beanlist = search.search("如何");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		for(SearchBean searchBean:beanlist){
				System.out.println(searchBean.getId()+":"+searchBean.getTitle());
			}
	     
		
		return "success";
	}

}
