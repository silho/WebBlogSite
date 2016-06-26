<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
</head>
<body>
	测试
	<form name="testForm" method="post">
		<textarea rows="10" cols="30" name="editor01"></textarea>
		<script type="text/javascript">
			CKEDITOR.replace('editor01', {
				language : 'zh-cn',
				width : 800,
				height : 400,
				resize_enabled : false
			});
		</script>
		<input type="submit" value="提交" />
	</form>


</body>
</html>