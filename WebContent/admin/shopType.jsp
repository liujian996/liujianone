<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品的类型</title>
</head>
<body>
	<a href="${pageContext.request.contextPath }/CategoryServlet?method=find" >商品上架</a>
	<form action="${pageContext.request.contextPath }/CategoryServlet?method=add" method="post">
		商品的类型:<input type="text" name="cname"/>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>