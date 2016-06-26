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

	<s:form action="article_%{id == 0 ? 'add' : 'edit' }">
		<s:hidden name="id"></s:hidden>
		标题：<s:textfield name="title"></s:textfield>
		<br />
		<br />
		作者：<s:textfield name="username"></s:textfield>
		<br />
		<br />
		<s:textarea rows="10" cols="30" name="content"></s:textarea>
		<script type="text/javascript">
			CKEDITOR.replace('content', {
				language : 'zh-cn',
				width : 800,
				height : 400,
				resize_enabled : false
			});
		</script>
		<s:submit value="提交"></s:submit>
	</s:form>

</body>
</html>