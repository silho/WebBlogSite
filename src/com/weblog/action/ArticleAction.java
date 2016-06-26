package com.weblog.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.weblog.base.BaseAction;
import com.weblog.constant.Constant;
import com.weblog.domain.Article;
import com.weblog.domain.ArticleClass;
import com.weblog.domain.Critique;
import com.weblog.domain.User;
import com.weblog.util.SearchBean;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class ArticleAction extends BaseAction<Article> {
	/*评论相关的3个参数*/
	private long critique_AId;
	private String critique_username;
	private String critique_content;
	/*查询相关的参数*/
	private String search;

	/** 列表 */
	public String list() throws Exception {
		List<Article> articlelist = null;
		articlelist = articleService.findAll();// ByUsername(user.getUsername());
		ActionContext.getContext().put("articlelist", articlelist);
		return "list";
	}
	/**个人文章管理*/
	public String mylist() throws Exception {
		User user = (User) ActionContext.getContext().getSession().get(Constant.USER);
		System.out.println("ArticleAction.mylist()"+user);
		if(user!=null){
		List<Article> myarticles = null;
		myarticles =articleService.findAllByUsername(user.getUsername());
		ActionContext.getContext().put("myarticles",myarticles);
		}
		User user1 = (User) ActionContext.getContext().getSession().get(Constant.USER);
		System.out.println("ArticleAction.mylist()"+user1);
		return "list";
	}

	/** 删除 */
	public String delete() throws Exception {
		articleService.delete(model.getId());
		return "toIndex";
	}

	/** 添加页面 */
	public String addUI() throws Exception {
		return "saveUI";
	}

	/** 添加 */
	public String add() throws Exception {
		// 保存
		model.setDate(new Date());
		model.setHasread(0);
		articleService.save(model);
		return "toIndex";
	}

	/** 修改页面 */
	public String editUI() throws Exception {

		// 准备回显的数据
		Article article = articleService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(article);
		return "saveUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		// 1，从数据库取出原对象
		Article article = articleService.getById(model.getId());

		// 2，设置要修改的属性
		article.setTitle(model.getTitle());
		article.setContent(model.getContent());

		// 3，更新到数据库中
		articleService.update(article);

		return "toIndex";
	}

	/** 查看文章 */
	public String seeUI() throws Exception {

		// 准备所查看的文章数据
		Article article = articleService.getById(model.getId());
		Map<String, Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("article", article);
		// 准备所查看的文章评论
		List<Critique> critiques = critiqueService.findAllByArticleID(model.getId());
		ActionContext.getContext().put("critiques", critiques);
		//准备近期文章
		List<Article> Larticles = null;
		Larticles =articleService.findLatest();
		ActionContext.getContext().put("Larticles",Larticles);
		System.out.println("UserAction.index()"+Larticles);
		//准备分类
		
		List<ArticleClass> myarticleClasss = null;
		myarticleClasss =articleClassService.findAllByUsername(article.getUsername());
		ActionContext.getContext().put("myarticleClasss",myarticleClasss);
		return "seeUI";
	}

	public String addCritique() throws Exception {
		Critique critique= new Critique();
		critique.setContent(critique_content);
		critique.setAId(critique_AId);
		critique.setUsername(critique_username);
		critiqueService.save(critique);		
		return "toseeUI";
	}
	public String search() throws Exception{
		List<SearchBean> searchs;
		searchs=articleService.search(search);
		ActionContext.getContext().put("searchs",searchs);
		return "search";
	}
	
	public void setSearch(String search) {
		this.search = search;
	}

	public void setCritique_AId(long critique_AId) {
		this.critique_AId = critique_AId;
	}

	public void setCritique_username(String critique_username) {
		this.critique_username = critique_username;
	}

	public void setCritique_content(String critique_content) {
		this.critique_content = critique_content;
	}
}
