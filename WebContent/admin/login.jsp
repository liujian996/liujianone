<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ms登录</title>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/login.css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath }/jq/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/respond.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/login.js"></script>


<title>Ms 登录</title>
</head>
<body>
	<%
		String c1 = "" ;
		String c2 = "" ;
		Cookie[] cookie = request.getCookies() ;
		
		if(cookie!=null){
			for(Cookie c :cookie){
				
				if("username".equals(c.getName())){
					c1 = c.getValue() ;
					c1=java.net.URLEncoder.encode(c1,"UTF-8");
					c1=java.net.URLDecoder.decode(c1, "UTF-8");
					c1 = java.net.URLDecoder.decode(c1,"UTF-8");
				}else if("password".equals(c.getName())){
					c2 = c.getValue() ;
				}
			}
		}
	%>
	<div id="msloging">

		<div id="mslogin">
			<form method="post" action="${pageContext.request.contextPath }/UserInfor" onsubmit="return checkLoginForm()">

				<div class="form-group">
					<span id="msregister"><img src="${pageContext.request.contextPath }/image/register.png" />&nbsp;&nbsp;登录&nbsp;<b>Msspace</b></b></span>
				</div>
				<span id="errors">${requestScope.loginMap.nameAndPass}</span>
				<div class="form-group">
				<span class="msfonts">L</span>
					<input type="text" class="control" name="username" id="username"
						placeholder="请输入昵称" value="<%=c1 %>" />
				</div>

				<div class="form-group">
					<span class="msfonts">W</span>
					&nbsp;<input type="password" class="control" id="userpass"
						name="password" placeholder="请输入密码" value="<%=c2 %>"/>
				</div>

				<div class="form-group">
					<span id="checkboxinput"> <input type="checkbox"
						name="checkboxs"  value="on" id="checkboxs"/><label for="checkboxs">记住密码</label>
						<a href="#" id="forgetpass">忘记密码?</a>
					</span>
				</div>
					<input type="hidden" name="method" value="loggin" />
				<div class="form-group">
					<input type="submit" class="btn control2" value="登录" /> <a
						href="${pageContext.request.contextPath }/admin/register.jsp" class="btn controls">注册</a>
				</div>
			</form>
		</div>

	</div>
</body>
</html>