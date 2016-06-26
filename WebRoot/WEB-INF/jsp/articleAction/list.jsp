<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    pageContext.setAttribute("basePath", request.getContextPath()+"/") ;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	主页
	<br />
	<s:if test="#session.SYS_USER!=null">
                      您好，<b>${SYS_USER.nickname}</b>
		<s:a action="user_logout">注销</s:a><br/>
		<img src="${basePath}upload/<s:property value='#session.SYS_USER.headImgPath'/>" width="100" height="100"/><br>
	<s:iterator value="#myarticles">
		<tr>
			<td>${title}&nbsp;</td>
			<%--
			<td>${username}&nbsp;</td>
			<td>${content}&nbsp;</td>
			--%>
			<td>${date}&nbsp;</td>
			<td>${hasread}&nbsp;</td>
			<s:a action="article_seeUI?id=%{id}" target="_blank">查看全部</s:a>
			<s:a action="article_delete?id=%{id}" onclick="return confirm('确定要删除吗？')">删除</s:a>
			<s:a action="article_editUI?id=%{id}">修改</s:a>
		</tr>
		<br/>
	</s:iterator>
	</s:if>
	<s:else>
		<s:a action="user_registUI">注册</s:a>
		<s:a action="user_loginUI">登录</s:a>
	</s:else>
</body>
</html>