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
<title>MyBlog &lsaquo; 私人博客站点</title>
<link rel='stylesheet' href='${basePath}css/load-styles.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='open-sans-css' href='${basePath}css/css.css'
	type='text/css' media='all' />
<meta name='robots' content='noindex,follow' />
</head>
<body class="login login-action-login wp-core-ui  locale-zh-cn">
	<div id="login">
		<s:form name="loginform" id="loginform" action="user_login"
			method="post">
			<p>
				<label for="user_login"> 用户名 <br /> <input type="text"
					name="username" id="user_login" class="input" size="20" />
				</label>
			</p>
			<p>
				<label for="user_pass"> 密码 <br /> <input type="password"
					name="password" id="user_pass" class="input" value="" size="20" />
				</label>
			</p>
			<br />
			<s:property value="fieldErrors['login']" />
			<p class="submit">
				<input type="submit" name="wp-submit" id="wp-submit"
					class="button button-primary button-large" value="登录" /> 
				<input type="hidden" name="testcookie" value="1" />
			</p>
		</s:form>

		<p id="nav">
			<s:a action="user_registUI">注册</s:a> | 
			<s:a action="#">忘记密码？</s:a>
		</p>

		<script type="text/javascript">
			function wp_attempt_focus() {
				setTimeout(function() {
					try {
						d = document.getElementById('user_login');
						d.focus();
						d.select();
					} catch (e) {
					}
				}, 200);
			}

			wp_attempt_focus();
			if (typeof wpOnload == 'function')
				wpOnload();
		</script>
		<p id="backtoblog">
		<s:a action="index.action">&larr; 回到MyBlog</s:a>
		</p>
	</div>
	<div class="clear"></div>
</body>
</html>