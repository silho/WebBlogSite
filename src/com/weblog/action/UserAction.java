package com.weblog.action;
import java.io.File;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.weblog.base.BaseAction;
import com.weblog.constant.Constant;
import com.weblog.domain.Article;
import com.weblog.domain.ArticleClass;
import com.weblog.domain.User;
import com.weblog.service.ArticleClassService;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> {
	
	//处理头像上传的3个参数
	private File headImg;
	private String headImgContentType;
	private String headImgFileName;
	private String otherName;

	/** 注册页面 */
	public String registUI() throws Exception {

		return "registUI";
	}

	/** 注册 */
	public String regist() throws Exception {
		try {
			if(model!= null){
				//处理头像
				if(headImg != null){
					//1、保存头像到upload/user
					//获取保存路径的绝对地址
					String filePath = ServletActionContext.getServletContext().getRealPath("upload/user");
					String fileName = model.getUsername() + headImgFileName.substring(headImgFileName.lastIndexOf("."));
					//利用common-io.jar复制文件
					System.out.println(filePath+fileName);
					FileUtils.copyFile(headImg,new File(filePath,fileName));
					
					//2、设置用户头像路径
					model.setHeadImgPath("user/" + fileName);
					System.out.println(model.getHeadImgPath());
				}else{
					//如果用户不选择设置默认头像
					model.setHeadImgPath("user/" + "0.jpg");
				}
				//保存用户
				if (userService.trySave(model)) {
					return "regist";
				} else {
					this.addFieldError("model.username","该用户名已经存在");
					return "input";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "input";

	}
	

	/** 登录页面 */
	public String loginUI() throws Exception {
		return "loginUI";
	}

	/** 登录 */
	public String login() throws Exception {
		User user = userService.findByLoginNameAndPassword(model.getUsername(), model.getPassword());
		if (user == null) {
			addFieldError("login", "用户名或密码不正确！");
			return "loginUI";
		} else {
			// 登录用户
			ActionContext.getContext().getSession().put(Constant.USER,user);			
			return "toIndex";
		}
	}

	/** 注销 */
	public String logout() throws Exception {
		ActionContext.getContext().getSession().remove(Constant.USER);
		return "logout";
	}
	
	/** 个人主页*/
	public String index() throws Exception {
		User user;
		if(otherName==null||(otherName.equals(" "))){
		 user= (User) ActionContext.getContext().getSession().get(Constant.USER);
		}else{
			user=userService.getByName(otherName);
			ActionContext.getContext().put("otherName",otherName);
		}
		if(user!=null){
		List<Article> myarticles = null;
		myarticles =articleService.findAllByUsername(user.getUsername());
		ActionContext.getContext().put("myarticles",myarticles);
		
		List<ArticleClass> myarticleClasss = null;
		myarticleClasss =articleClassService.findAll(user.getId());
		ActionContext.getContext().put("myarticleClasss",myarticleClasss);
		
		List<Article> Larticles = null;
		Larticles =articleService.findLatest();
		ActionContext.getContext().put("Larticles",Larticles);
		
		}
		return "index";
	}
	
	
	

	
	/*头像处理相关*/
	public File getHeadImg() {
		return headImg;
	}

	public void setHeadImg(File headImg) {
		this.headImg = headImg;
	}

	public String getHeadImgContentType() {
		return headImgContentType;
	}

	public void setHeadImgContentType(String headImgContentType) {
		this.headImgContentType = headImgContentType;
	}

	public String getHeadImgFileName() {
		return headImgFileName;
	}
	
	public void setHeadImgFileName(String headImgFileName) {
		this.headImgFileName = headImgFileName;
	}
	//其他人访问的名字
	public String getOtherName() {
		return otherName;
	}

	public void setOtherName(String otherName) {
		this.otherName = otherName;
	}
}
