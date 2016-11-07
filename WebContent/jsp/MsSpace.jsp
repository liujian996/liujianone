<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Magic Space</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/Navigation_M.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/P_header_M.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/auto/default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/videos.css">

<SCRIPT type="text/javascript"
	src="${pageContext.request.contextPath }/jq/jquery-1.12.3.min.js"></SCRIPT>
<SCRIPT type="text/javascript"
	src="${pageContext.request.contextPath }/js/auto/jquery.nivo.slider.js"></SCRIPT>
<SCRIPT type="text/javascript"
	src="${pageContext.request.contextPath }/js/auto/superfish.js"></SCRIPT>
<SCRIPT type="text/javascript"
	src="${pageContext.request.contextPath }/js/auto/supersubs.js"></SCRIPT>
<SCRIPT type="text/javascript"
	src="${pageContext.request.contextPath }/js/auto/jquery.autocomplete.min.js"></SCRIPT>
<SCRIPT type="text/javascript"
	src="${pageContext.request.contextPath }/js/auto/scripts.js"></SCRIPT>


<style type="text/css">
/* 网页体 */

/* 最热推广现场、直播、猜你喜欢 The_hottest_promotion—Live_guess_you_like */
#THP-LGYL {
	width: 1349px;
	height: 1150px;
	position: relative;

}

/* 最热推广现场、直播、猜你喜欢模块 */
#modular-THP-LGYL {
	width: 1169px;
	height: 1110px;
	margin-left: 100px;
}

#modular-THP-LGYL h2{
	border-bottom: 2px solid #333 ;
}

#modular-THP-LGYL section{
	background:#eee ;
	margin-top:25px ;
	box-shadow: -8px 8px 18px 8px rgba(0, 22, 0, 0.2);
}

/* 今日热门（Hot today） */
#HT-modular {
	width: 1169px;
	height: 350px;
	float: left;
	border-bottom:2px solid #eee ;
}

/* 正在直播（Being broadcast live） */
#BBL-modular {
	width: 1169px;
	height: 350px;
	float: left;
}

/* 猜你喜欢（Guess you like） */
#GYL-modular {
	width: 1169px;
	height: 350px;
	float: left;
}

#WebPageBody {
	width: 1349px;
	height: 1500px;
	position: relative;
}

/* 网页体模块 */
#modular-WebPageBody {
	width: 1169px;
	height: 700px;
	margin-left: 100px;
}

/* 主播分类模块 排行榜 */
#anchor_modular-Ranking_List {
	width: 300px;
	height: 350px;
	float: left;
	background-color: navy;
}

/* 视频分类模块 排行榜 */
#Video_modular-Ranking_List {
	width: 300px;
	height: 350px;
	float: left;
	margin-top: -350px;
	background-color: green;
}

/* 视频标签模块 */
#Video_Tags_modular {
	width: 800px;
	height: 200px;
	float: left;
	background-color: gray;
}

/* 视频模块 */
#Video_module {
	width: 800px;
	height: 500px;
	float: left;
	background-color: aqua;
}

/* 视频分区列表模块 */
#Video_list {
	width: 69px;
	height: 700px;
	margin-top: -200px;
	float: left;
	background-color: teal;
}

/* 视频分区列表模块（Video partition list modular） */
#VL-modular {
	width: 79px;
	height: 650px;
	margin-top: 25px;
}

#Video_list ul li {
	display: block;
	float: left;
	position: relative;
	font-family: "微软雅黑";
	font-size: 14px;
	width: 69px;
	height: 50px;
	line-height: 50px;
	text-align: center;
}


/* 网页尾 */
#Web_tail {
	width:;
	height:;
	background-color:;
}

/* 这里是显示用户 （隐藏的）*/
#user{
	border:3px black solid ;
	width:280px ;
	height:380px ;
	background: white ;
	opacity:1 ;
	color: black ;
	font-size: 20px ;
	position:absolute;
	top:40px ;
	right:-120px ;
	z-index: 9999 ;
	text-align: left ;
	display: none ;
}
a:link{
	text-decoration: none ;
	color: black ;
}
/* 超链接被访问过后时的样式 */
a:visited{
	color: black ;
}

/* 当鼠标经过头像时，就显示用户信息 */
#touxiang:hover #user{
	display: block ;
}
/* 当鼠标经过头像时的样式 */
#touxiang #user a:hover{
	color: white ;
}

a:hover{
	color: white ;
}
/* 视频模块里面的div  */
#VideoLogo{
	width: 800px ;
	height:500px ;
	position:absolute ;
}
.VideoModule{
	width: 180px ;
	height: 130px ;
	background: red ;
	position: absolute ;
	text-align: center ;
}
/* 视频的LOGO图片 */
#VideoLogo1{
	position: absolute ;
	top: 5px ;
	left: 16px ;
}
#VideoLogo2{
	position: absolute ;
	top: 5px ;
	left: 212px ;
}
#VideoLogo3{
	position: absolute ;
	top: 5px ;
	left: 408px ;
}
#VideoLogo4{
	position: absolute ;
	top: 5px ;
	left: 604px ;
}

#VideoLogo5{
	position: absolute ;
	top: 165px ;
	left: 16px ;
}
#VideoLogo6{
	position: absolute ;
	top: 165px ;
	left: 212px ;
}
#VideoLogo7{
	position: absolute ;
	top: 165px ;
	left: 408px ;
}
#VideoLogo8{
	position: absolute ;
	top: 165px ;
	left: 604px ;
}

#VideoLogo9{
	position: absolute ;
	top:330px ;
	left: 16px ;
}
#VideoLogo10{
	position: absolute ;
	top:330px ;
	left: 212px ;
}
#VideoLogo11{
	position: absolute ;
	top:330px ;
	left: 408px ;
}
#VideoLogo12{
	position: absolute ;
	top:330px ;
	left: 604px ;
}

#online{
	width:180px; 
	height:80px;
	position:absolute;
	left:10px ;
	top:10px ;
}
</style>

</head>
<body>
	<!-- 网页导航栏 -->
	<div id="Navigation_bar">
		<!-- 导航模块 -->
		<div id="modular-Navigation_bar">
			<!-- 幻方空间LOGO图 -->
			<div id="MS_LoGo"><a href="${pageContext.request.contextPath }/jsp/MsSpace.jsp">
				<img src="${pageContext.request.contextPath }/jsp/MS.png" width='100' height='40'>
			</a></div>

			<!-- 导航 -->
			<div id="Navigation">
				<ul>
					<li>首页</li>
					<li>视频区</li>
					<li>直播</li>
					<li>书贴</li>
					<li>游戏</li>
					<li><a href="${pageContext.request.contextPath }/ProductServlet?method=findShop">站点商城</a></li>
				</ul>
			</div>
		</div>

		<!-- 搜索模块 -->
		<div id="search_module">
			<!-- 搜索表单块 -->
			<form action="${pageContext.request.contextPath }/VideoServlet?method=likeVideos" id="search_Form_module" method="post">
				<!-- 搜索 -->
				<input type="text" name = "keyWord" id="search_form_module_val" onkeyup="keyWordChang()" onfocus="keyWordChang()" autocomplete="off"
				/>
				<!-- 搜索图标 -->
				<button type="submit" class="search-submit">Ms搜索</button>
			</form>
			<div id="showMsgDiv">
				<ul id="ulMsg">
				
				</ul>
			</div>
		</div>

		<!-- 用户模块 -->
		<div id="User_modular">
			<ul>
				<li>手机客户端</li>
				<li id="touxiang">
					头像
					<div id="user">
						用户:${sessionScope.user.username }<br/>
						<a href="${pageContext.request.contextPath }/admin/login.jsp">登录</a>
						<a href="${pageContext.request.contextPath }/admin/register.jsp">注册</a>
						<a href="${pageContext.request.contextPath }/admin/fileUpload.jsp" target="_blank">上传</a>
						<a href="${pageContext.request.contextPath }/UserInfor?method=exit">退出</a>
					</div>
				</li>
				<li>投稿</li>
				<li>消息</li>
				<li>动态</li>
				<li>收藏</li>

			</ul>
		</div>
	</div>

	<!-- 网页头 -->
	<div id="Page_header">
		<img src="${pageContext.request.contextPath }/images/Video_Watch/Web-page_one.png" 
	style="width:1349px;height:1629px;opacity:.3;position:absolute;"/>
		<!-- 网页头模块 -->
		<div id="modular-Page_header">
			<!-- 网页头模块->轮播图 -->
			<section id="modu_header-Carousel_figure">
			<DIV id="carousel_container">
				<DIV class="theme-default">
					<DIV class="ribbon"></DIV>
					<DIV id="slider3" class="nivoSlider">
						<a href="#"> <img width="500" height="300"
							src="${pageContext.request.contextPath }/image/auto/42bc5798fa21330a7bbabc44d1680772180245.png"/>
						</a> <a href="#"> <img width="500" height="600"
							src="${pageContext.request.contextPath }/image/auto/a723ca1d9037476ed2f0b2e48add6701180246.png"/>
						</a> <a href="#"> <img width="500" height="600"
							src="${pageContext.request.contextPath }/image/auto/ac891fc239b06ffa9d4c7db148d68d04180246.png"/>
						</a> <a href="#"> <img width="500" height="300"
							src="${pageContext.request.contextPath }/image/auto/751a35effcae10fd1b361528a272f689180245.png"/>
						</a>
					</DIV>
				</DIV>
			</DIV>
			</section>
			
			<!-- 最新热点 -->
			<section id="modu_header-newest"> 
				<p id="hottitle">最新热点 NEWS</p>
				<p id="huantitle" onclick="test()">换一换
					<input id="cval" type="hidden" value="1" />
				</p>
				
				<ul id="titlehost">
					<li>
						
					</li>
					
				</ul>
			</section>

			<!-- 站点圈子 排行榜 -->
			<section id="modu_header-Site_circle">
				<div id="modu_header-Site_circlehot">
					<a href="#">站点圈子</a>
					<a href="#">排行榜</a>
				</div>
				<div id="modu1">
					
					<p>
						在线人数:
						<c:forEach items="${applicationScope.userMap }" var="map" varStatus="status">
							<c:if test="${status.last}">
				    			${status.count }人
				    		</c:if>
						</c:forEach>
					</p>
					<p>最新投稿/制作</p>
				</div>
				
				<div id="modu2">
					下载MsSpace手机APP
				</div>
			</section>
		</div>
	</div>

	<!-- 网页体 -->
	<!-- 热门推广现场区块 -->
	<div id="THP-LGYL">
		<!-- 最热推广现场模块 -->
		<div id="modular-THP-LGYL">
			<!-- 今日热门（Hot today） -->
			<section id="HT-modular">  
				<h2>今日热门</h2> 
				<span class="changeVideo">换一换
					<input class="cval" type="hidden" value="1" />
				</span>
				<span class="many"><a href="#" class="more">查看更多></a></span>
				<div class="zhibo1">
					<div class="zhubo1"></div>
					<div class="zhubo2"></div>
					<div class="zhubo3"></div>
					<div class="zhubo4"></div>
				</div>
				<div class="zhibo2">
					<div class="zhubo1"></div>
					<div class="zhubo2"></div>
					<div class="zhubo3"></div>
					<div class="zhubo4"></div>
				</div>
				<div class="zhibo3">
					
				</div>
			
			</section>

			<!-- 动漫（Being broadcast live） -->
			<section id="BBL-modular"> 
				<h2>动漫</h2>
				<span class="changeVideo" >换一换
					<input class="cval" type="hidden" value="1" />
				</span>
				<span class="many"><a href="#" class="more">查看更多></a></span>
				<div class="zhibo1">
					<div class="zhubo1"></div>
					<div class="zhubo2"></div>
					<div class="zhubo3"></div>
					<div class="zhubo4"></div>
				</div>
				<div class="zhibo2">
					<div class="zhubo1"></div>
					<div class="zhubo2"></div>
					<div class="zhubo3"></div>
					<div class="zhubo4"></div>
				</div>
				<div class="zhibo3">
					
				</div>
			</section>

			<!-- 音乐（Guess you like） -->
			<section id="GYL-modular">
				<h2>音乐</h2> 
				<span class="changeVideo">换一换
					<input class="cval" type="hidden" value="1" />
				</span>
				<span class="many"><a href="#" class="more">查看更多></a></span>
				<div class="zhibo1">
					<div class="zhubo1"></div>
					<div class="zhubo2"></div>
					<div class="zhubo3"></div>
					<div class="zhubo4"></div>
				</div>
				<div class="zhibo2">
					<div class="zhubo1"></div>
					<div class="zhubo2"></div>
					<div class="zhubo3"></div>
					<div class="zhubo4"></div>
				</div>
				<div class="zhibo3">
					
				</div>
			
			</section>
		</div>
	</div>
	
	<!-- 网页尾 -->
	<div id="Web_tail"></div>
	<SCRIPT type="text/javascript"src="${pageContext.request.contextPath }/js/MsSpace.js"></SCRIPT>
	<SCRIPT type="text/javascript"src="${pageContext.request.contextPath }/js/videoPlayer.js"></SCRIPT>
</body>
</html>