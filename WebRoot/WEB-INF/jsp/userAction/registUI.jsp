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
	注册页面
	<br>
	<s:form action="user_regist" method="post" enctype="multipart/form-data">
			用  户  名:<s:textfield name="username"></s:textfield>
		<s:property value="fieldErrors['model.username']" />
		<s:property value="username.value" />
		<br />
		<br />
			密        码:<s:password name="password" ></s:password>
			<s:property value="fieldErrors['model.password']" />
		<br />
		<br />
			昵        称:<s:textfield name="nickname"></s:textfield>
		<s:property value="fieldErrors['model.nickname']" />
		<br />
		
			头        像:<input type="file" name="headImg"/>
		<s:property value="" />
		<br />
		
		<br />
			安全问题:<s:textfield name="question"></s:textfield>
		<s:property value="fieldErrors['model.question']" />

		<br />
		<br />
			答        案:<s:textfield name="answer"></s:textfield>
		<s:property value="fieldErrors['model.answer']" />

		<br />
		<br />
		<s:submit value="提交"></s:submit>
		<s:reset value="重置"></s:reset>
	</s:form>
</body>
</html>