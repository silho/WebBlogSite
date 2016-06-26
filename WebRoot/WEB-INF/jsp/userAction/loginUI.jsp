<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	登录页面
	<br>
	<s:form action="user_login">
			用  户  名:<s:textfield name="username"></s:textfield>
		<br />
		<br />
			密        码:<s:password name="password" showPassword="false"></s:password>
		<s:submit value="提交"></s:submit>
		<s:reset value="重置"></s:reset>
		<br/>
		<s:property value="fieldErrors['login']"/>
	</s:form>
</body>
</html>