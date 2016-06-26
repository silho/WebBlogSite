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
	主页
	<br /> 
	${article.title}&nbsp; ${article.username}&nbsp;
	${article.date}&nbsp; ${article.hasread}&nbsp;
	<br /> ${article.content}&nbsp;
	
	<br />
	<s:iterator value="#critiques">
		<tr>
			<td>${username}&nbsp;</td>
			<td>${content}&nbsp;</td>
			<td>${AId}&nbsp;</td>
			<td>${id}&nbsp;</td>
			<%-- <s:a action="article_delete?id=%{id}"
				onclick="return confirm('确定要删除吗？')">删除</s:a>
			<s:a action="article_editUI?id=%{id}">修改</s:a>
			--%>
		</tr>
		<br />
	</s:iterator>
	<s:form action="article_addCritique">
	<s:property value="%{#request.article.id}"/>
	    <s:hidden name="id"></s:hidden>
		<s:hidden name="critique_AId" value="%{#request.article.id}"></s:hidden>
		名称：<s:textfield name="critique_username" ></s:textfield>
		<br />
		<br />
		<s:textarea rows="10" cols="30" name="critique_content" ></s:textarea>
		<script type="text/javascript">
			CKEDITOR.replace('content', {
				language : 'zh-cn',
				width : 400,
				height : 200,
				resize_enabled : false
			});
		</script>
		<br/>
		<s:submit value="提交"></s:submit>
	</s:form>

<s:debug/>


</body>
</html>