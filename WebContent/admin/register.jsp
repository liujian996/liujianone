<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ms注册页</title>
<link href="${pageContext.request.contextPath }/css/register.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" />

<script type="text/javascript" src="${pageContext.request.contextPath }/jq/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/respond.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/register.js"></script>
<script type="text/javascript">
	function changes() {
		document.getElementById("imgs").src = "${pageContext.request.contextPath }/CodeUtil?time"
				+ new Date().getTime();
	};
</script>

</head>
<body>
	<div class="container" id="bgimage">
		<div id="frmption">
			<form id="registerform" method="post"
				action="${pageContext.request.contextPath }/UserInfor" onsubmit="return checkForm()">
				
				<div id="mstitle">
					<span id="msregister"><img src="../image/register.png" />&nbsp;&nbsp;注册&nbsp;Msspace</span>
				</div>

				<div class="form-group">
					<span class="msfonts">L</span> <input type="text"
						class="formcontrol" name="username" id="username" maxlength="16"
						placeholder="请输入昵称" style="margin-left: -20px;"
						onfocus="nameFocus()" onblur="nameBlur()"/><span class=""></span>
				</div>

				<div class="form-group">
					<span class="msfonts">W</span> <input type="password"
						maxlength="32" class="formcontrol" id="userpass" name="password"
						placeholder="请输入密码" onfocus="passFocus()" onblur="passBlur()" /><span
						class=""></span>
				</div>

				<div class="form-group">
					<span class="msfonts">W</span> <input type="password"
						maxlength="32" class="formcontrol" id="userpasscheck"
						name="userpasscheck" placeholder="确认密码" onfocus="checkPassFocus()" onblur="checkPassBlur()"/><span class=""></span>
				</div>

				<div class="form-group">
					<span class="msfonts">M</span> <input type="email" maxlength="20"
						class="formcontrol" name="email" id="email" placeholder="请输入邮箱"
						style="margin-left: -20px;" onfocus="checkEmailFocus()"
						onblur="checkEmailBlur()"/><span class=""></span>

				</div>

				<div class="form-group">
					<input type="text" id="checkcoed" class="formcontrol" maxlength="4"
						onblur="checkcoeds()" onfocus="coedfocus()" name="checkcoed"
						placeholder="请输入验证码" style="margin-left: 0px;" /><span
						class="" style="position: absolute; left: 370px ;top:275px"></span> <img
						src="${pageContext.request.contextPath }/CodeUtil" id="imgs"
						onclick="changes()" /><a href="javascript:void(0)"
						id="togglecode" onclick="changes()">看不清,换一张</a>
				</div>

				<div class="form-group">
					<input type="checkbox" checked id="r" /><label for="r">阅读并同意</label><a
						href="#"><<使用协议>></a><a href="${pageContext.request.contextPath }/admin/login.jsp" id="loginms">返回登录>>></a>
				</div>
				<input type="hidden" name="method" value="register"/>
				<div class="form-group">
					<input type="submit" id="btn" value="注　册" style="outline: none;"/>
				</div>
			</form>
		</div>
	</div>
</body>
</html>