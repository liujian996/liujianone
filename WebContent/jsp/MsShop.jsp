<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ms站点商城</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/cart/cart.css"/>
<link rel= "stylesheet" type="text/css" href="${pageContext.request.contextPath  }/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="col-md-12 col-md-msshop">
			<a href=""><img src="${pageContext.request.contextPath  }/shopimages/"/></a>
			
		</div>
		<div class="col-md-12 col-md-msshop">
			<a href=""><img src="${pageContext.request.contextPath  }/shopimages/"/></a>
		</div>
		
		<div  class="col-md-12 col-md-shop1">
		
			<c:forEach items="${requestScope.pdlist}" var="pdlist">
			<c:if test="">
			<div class="col-md-shop3">
				<a href="#">
					<img src="${pageContext.request.contextPath  }/shopimages/${pdlist[7] }"/>
				</a>
			</div>
			</c:if>
		</c:forEach>	
			
	
		</div>
	
		
	</div>
</body>
</html>