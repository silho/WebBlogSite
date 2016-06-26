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
<br />
	<s:if test="#session.SYS_USER!=null">
                      您好，<b>${SYS_USER.nickname}</b>
		<s:a action="user_logout">注销</s:a><br/>
	<s:iterator value="#articleClassList">
		<tr>
			<td>${id}&nbsp;</td>
			<td>${userid}&nbsp;</td>
			<td>${name}&nbsp;</td>
			<s:a action="articleClass_delete?id=%{id}" onclick="return confirm('确定要删除吗？')">删除</s:a>
			<s:a action="articleClass_editUI?id=%{id}">修改</s:a>
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