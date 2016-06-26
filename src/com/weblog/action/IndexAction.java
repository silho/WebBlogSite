package com.weblog.action;
import java.util.List;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.weblog.base.BaseAction;
import com.weblog.domain.Article;
import com.weblog.domain.User;
@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class IndexAction extends BaseAction<User> {
	/** 网站主页*/
	public String index() throws Exception {
		List<Article> Larticles = null;
		Larticles =articleService.findLatest();
		ActionContext.getContext().put("Larticles",Larticles);
		return "index";
	}

}
