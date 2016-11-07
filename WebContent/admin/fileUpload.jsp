<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ms 上传</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/commonsfileupload.do" method="post" enctype="multipart/form-data">
		标题：<input type="text" name="title"/><br/>
		类型：<input type="text" name="type"><br/>
		简介：
			<textarea rows="5" cols="50" name="introduction" ></textarea><br/>	
		图片:<input type="file" name="videoimg" id="imgs"/><br/>
		文件:<input type="file" name="videoname" id="videos"/><br/>
									
		<input type="submit" value="上传"/>
	</form>
</body>
</html>