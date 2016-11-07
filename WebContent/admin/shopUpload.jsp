<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel= "stylesheet" type="text/css"  href="${pageContext.request.contextPath }/css/cart/shopUpload.css">
<title>商品上传</title>
</head>
<body>
	<h2>Ms商品上架管理界面</h2>
	<form action ="${pageContext.request.contextPath }/ProductUpload" method="post" enctype="multipart/form-data">
		商品名称:<input type="text" name="pname"><br/>
		商品图片:<input type="file" name="pimg"/><br/>
		商品价格:<input type="text" name="price" /><br/>
		商品库存:<input type="text" name="pcount"/><br/>
		商品类型:<select name="category">
					<option value="">---请选择---</option>
					<c:forEach items="${requestScope.clist }" var="clist">
						<option value="${clist.cid }">${clist.cname }</option>
					</c:forEach>
				</select><br/>
	<span id="shoptextarea">商品详情:
		</span><textarea  rows="5" cols="50" name="pdescription" id="textareas"></textarea><br/>

		<input type="submit" value="提交"/>
	</form>
</body>
</html>