<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Result</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/eachv/Navigation_M.css" />
<style type="text/css">

/* 搜索包（Search Wrap） */
#Search-W {
	width: 1349px;
	height: 80px;
	position: relative;
}

/* 搜索块（Search Block） */
#Search-B {
	width: 1168px;
	height: 60px;
	margin-left: 100px;
	position: absolute;
	bottom: 0px;
}

#Search-B a {
	display: block;
	text-decoration: none;
	font-size: 24px;
	float: left;
	width: 110px;
	height: 35px;
	margin-left: 330px;
	margin-top: 24px;
}

/* 搜索控件（Input Search） */
#Input-S-M {
	box-shadow: none;
	width: 270px;
	height: 18px;
	line-height: 38px;
	float: left;
	margin-top: 16px;
	padding: 10px 15px;
	border: 2px solid #ccd0d7;
	border-radius: 4px;
}

/* 搜索（search） */
#button-S {
	width: 80px;
	height: 42px;
	margin-left: 10px;
	float: left;
	right: 0;
	margin-top: 16px;
	font-size: 18px;
	font-family: "微软雅黑";
	line-height: 42px;
	cursor: pointer;
	border-radius: 8px;
	box-shadow: none;
}

/* 搜索图标 img */
#button_img {
	margin: 8px 0 0 7px;
	width: 26px;
	height: 26px;
	position: relative;
}

/* 搜索（search） */
#button_search {
	position: absolute;
}

/* （） */
#DVA {
	width: 1349px;
	height: 50px;
	padding-top: 12px;
}

/* 具体数量分区（） */
#vague-tag {
	width: 1068px;
	height: 36px;
	left: 10px;
	position: relative;
	margin: 0 auto;
	font-family: "Microsoft YaHei";
}

#vague-tag li {
	width: 90px;
	height: 100%;
	list-style: none;
	line-height: 32px;
	display: inline-block;
	float: left;
	font-size: 20px;
	color: rgb(34, 34, 34);
	margin-left: 54px;
	text-align: center;
	cursor: pointer;
}

#vague-tag li:hover {
	color: rgb(0, 161, 214);
}

#vague-tag li span {
	margin-left: 5px;
	font-size: 12px;
	position: absolute;
}

/* 排序和筛选包（Sort And Screen Wrap） */
#S_And_S-W {
	width: 1349px;
	height: 125px;
	position: absolute;
}

/* 排序和筛选块（Sort And Screen Block） */
#S_And_S-B {
	width: 1168px;
	height: 125px;
	margin-left: 150px;
	position: absolute;
	bottom: 0px;
	font-size: 12px;
	font-family: "Microsoft YaHei";
}

#S_And_S-B a {
	text-decoration: none;
	color: #333;
}

#S_And_S-B a:hover {
	color: yellowgreen;
}

/* 数据量和排版（Data quantity And Typesetting） */
#DQ-And-T {
	width: 1068px;
	height: 30px;
	line-height: 30px;
}

/* 搜索数据数量（Search Data number） */
#S_D-number {
	
}

/* 排版图标（Typesetting Icon） */
.T_I {
	width: 20px;
	height: 20px;
	top: 5px;
	cursor: pointer;
	position: absolute;
}

#T_I-O {
	right: 124px;
}

#T_I-T {
	right: 100px;
}

/* 选择排序方式（Select sort mode） */
#S-sort_mode {
	margin-top: 5px;
}

/* 选择搜索时长（Select search When long） */
#S-search_When_long {
	margin-top: 0px;
}

/* 选择搜索范围（Select search range） */
#S-search_range {
	margin-top: 0px;
}

/* 选择搜索条件（Select search ） */
.S-S {
	width: 1068px;
	height: 30px;
	background-color: #eee;
}

.S-S_condition {
	background-color: #eee;
}

.S-S li {
	float: left;
	padding-left: 8px;
	padding-right: 8px;
	border-radius: 4px;
	margin-right: 18px;
	list-style: none;
}

/* 区域搜索包（Area Search Wrap） */
#Area_Search-W {
	width: 1349px;
	height: 1300px;
	
}

/* 区域搜索块（Area Search Block） */
#Area_Search-B {
	width: 1068px;
	height: 1200px;
	margin-left: 150px;
	position: absolute;
	margin-top: 130px;
	background-color: white;
}

/* 视频矩块（Video moment block） */
#Video_moment-B {
	width: 1150px;
	height: 250px;
}

#Video_moment-B li {
	height: 240px;
	width: 178px;
	border: 2px solid #e5e9ef;
	border-radius: 8px;
	float: left;
	margin-right: 38px;
	margin-top: 20px;
	list-style: none;
}

/* 视频封面与时长（Video cover and When long） */
#video_C-A-WL {
	width: 178px;
	height: 120px;
	border-radius: 8px;
	position: relative;
	background-color: aqua;
}

/* 视频封面（Video cover） */
.V_C {
	width: 178px;
	height: 120px;
	border-radius: 8px 8px 0 0;
	cursor: pointer;
	float: left;
}

/* 视频的时长（Duration of video） */
.DO-video {
	font-family: "Microsoft YaHei";
	font-size: 10px;
	position: absolute;
	line-height: 18px;
	padding: 0 5px;
	bottom: 0;
	right: 0;
	color: #fff;
	background-color: #333;
	background-color: rgba(0, 0, 0, 0.5);
	border-top-left-radius: 4px;
}

/* 视频的标题、投稿时间、用户（Video of title、date、User） */
#V_of_t-D-U {
	width: 178px;
	height: 122px;
	margin-bottom: 0;
	float: left;
}

/* 视频的标题（Video of title）根本就不知道填什么标题才算比较好 */
#V_of_T {
	width: 175px;
	height: 36px;
	bottom: 0;
}

#V_of_t-D-U #V_of_T span {
	width: 158px;
	margin-left: 12px;
	height: 36px;
	position: absolute;
}

#V_of_t-D-U #V_of_T span a {
	white-space: normal;
}

#Video_moment-B a {
	display: block;
	text-decoration: none;
	font-size: 12px;
	color: #333;
	margin-top: 5px;
}

.so-icon {
	display: inline-block;
	font-size: 12px;
	padding-bottom: 5px;
	vertical-align: text-top;
	line-height: 12px;
	position: relative;
	color: #333;
}

/* 播放 弹幕小图标（play、Barrage small icons） */
#PB-SI {
	width: 82px;
	height: 40px;
	float: left;
}

#PB-SI span {
	width: 70px;
	left: 12px;
}

/* 日期 收藏小图标（Date、Collection  small icons） */
#DC-SI {
	width: 80px;
	height: 40px;
	float: left;
}

#UP-A-UN {
	width: 178px;
	height: 40px;
	float: left;
	margin-bottom: 0;
}

#UP-A-UN span {
	width: 120px;
	position: relative;
	margin-left: 50px;
	margin-top: -26px;
}

/* 播发 弹幕 收藏 日期小图标（play、Barrage、Collection、Date small icons） */
.PBCD_SI {
	width: 12px;
	height: 12px;
	position: relative;
	top: 2px;
}

/* 视频矩块の用户头像（Video moment block User profile） */
#VMB-UP {
	width: 36px;
	height: 36px;
	margin-left: 12px;
	margin-top: 4px;
	cursor: pointer;
	position: relative;
}

.U_B {
	width: 36px;
	height: 36px;
	border-radius: 36px;
}
</style>

</head>
<body>
	<!-- 网页导航栏 -->
	<div id="Navigation_bar">
		<!-- 导航模块 -->
		<div id="modular-Navigation_bar">
			<!-- 幻方空间LOGO图 -->
			<div id="MS_LoGo">
				<a href="${pageContext.request.contextPath }/jsp/MsSpace.jsp">
				<img src="${pageContext.request.contextPath }/jsp/MS.png" width='100' height='40'></a>
			</div>

			<!-- 导航 -->
			<div id="Navigation">
				<ul>
					<li><a href="${pageContext.request.contextPath }/jsp/MsSpace.jsp">首页</a></li>
					<li>视频区</li>
					<li>直播</li>
					<li>书贴</li>
					<li>游戏</li>
					<li>站点商城</li>
				</ul>
			</div>
		</div>
		<img src="${pageContext.request.contextPath }/images/Video_Watch/Web-page_one.png" 
	style="width:1349px;height:840px;opacity:.1;position:absolute;"/>
		<!-- 搜索模块 -->
		<div id="search_module">
			<!-- 搜索表单块 -->
			<form action="${pageContext.request.contextPath }/VideoServlet" id="search_Form_module">
				<!-- 搜索 -->
				<input type="text" name="keyWord" value="${param.keyWord }"/>
				<input type="hidden" name="method" value="likeVideos"/>
				<!-- 搜索图标 -->
				<button type="submit" id="search_botton">
					<img src="${pageContext.request.contextPath }/images/icons.png"
						class="search-submit" />
				</button>
			</form>
		</div>

		<!-- 用户模块 -->
		<div id="User_modular">
			<ul>
				<li>手机客户端</li>
				<li>头像</li>
				<li>投稿</li>
				<li>消息</li>
				<li>动态</li>
				<li>收藏</li>
				<li>看过</li>
			</ul>
		</div>
	</div>

	<!-- 搜索包（Search Wrap） -->
	<div id="Search-W">
		<!-- 搜索块（Search Block） -->
		<div id="Search-B">
			<a href="#">MS丨搜索</a> <input type="text" id="Input-S-M"
				placeholder="请输入关键词" name="keyWord"/>
			<!--  -->
			<div id="button-S">
				<span><img
					src="${pageContext.request.contextPath }/images/search.png"
					id="button_img" /></span> <span id="button_search">搜索</span>
			</div>
		</div>
	</div>

	<!--  -->
	<div id="DVA">
		<!--  -->
		<ul id="vague-tag">
			<li>全部<span>99+</span></li>
			<li>番剧<span>9</span></li>
			<li>影视<span>6</span></li>
			<li>话题<span>1</span></li>
			<li>用户<span>36</span></li>
			<li>用户<span>45</span></li>
			<li>用户<span>54</span></li>
		</ul>
	</div>

	<!-- 排序和筛选包（Sort And Screen Wrap） -->
	<div id="S_And_S-W">
		<!-- 排序和筛选块（Sort And Screen Block） -->
		<div id="S_And_S-B">
			<!-- 数据量和排版（Data quantity And Typesetting） -->
			<section id="DQ-And-T"> <!-- 搜索数据数量（Search Data number） -->
			<p>共0条数据</p>

			<!-- 排版图标（Typesetting Icon） --> <span> <!-- 排版区块：一（Typesetting block one） -->
				<img src="${pageContext.request.contextPath }/images/TB-O.png"
				id="T_I-O" class="T_I" />
			</span> <span> <!-- 排版区块：二（Typesetting block two） --> <img
				src="${pageContext.request.contextPath }/images/TB-T.png" id="T_I-T"
				class="T_I" />
			</span> </section>

			<!-- 选择排序方式（Select sort mode） -->
			<section id="S-sort_mode" title="" class="S-S">
			<ul>
				<!-- 选择搜索条件（Select Search condition） -->
				<li class="S-S_condition"><a href="#">综合排序</a></li>
				<li><a href="#">相关度</a></li>
				<li><a href="#">最多点击</a></li>
				<li><a href="#">最新发布</a></li>
				<li><a href="#">最多弹幕</a></li>
				<li><a href="#">最多收藏</a></li>
			</ul>
			</section>

			<!-- 选择搜索时长（Select search When long） -->
			<section id="S-search_When_long" title="" class="S-S">
			<ul>
				<li class="S-S_condition"><a href="#">全部时长</a></li>
				<li><a href="#">10分钟以下</a></li>
				<li><a href="#">10~30分钟</a></li>
				<li><a href="#">30~60分钟</a></li>
				<li><a href="#">60分钟以上</a></li>
			</ul>
			</section>

			<!-- 选择搜索范围（Select search range） -->
			<section id="S-search_range" title="" class="S-S">
			<ul>
				<li class="S-S_condition"><a href="#">全部分区</a></li>
				<li><a href="#">电影</a></li>
				<li><a href="#">动画</a></li>
				<li><a href="#">番剧</a></li>
				<li><a href="#">音乐</a></li>
				<li><a href="#">舞蹈</a></li>
				<li><a href="#">影视</a></li>
				<li><a href="#">娱乐</a></li>
				<li><a href="#">科技</a></li>
				<li><a href="#">游戏</a></li>
				<li><a href="#">体育</a></li>
				<li><a href="#">时尚</a></li>
				<li><a href="#">鬼畜</a></li>
				<li><a href="#">原创</a></li>
			</ul>
			</section>
		</div>
	</div>

	<div class="vague-tag"></div>

	<!-- 区域搜索包（Area Search Wrap） -->
	<div id="Area_Search-W">
		<!-- 区域搜索块（Area Search Block） -->
		<div id="Area_Search-B">
			<ul id="Video_moment-B">
				<c:forEach items="${requestScope.videosList.data}" var="listvideos">
					<!-- 视频矩块（Video moment block） -->

					<li>
						<a href="${pageContext.request.contextPath }/video/Video_Watch.jsp?text=${listvideos.videoname}" target='_blank'>
						<!-- 视频封面与时长（Video cover and When long） -->
						<div id="video_C-A-WL">
							<!-- 视频封面（Video cover） -->
							<img
								src="${pageContext.request.contextPath }/videosImages/${listvideos.videoimg}"
								class="V_C" />
							<!-- 视频的时长（Duration of video） -->
							<span class="DO-video">1:20:31</span>
						</div> <!-- 视频的标题、投稿时间、用户（Video of title、date、User） -->
						<div id="V_of_t-D-U">
							<!-- 视频的标题（Video of title） -->
							<div id="V_of_T">
								<span> <a href="#">${listvideos.title}
								</a>
								</span>
							</div>
							<!-- 播放 弹幕小图标（play、Barrage small icons） -->
							<section id="PB-SI"> <!-- 播放（play） --> <span
								class="so-icon"><img
								src="${pageContext.request.contextPath }/images/P-SI.png"
								class="PBCD_SI" /> 22.9万</span> <!-- 弹幕（Barrage） --> <span
								class="so-icon"><img
								src="${pageContext.request.contextPath }/images/B-SI.png"
								class="PBCD_SI" /> 4122</span> </section>
							<!-- 日期 收藏小图标（Date、Collection  small icons） -->
							<section id="DC-SI"> <!-- 日期（Date） --> <span
								class="so-icon"><img
								src="${pageContext.request.contextPath }/images/D-SI.png"
								class="PBCD_SI" /> 2015-07-03</span> <!-- 收藏（Collection） --> <span
								class="so-icon"><img
								src="${pageContext.request.contextPath }/images/C-SI.png"
								class="PBCD_SI" /> 2.3万 </span> </section>
							<!-- 用户头像与用户名（User profile And User name） -->
							<section id="UP-A-UN"> <!-- 视频矩块の用户头像（Video moment block User profile） -->
							<div id="VMB-UP">
								<img src="${pageContext.request.contextPath }/videosImages/${listvideos.videoimg}"
									class="U_B" /> <span class="so-icon"> 微微一笑很倾城 </span>
							</div>
							</section>
						</div>
						</a>
					</li>
				</c:forEach>
			</ul>
				<span id="videoscode">共:${requestScope.videosList.currentPageSize}页/第${requestScope.videosList.currentPage }页
				
				<c:choose>
				<c:when test="${requestScope.videosList.currentPageSize == 0}">
					<div>没有您要查找的结果</div>
				</c:when>
					<c:otherwise>
						<%--如果这个大于1,证明有首页和上一页 --%>
						<c:if test="${requestScope.videosList.currentPage >1 }">
							<a
								href="${pageContext.request.contextPath}/VideoServlet?method=likeVideos&cp=1&keyWord=${param.keyWord }">首页</a>
							<a
								href="${pageContext.request.contextPath}/VideoServlet?method=likeVideos&cp=${requestScope.videosList.currentPage-1 }&keyWord=${param.keyWord }">上一页</a>
						</c:if>
						<%--当页面小于10把所有的页码都显示出来 --%>
						<c:choose>
							<c:when test="${requestScope.videosList.currentPageSize <=10 }">
								<c:set var="begin" value="1"></c:set>
								<c:set var="end"
									value="${requestScope.videosList.currentPageSize }"></c:set>
							</c:when>


							<%--否则页面大于10 --%>
							<c:otherwise>
								<c:set var="begin"
									value="${requestScope.videosList.currentPage-5 }"></c:set>
								<c:set var="end"
									value="${requestScope.videosList.currentPage+4 }"></c:set>

								<c:if test="${begin < 1}">
									<c:set var="begin" value="1"></c:set>
									<c:set var="end" value="10"></c:set>
								</c:if>

								<c:if test="end>${requestScope.videosList.currentPageSize }">
									<c:set var="begin"
										value="${requestScope.videosList.currentPage-9 }"></c:set>
									<c:set var="end"
										value="${requestScope.videosList.currentPageSize }"></c:set>
								</c:if>

							</c:otherwise>
						</c:choose>
						
						<%--页码 --%>
						<c:forEach begin="${begin }" end="${end }" var="i">
							<c:choose>
								<%--当前不加超链接 --%>
								<c:when test="${requestScope.videosList.currentPage == i}">
						${i }
						</c:when>
								<%--其他页面加上[]号 --%>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath }/VideoServlet?method=likeVideos&cp=${i}&keyWord=${param.keyWord }">[${i }]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>


						<!-- 如果当前页小于总页数,说明有下一页 -->
						<c:if
							test="${requestScope.videosList.currentPage < requestScope.videosList.currentPageSize}">
							<a
								href="${pageContext.request.contextPath }/VideoServlet?method=likeVideos&cp=${requestScope.videosList.currentPage +1}&keyWord=${param.keyWord }">下一页</a>
							<a
								href="${pageContext.request.contextPath }/VideoServlet?method=likeVideos&cp=${requestScope.videosList.currentPageSize}&keyWord=${param.keyWord }">尾页</a>
						</c:if>
					</c:otherwise>
				</c:choose>
				
				</span>	
		</div>
	</div>
</body>
</html>