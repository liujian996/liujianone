function userNameAnduserPass(){
	var username = $("#username").val() ;
	var userpass = $("#userpass").val() ;
	if(username=="" && userpass==""){
		$("#errors").html("昵称和密码不能为空") ;
		return false ;
	}else if(username==""){
		$("#errors").html("昵称不能为空") ;
		return false ;
	}else if(userpass==""){
		$("#errors").html("密码不能为空") ;
		return false ;
	}
	return true ;
}

function checkLoginForm(){
	if(userNameAnduserPass()==true){
		return true ;
	}
	return false ;
}
$(function(){
	
	var pass = $("#userpass").val() ;
	if(pass!=""){//密码不为空,说明记住了密码
		$("#checkboxs").attr("checked",true);
	}else{//否则没有记住,不打勾
		$("#checkboxs").attr("checked",false);
	}
	
	//在点击相应的节点时,清除错误信息
	$("#username").click(function(){
		$("#errors").html("");
	});
	$("#userpass").click(function(){
		$("#errors").html("");
	});
});

	
