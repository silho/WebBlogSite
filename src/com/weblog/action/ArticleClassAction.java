package com.weblog.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.weblog.base.BaseAction;
import com.weblog.domain.ArticleClass;
import com.weblog.domain.User;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class ArticleClassAction extends BaseAction<ArticleClass>{

	
	/** 列表 */
	public String list() throws Exception {
		List<ArticleClass> articleClassList = null;
		User user = (User) ActionContext.getContext().getSession().get("SYS_USER");
		articleClassList=articleClassService.findAll(user.getId());
		ActionContext.getContext().put("articleClassList", articleClassList);
		return "list";
	}

	/** 删除 */
	public String delete() throws Exception {
		articleClassService.delete(model.getId());
		return "toList";
	}

	/** 添加页面 */
	public String addUI() throws Exception {
		return "saveUI";
	}
	/** 添加 */
	public String add() throws Exception {
		//取出session域中的用户
		User user = (User) ActionContext.getContext().getSession().get("SYS_USER");
		//设置model中的userid
		model.setUserid(user.getId());
		// 保存
		
		articleClassService.save(model);
		return "toList";
	}
	
	/** 修改页面 */
	public String editUI() throws Exception {
		
		// 准备回显的数据
		ArticleClass articleClass = articleClassService.getById(model.getId());
		ActionContext.getContext().getValueStack().push(articleClass);

		return "saveUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		// 1，从数据库取出原对象
		ArticleClass articleClass = articleClassService.getById(model.getId());

		// 2，设置要修改的属性
		articleClass.setName(model.getName());

		// 3，更新到数据库中
		articleClassService.update(articleClass);

		return "toList";
	}
	
	
}
