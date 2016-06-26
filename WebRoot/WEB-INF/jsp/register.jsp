<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath() + "/");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>MyBlog &lsaquo; 注册表单</title>
<link rel='stylesheet' href='${basePath}css/load-styles.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='open-sans-css' href='${basePath}css/css.css'
	type='text/css' media='all' />
<meta name='robots' content='noindex,follow' />
</head>
<body class="login login-action-register wp-core-ui  locale-zh-cn">
	<div id="login">
		<p class="message register">在MyBlog站点注册</p>
		<s:form action="user_regist" method="post"
			enctype="multipart/form-data">
			<p>
				<label for="user_login"> 用户名<br /> <input type="text"
					name="username" id="user_login" class="input" size="20" />
					<s:property value="fieldErrors['model.username']" />
					<s:property value="username.value"/>
				</label>
			</p>
			<p>
				<label for="user_login"> 密码<br /> <input type="password"
					name="password" id="user_login" class="input" value="" size="20" />
					<s:property value="fieldErrors['model.password']" />
				</label>
			</p>
			
			<p>
				<label for="user_nickname">昵称<br /> <input type="text"
					name="nickname" id="user_nickname" class="input" size="20" />
					<s:property value="fieldErrors['model.nickname']" />
				</label>
			</p>
			<p>
				<label for="user_nickname">头像<br /> <input type="file"
					name="headImg" id="user_headImg" class="input" size="20" />
				</label>
			</p>
			<p>
				<label for="user_question">安全问题<br/> <input type="text"
					name="question" id="user_question" class="input" size="20" />
				<s:property value="fieldErrors['model.question']" />
				</label>
			</p>
			<p>
				<label for="user_question">答案<br/> <input type="text"
					name="answer" id="user_question" class="input" size="20" />
				<s:property value="fieldErrors['model.answer']" />
				</label>
			</p>
			<p id="reg_passmail">请确认注册信息。</p>
			<br class="clear" /> <input type="hidden" name="redirect_to"
				value="" />
			<p class="submit">
				<input type="submit" name="wp-submit" id="wp-submit"
					class="button button-primary button-large" value="注册" />
			</p>
		</s:form>
		<p id="nav">
			<a href="http://w0w.site/wp-login.php">登录</a> | <a
				href="http://w0w.site/wp-login.php?action=lostpassword">忘记密码？</a>
		</p>

		<p id="backtoblog">
			<a href="http://w0w.site/">&larr; 回到MyBlog</a>
		</p>

	</div>

	<script type="text/javascript">
		try {
			document.getElementById('user_login').focus();
		} catch (e) {
		}
		if (typeof wpOnload == 'function')
			wpOnload();
	</script>

	<div class="clear"></div>
</body>
</html>