// 验证用户名
function nameFocus() {
	if ($("#username").val() == "") {
		$("#username").next("span").removeClass("error")
		$("#username").next("span").addClass("errors2");
		$("#username").next("span").html("昵称长度应在4到16个字符之间");
	}
}

// 定义一个全局变量
var falg = false;
function nameBlur() {
	// var falg = false ;

	var username = $('#username').val();
	if (username == "") {
		$("#username").next("span").addClass("error");
		$("#username").next("span").removeClass("errors2");
		$("#username").css("border", "2px solid red");
		$("#username").next("span").html("昵称不能为空");
		falg = false;
	} else if (!(username.length >= 4 && username.length <= 16)) {
		// alert("2"+falg) ;
		$("#username").next("span").addClass("error");
		$("#username").next("span").removeClass("errors2");
		$("#username").css("border", "2px solid red");
		$("#username").next(".errors").html("昵称长度应在4到16个字符之间");
		falg = false;
	}
	if (username.length >= 4 && username.length <= 16) {
		$.ajax({
			url : "../UserInfor?method=checkName",
			type : "post",
			data : "username=" + username,
			dataType : "text",
			success : function(data) {
				// alert(data) ;
				if (data == username) {

					$("#username").next("span").addClass("error");
					$("#username").next("span").removeClass("errors2");
					$("#username").css("border", "2px solid red");
					$("#username").next("span").html("昵称已被注册");
					falg = false;
				} else {
					$("#username").next("span").removeClass("error");
					$("#username").next("span").removeClass("errors2");
					$("#username").next("span").css("margin-left", "5px");
					$("#username").next("span").html(
							"<img src='../image/sucess.png'/>");

					falg = true;
				}
				// alert("ooo2"+falg) ;

			}

		});
		// alert("ooo3"+falg) ;
	}

	// alert("4"+falg) ;

	return falg;

}

// 验证密码
function passFocus() {
	if ($("#userpass").val() == "") {
		$("#userpass").next("span").removeClass("error")
		$("#userpass").next("span").addClass("errors2");
		$("#userpass").next("span").html("密码应在6到32个字符之间");
	}
}

function passBlur() {
	var checkPass = /^[\d]+$/g;
	var userpass = $("#userpass").val();
	if (userpass == "") {

		$("#userpass").next("span").addClass("error");
		$("#userpass").next("span").removeClass("errors2");
		$("#userpass").css("border", "2px solid red");
		$("#userpass").next("span").html("密码不能为空");
		falg = false;
	} else if (!(userpass.length >= 6 && userpass.length <= 32)) {
		$("#userpass").next("span").addClass("error");
		$("#userpass").next("span").removeClass("errors2");
		$("#userpass").css("border", "2px solid red");
		$("#userpass").next(".errors").html("密码长度应在6到32个字符之间");
		falg = false;
	} else if (checkPass.test(userpass)) {
		$("#userpass").next("span").addClass("error");
		$("#userpass").next("span").removeClass("errors2");
		$("#userpass").css("border", "2px solid red");
		$("#userpass").next("span").html("密码不能全为纯数字");
		falg = false;
	} else {
		$("#userpass").next("span").removeClass("error");
		$("#userpass").next("span").removeClass("errors2");
		$("#userpass").next("span").css("margin-left", "5px");
		$("#userpass").next("span").html("<img src='../image/sucess.png'/>");
		falg = true;
	}
	return falg;
}

// 确认密码
function checkPassFocus() {
	if ($("#userpasscheck").val() == "") {
		$("#userpasscheck").next("span").removeClass("error")
		$("#userpasscheck").next("span").addClass("errors2");
		$("#userpasscheck").next("span").html("请输入确认密码");
	}
}

function checkPassBlur() {
	var userpasscheck = $("#userpasscheck").val();
	if (userpasscheck == "") {
		$("#userpasscheck").next("span").addClass("error");
		$("#userpasscheck").next("span").removeClass("errors2");
		$("#userpasscheck").css("border", "2px solid red");
		$("#userpasscheck").next("span").html("确认密码不能为空");
		falg = false;
	} else if (!(userpasscheck == $("#userpass").val())) {
		$("#userpasscheck").next("span").addClass("error");
		$("#userpasscheck").next("span").removeClass("errors2");
		$("#userpasscheck").css("border", "2px solid red");
		$("#userpasscheck").next("span").html("两次密码不一致");
		falg = false;
	} else {
		$("#userpasscheck").next("span").removeClass("error");
		$("#userpasscheck").next("span").removeClass("errors2");
		$("#userpasscheck").next("span").css("margin-left", "5px");
		$("#userpasscheck").next("span").html("<img src='../image/sucess.png'/>");
		falg = true;
	}
	return falg;
}

// 邮箱
function checkEmailFocus() {
	if ($("#email").val() == "") {
		$("#email").next("span").removeClass("error")
		$("#email").next("span").addClass("errors2");
		$("#email").next("span").html("请输入邮箱账号");
	}
}

function checkEmailBlur() {
	var checkEmail = /^([\w\.\-])+\@(([\w\-])+\.)+([\w]{2,4})+$/;
	var email = $("#email").val();
	
	if (email == "") {
		$("#email").next("span").addClass("error");
		$("#email").next("span").removeClass("errors2");
		$("#email").css("border", "2px solid red");
		$("#email").next("span").html("昵称不能为空");
		falg = false;
	} else if (!(checkEmail.test(email))) {
		$("#email").next("span").addClass("error");
		$("#email").next("span").removeClass("errors2");
		$("#email").css("border", "2px solid red");
		$("#email").next(".errors").html("请输入正确的邮箱格式");
		falg = false;
	} else if (checkEmail.test(email)) {
		
			$.ajax({
				url : "../UserInfor?method=checkEmail",
				type : "post",
				data : "email=" + email,// "eamil="跟表单中name属性对应
				dataType : "text",
				success : function(data) {
					if (data == email) {
						$("#email").next("span").addClass("error");
						$("#email").next("span").removeClass("errors2");
						$("#email").css("border", "2px solid red");
						$("#email").next("span").html("该邮箱已被注册");
						falg = false;
					}else{
						$("#email").next("span").removeClass("error");
						$("#email").next("span").removeClass("errors2");
						$("#email").next("span").css("margin-left", "5px");
						$("#email").next("span").html("<img src='../image/sucess.png'/>");
						falg = true;
					}

				}
			});
	}
	return falg;
}


//验证码

function coedfocus() {
	if ($("#checkcoed").val() == "") {
		$("#checkcoed").next("span").removeClass("error")
		$("#checkcoed").next("span").addClass("errors2");
		$("#checkcoed").next("span").html("请输入验证码");
	}
}

function checkcoeds() {
	var ccode = $("#checkcoed").val();
	if (ccode == "") {
		$("#checkcoed").next("span").addClass("error");
		$("#checkcoed").next("span").removeClass("errors2");
		$("#checkcoed").css("border", "2px solid red");
		$("#checkcoed").next("span").html("验证码不能为空");
		falg = false;
	} else if (ccode.length < 4) {
		$("#checkcoed").next("span").addClass("error");
		$("#checkcoed").next("span").removeClass("errors2");
		$("#checkcoed").css("border", "2px solid red");
		$("#checkcoed").next(".errors").html("验证码不正确");
		falg = false;
	} else if(ccode.length == 4){
		$.ajax({
			url : "../UserInfor?method=checkCoed",
			data : "checkcoed="+ccode,
			type : "post",
			dataType : "text",
			success : function(data) {
				if (data != ccode) {
					$("#checkcoed").next("span").addClass("error");
					$("#checkcoed").next("span").removeClass("errors2");
					$("#checkcoed").css("border", "2px solid red");
					$("#checkcoed").next("span").html("验证码不正确");
					falg = false;
				}else if(data == ccode){
					$("#checkcoed").next("span").removeClass("error");
					$("#checkcoed").next("span").removeClass("errors2");
					$("#checkcoed").next("span").css({"margin-left":"-15px","margin-top":"5px"});
					$("#checkcoed").next("span").html("<img src='../image/sucess.png'/>");
					falg = true;
				}
				
			}
		});
	}
	return falg;
}


// 验证整个表单的控件
function checkForm() {
	// alert("ok" + nameBlur());
	 //alert("ok" + checkcoeds());
	if (nameBlur() == true && passBlur() == true && checkPassBlur() == true && checkEmailBlur()==true && checkcoeds()==true) {
		return true;
	}
	return false;
}
