<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
</head>
<body>

	<s:form action="articleClass_%{(id == 0||id==null) ? 'add' : 'edit' }">
		<s:hidden name="id"></s:hidden>
		<s:property value="#session.SYS_USER.id"/>
		名称：<s:textfield name="name"></s:textfield>
		<br />
		<br />
		<s:submit value="提交"></s:submit>
	</s:form>

</body>
</html>