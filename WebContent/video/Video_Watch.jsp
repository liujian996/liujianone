<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Video Watch</title>
	
<!--弹幕视频-->
<link href="src/css/scojs.css" rel="stylesheet">
<link href="src/css/colpick.css" rel="stylesheet">
<link href="src/css/bootstrap.css" rel="stylesheet">
<link href="src/css/main.css" rel="stylesheet">
<link href="src/css/index.css" rel="stylesheet">


<!--弹幕视频插件-->
<script src="src/js/jquery-2.1.4.min.js"></script>
<script src="src/js/jquery.shCircleLoader.js"></script>
<script src="src/js/sco.tooltip.js"></script>
<script src="src/js/colpick.js"></script>
<script src="src/js/jquery.danmu.js"></script>
<script src="src/js/main.js"></script>



<link rel="stylesheet" type="text/css" href="css/Navigation_M.css">
<link type="text/css" rel="stylesheet" href="css/Video_Watch.css"/>
	<link rel="stylesheet" type="text/css" href="css/Navigation_M.css"/>
	<link type="text/css" rel="stylesheet" href="css/Video_Watch.css"/>

	<script type="text/javascript">
		$(function(){
			$(".top ul li").hover(function(){
				var i=$(this).index();   //鼠标触发的li下标
				$(".con a").eq(i).show().siblings().hide();
				
				$(this).css("z-index","1");
				$(this).css("color","#fff");
				$(this).css("background","url('/msspace/images/navpic.png')");
				$(this).css("onplay","0.5");
				
			},function(){
				$(this).css("z-index","0");
				$(this).css("color","");
				$(this).css("background","url('/msspace/images/navpic1.png')");
				
			})

		});
	</script>
</head>
<body>
	<!-- 网页导航栏 -->
	<div id="Navigation_bar">
		<!-- 导航模块 -->
		<div id="modular-Navigation_bar">
			<!-- 幻方空间LOGO图 -->
			<div id="MS_LoGo">LOGO</div>
			
			<!-- 导航 -->
			<div id="Navigation">
				<ul>
					<li>首页</li>
					<li>视频区</li>
					<li>直播</li>
					<li>书贴</li>
					<li>游戏</li>
					<li>站点商城</li>
				</ul>
			</div>
		</div>
		
		<!-- 搜索模块 -->
		<div id="search_module">
			<!-- 搜索表单块 -->
			<form action="" id="search_Form_module">
				<!-- 搜索 -->
				<input type="text"/>
				<!-- 搜索图标 -->
				<button type="submit" class="search-submit"></button>
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
	<!-- 视频区模块（Video area module） -->
	<img src="${pageContext.request.contextPath }/images/Video_Watch/Web-page_one.png" 
	style="width:1349px;height:629px;opacity:.3;position:absolute;"/>
	<div id="V_B_Modular">
		<!-- 视频的部分区块（Video Partial block） -->
		<div id="V_Sion_B">
			<!-- 视频的相关信息部分（Video Related information section） -->
			<section id="V_R_I_Sion">
				<!-- 视频的标题（Video title） -->
				<section id="Vio-T">
					<div>(伪)《Naruto》真人电影版预告</div>
				</section>
				<!-- 视频的分区分类（Video Partition classification） -->
				<section id="Vio-PC">
					<div>
						<!-- 下一个分区小图标（Next partition small icons） -->
						<a href="MsSpace.html">
							<span>主页&nbsp</span>
						</a>
						<img src="${pageContext.request.contextPath }/images/Video_Watch/V-NP_SI.png" class="V_NP_SI" /> 
						<a href="#">
							<span>&nbsp生活&nbsp</span>
						</a>
						<img src="${pageContext.request.contextPath }/images/Video_Watch/V-NP_SI.png" class="V_NP_SI" /> 
						<a href="#">
							<span>&nbsp日常</span>
						</a>
					</div>
				</section>
				<!-- 视频发布时间、举报（Video Release time、Report） -->
				<section id="Vio-RTR">
					<!-- 时间、举报小图标（Date Report small icons） -->
					<div class="Vio-RTR_DRSI">
						<!-- 时间（Date） -->
						<img src="${pageContext.request.contextPath }/images/Video_Watch/时间.png" 
							class="V_NP_SI" title="时间"/>
						<span title="上传时间">&nbsp;2016-06-15 08:35</span>
					</div>
					<div class="Vio-RTR_DRSI">
						<!-- 举报（Report） -->
						<img src="${pageContext.request.contextPath }/images/Video_Watch/举报.png" 
							class="V_NP_SI" title="举报"/>
						<a href="#">
							<span title="点击举报">&nbsp举报视频</span>
						</a>
					</div>
				</section>
				<!-- 
					视频的播放、弹幕、收藏、评论数量 小图标
					（Video play Barrage Collection comment Number small icons） 
				-->
				<section id="Vio-PBCCN_SI">
					<!-- 播放（play） -->
					<div>
						<img src="${pageContext.request.contextPath }/images/Video_Watch/VIO-PY.png" class="V_PBCC_SI" title="播放"/>
						<span title="播放量">&nbsp 15892</span>
					</div>
					<!-- 弹幕（Barrage） -->
					<div>
						<a href="#">
							<img src="${pageContext.request.contextPath }/images/Video_Watch/VIO-BE.png" class="V_PBCC_SI" title="弹幕"/> 
							<span title="弹幕量">&nbsp11</span>
						</a>
					</div>
					<!-- 评论（comment） -->
					<div>
						<a href="#">
							<img src="${pageContext.request.contextPath }/images/Video_Watch/VIO-CT.png" class="V_PBCC_SI" title="评论"/> 
							<span title="评论数">&nbsp53</span>
						</a>
					</div>
					<!-- 收藏（Collection） -->
					<div>
						<a href="#">
							<img src="${pageContext.request.contextPath }/images/Video_Watch/VIO-CN_no.png" class="V_PBCC_SI" title="收藏"/>
							<span title="收藏数">&nbsp收藏&nbsp&nbsp2333</span>
						</a>
					</div>
				</section>
				<!--
					视频分享 新浪、贴吧、空间、QQ、微信小图标
					（Video share Sina、Post Bar、Space、QQ、WeChar small icons） 
				-->
				<section id="Vio-S">
					<span>
						<!-- 分享小图标（share small icons） -->
						<img src="${pageContext.request.contextPath }/images/Video_Watch/VIO-share_SI.png" id="VIO-S-SI" title="分享到"/>
					</span>
					<!-- 新浪（Sina） -->
					<a href="#">
						<img src="${pageContext.request.contextPath }/images/Video_Watch/VIO-SA_SI.png" class="VS-S_PB_S_Q_W-SI" title="新浪微博"/>
					</a>
					<!-- 贴吧（Post Bar） -->
					<a href="#">
						<img src="${pageContext.request.contextPath }/images/Video_Watch/VIO-PB_SI.png" class="VS-S_PB_S_Q_W-SI" title="百度贴吧"/>
					</a>
					<!-- 空间（Space） -->
					<a href="#">
						<img src="${pageContext.request.contextPath }/images/Video_Watch/VIO-SE_SI.png" class="VS-S_PB_S_Q_W-SI" title="QQ空间"/>
					</a>
					<!-- QQ -->
					<a href="#">
						<img src="${pageContext.request.contextPath }/images/Video_Watch/VIO-QQ_SI.png" class="VS-S_PB_S_Q_W-SI" title="QQ"/>
					</a>
					<!-- 微信（WeChat） -->
					<a href="#">
						<img src="${pageContext.request.contextPath }/images/Video_Watch/VIO-WT_SI.png" class="VS-S_PB_S_Q_W-SI" title="微信"/>
					</a>
				</section>
			</section>
		
			<!-- 视频部分 -->
			<section id="V_Sion">
				<!-- 轮换消息、切换点模块（Rotation news Switching point Modular） -->
				<section id="RN_SP-modular">
					<!-- 轮换消息、切换点块（Rotation news Switching point block） -->
					<div id="RNSP-block">
						<!-- 轮换消息块（Rotation news block） -->
						<section id="RN_block">
						【Magic Space招聘】云计算丨C/C++丨前端Android、IOS丨Java、PHP、Python丨产品/设计/运营 …
						</section>
						<!-- 切换点块（Switching point block） -->
						<section id="SP_block">
							<!-- 切换点圆圈小图标（Switching point circle small icons） -->
							<ul>
								<li><img src="${pageContext.request.contextPath }/images/Video_Watch/RNSP-SPC-SI_YES.png" class="RN_SP-SPC-SI"/></li>
								<li><img src="${pageContext.request.contextPath }/images/Video_Watch/RNSP-SPC-SI_NO.png" class="RN_SP-SPC-SI"/></li>
								<li><img src="${pageContext.request.contextPath }/images/Video_Watch/RNSP-SPC-SI_NO.png" class="RN_SP-SPC-SI"/></li>
								<li><img src="${pageContext.request.contextPath }/images/Video_Watch/RNSP-SPC-SI_NO.png" class="RN_SP-SPC-SI"/></li>
								<li><img src="${pageContext.request.contextPath }/images/Video_Watch/RNSP-SPC-SI_NO.png" class="RN_SP-SPC-SI"/></li>
								<li><img src="${pageContext.request.contextPath }/images/Video_Watch/RNSP-SPC-SI_NO.png" class="RN_SP-SPC-SI"/></li>
							</ul>
						</section>
					</div>
				</section>
				
				<!-- 视频播发块 -->
				<section id="V_broadcast_B">
					<!-- 播放器 -->
				<div id="danmup" style="left: 50%;margin-left:-380px;">
					
				</div>
				</section>
			</section>
			
			<!-- 用户 弹幕 相关视频部分 -->
			<section id="U_B_RV_Sion">
				<img src="${pageContext.request.contextPath }/images/Video_Watch/Video_Watch.png" 
				style="width:366px;height:526px;position:absolute;opacity:.3;"/>
				<!-- 用户、视频相关、弹幕、评论选项卡区域块 -->
				<div id="sdnav">
					<!-- Magic space栏目 -->
					<img src="${pageContext.request.contextPath }/images/title.png" style="margin-bottom:10px;width:360px;"/>

					<!-- 选项卡切换 -->
					<div class="top">
						<ul>
							<li>用户信息</li>
							<li>相关视频</li>
							<li>弹幕列表</li>
							<li>评论列表</li>
						</ul>
					</div>
					<!-- 用户、视频相关、弹幕、评论区块 -->
					<div class="con">
						<!-- 用户信息区块（User information block） -->
						<section>
							<!-- 
								在线观看人数、下载到移动APP观看
								（Watch online The number of、Download to move APP watch） 
							-->
							<section id="WOTNO-DTM_APP_W">
								<!-- 在线观看人数（Watch online The number of） -->
								<div id="WO_T_NO">
									<img src="${pageContext.request.contextPath }/images/Video_Watch/WO_T_NO.png" title="在线人数"/>
									<a href="a" title="查看在线的人"><span>&nbsp;在线观看：1人</span></a>
								</div>
								
								<!-- 下载到移动APP观看（Download to move APP watch） -->
								<div id="DTM_APP_W">
									<img src="${pageContext.request.contextPath }/images/Video_Watch/ic_app_downLoad.png" title="下载手机APP观看"/>
									<a href="a" title="下载手机APP观看"><span>&nbsp;下载手机客户端</span></a>
								</div>
							</section>
							<!-- 
								用户[头像  +关注、私信、投稿/粉丝量、签名]
								User[Head Portrait  +Follow、Private Letter、Submission/Fans Amount、Autograph]
							-->
							<section id="U-HP_FPLSFAA">
								<!-- 用户头像数据（User Head portrait Data） -->
								<div id="UHP_D">
									<!-- 选项卡区块 用户头像数据（Tab block、User Head portrait Data） -->
									<div id="TB-User_HPD">
										<img src="${pageContext.request.contextPath }/images/user/0f8a82b901142a.jpg"/>
									</div>
								</div>
								
								<!-- 
									+关注、私信、投稿/粉丝量、签名小图标
									（+Follow、Private Letter、Submission/Fans Amount、Autograph）
								-->
								<div id="F_PL_SFA_A">
									<!-- +关注（User +Follow） -->
									<div id="User-Follow">
										<img src="${pageContext.request.contextPath }/images/Video_Watch/U-Follow_SI.png" 
										class="F_PL_SFA_A-SI" title="关注用户"/>
										<a href="a"><span>&nbsp;关注</span></a>
									</div>

									<!-- 私信（User Private Letter） -->
									<div id="User-Private_Letter">
										<img src="${pageContext.request.contextPath }/images/Video_Watch/U-Private_Letter_SI.png" 
										class="F_PL_SFA_A-SI" title="私密聊天"/>
										<a href="a"><span>&nbsp;私信</span></a>
									</div>
									
									<!-- 投稿量（User Submission Amount） -->
									<div id="User-Submission_Amount">
										<img src="${pageContext.request.contextPath }/images/Video_Watch/U-Submission_Amount_SI.png" 
											class="F_PL_SFA_A-SI" title="上传"/>
										<a href="a"><span>&nbsp;23个视频</span></a>
									</div>
									
									<!-- 粉丝量（User Fans Amount） -->
									<div id="User-Fans_Amount">
										<img src="${pageContext.request.contextPath }/images/Video_Watch/U-Fans_Amount_SI.png" 
											class="F_PL_SFA_A-SI" title="粉丝"/>
										<a href="a"><span>&nbsp;338920</span></a>
									</div>

									<!-- 签名（User Autograph） -->
									<div id="User-Autograph">
										<img src="${pageContext.request.contextPath }/images/Video_Watch/U-Autograph_SI.png" 
											class="F_PL_SFA_A-SI" title="个性签名"/>
										<a href="a"><span>&nbsp;签名</span></a>
										<p>
											彼岸花，开彼岸，情注定生死。吾问无玩玩
										</p>
									</div>
								</div>
							</section>
							
							<!-- 与视频相关内容的标签（And Video Related content The Label） -->
							<section id="A_V_RCTL">
								<!-- 标签（Label small icons） -->
								<div id="A_V_RCTL-LAbel">
									<img src="${pageContext.request.contextPath }/images/Video_Watch/U-Label_SI.png" title="标签"/>
									<span>&nbsp;&nbsp;视频的相关标签</span>
								</div>
								<ul>
									<li>燃向</li>
									<li>2P正片</li>
									<li>TOS MAD CLUB</li>
									<li>NARUTO</li>
									<li>SOUL'S TEAM</li>
									<li>MEP</li>
									<li>CLANNAD</li>
									<li>NIGAHIGA</li>
									<li>冰菓</li>
									<li>禁忌的边境线</li>
								</ul>
							</section>
							
							<!-- 视频简介（Video brief introduction） -->
							<section id="V_BIon">
								<div id="Video-BI">
									<img src="${pageContext.request.contextPath }/images/Video_Watch/Video-BI.png" title="简介"/>
									<span>&nbsp;&nbsp;视频简介</span>
									<p id="V-BI_TEXT">
										Naruto The Movie! (Official Fake Trailer) youtube.com/watch?v=FEo2ipzypTQNaruto (搬运)
										Naruto The Movie! (Official Fake Trailer) youtube.com/watch?v=FEo2ipzypTQNaruto (搬运)
										Naruto The Movie! (Official Fake Trailer) youtube.com/watch?v=FEo2ipzypTQNaruto (搬运)
										Naruto The Movie! (Official Fake Trailer) youtube.com/watch?v=FEo2ipzypTQNaruto
									</p>
								</div>
							</section>
							
							<!-- 视频点赞、投掷??（Video Click Zambia、Throw） -->
							<section id="VCZ-T">
								<!-- 视频点赞（Video Click Zambia） -->
								<div id="Video_CZ" title="为本视频点赞提高积分">
									<img src="${pageContext.request.contextPath }/images/Video_Watch/Video_CZ.png"/>
									<span>点赞</span>
								</div>
								
								<!-- 视频投掷Magic Space（Video Click Throw Magic Space） -->
								<div id="Video_Throw" title="支持 提高本视频的积分">
									<img src="${pageContext.request.contextPath }/images/Video_Watch/Video_Throw.png"/>
									<span>投掷Magic Space</span>
								</div>
							</section>
						</section>
						<a href="http://www.17sucai.com/"><img src="${pageContext.request.contextPath }/images/2.jpg"/></a>
						<a href="http://www.17sucai.com/"><img src="${pageContext.request.contextPath }/images/3.jpg"/></a>
						<a href="http://www.17sucai.com/"><img src="${pageContext.request.contextPath }/images/4.jpg"/></a>
					</div>
				</div>
				
				
				
				
				
				<!-- 用户 视频相关的选项块 
				<div id="U_V_Option_B">
					
				</div>
				
				<!-- 用户 视频相关 弹幕块
				<div id="U_V_relevant_B_B">
					
				</div>-->
			</section>
		</div>
	</div>
</body>
	<script type="text/javascript">
	function GetQueryString(name)
	{
	     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	     var r = window.location.search.substr(1).match(reg);
	     if(r!=null)return unescape(r[2]); 	     return null;
	}
	
	var text = GetQueryString("text");
	//解决编码问题
	text = escape(text) ;

	$("#danmup").DanmuPlayer({
		src:"/msspace/videos/" + text, //视频的地址
		height: "440px", //区域的高度
		width: "760px" ,//区域的宽度
		urlToGetDanmu:"/msspace/urlToGetDanmu" , //用来接收弹幕信息的url   调用Servlet查询出弹幕的方法，返回JSON数组
		urlToPostDanmu:"/msspace/urlToPostDanmu", //用来存储弹幕信息的url   调用Servlet保存弹幕的方法，接收数据并存储到数据库
	});
	
	
	 $("#danmup .danmu-div").danmu("addDanmu",[
	{ "text":"66666666" ,color:"white",size:1,position:0,time:2}
	,{ "text":"我是帽子绿" ,color:"green",size:1,position:0,time:3}
	,{ "text":"fdsfsdfsdf" ,color:"black",size:1,position:0,time:10}
	,{ "text":"这是顶部弹幕" ,color:"yellow" ,size:1,position:1,time:12}
	,{ "text":"这是底部弹幕" , color:"red" ,size:1,position:2,time:9}
	,{ "text":"大家好，我是伊藤橙" ,color:"orange",size:1,position:1,time:34}
	,{ "text":"我是帽子绿" ,color:"green",size:1,position:0,time:3}
	,{ "text":"的范德萨哈" ,color:"black",size:1,position:0,time:10}
	,{ "text":"这是顶部弹幕" ,color:"yellow" ,size:1,position:1,time:3}
	,{ "text":"这的范德萨幕" , color:"red" ,size:1,position:2,time:9}
	,{ "text":"是否好，我是伊藤橙" ,color:"orange",size:1,position:1,time:25},{ "text":"我是帽子绿" ,color:"green",size:1,position:0,time:3}
	,{ "text":"范德萨发的发斯蒂芬" ,color:"black",size:1,position:0,time:34}
	,{ "text":"rghtynt" ,color:"yellow" ,size:1,position:1,time:45}
	,{ "text":"dssdetr" , color:"red" ,size:1,position:2,time:9}
	,{ "text":"hhsttht" ,color:"orange",size:1,position:1,time:23},{ "text":"我是帽子绿" ,color:"green",size:1,position:0,time:3}
	,{ "text":"哈哈哈啊哈" ,color:"black",size:1,position:0,time:10}
	,{ "text":"rhjghfgf" ,color:"yellow" ,size:1,position:1,time:23}
	,{ "text":"fdsfd幕" , color:"red" ,size:1,position:2,time:9}
	,{ "text":"大家好，我是伊藤橙" ,color:"orange",size:1,position:1,time:33},{ "text":"我是帽子绿" ,color:"green",size:1,position:0,time:3}
	,{ "text":"哈dfsdf啊哈" ,color:"black",size:1,position:0,time:10}
	,{ "text":"这是dfsdf部弹幕" ,color:"yellow" ,size:1,position:1,time:46}
	,{ "text":"dfsdf" , color:"red" ,size:1,position:2,time:9}
	,{ "text":"hf好，我是伊藤橙" ,color:"orange",size:1,position:1,time:64}
	,{ "text":"我是帽子绿" ,color:"green",size:1,position:0,time:45}
	,{ "text":"fdsfsdfsdf" ,color:"black",size:1,position:0,time:45}
	,{ "text":"这是顶部弹幕" ,color:"yellow" ,size:1,position:1,time:42}
	,{ "text":"这是底部弹幕" , color:"red" ,size:1,position:2,time:9}
	,{ "text":"大家好，我是伊藤橙" ,color:"orange",size:1,position:1,time:34}
	,{ "text":"我是帽子绿" ,color:"green",size:1,position:0,time:34}
	,{ "text":"的范德萨哈" ,color:"black",size:1,position:0,time:10}
	,{ "text":"这是顶部弹幕" ,color:"yellow" ,size:1,position:1,time:45}
	,{ "text":"这的范德萨幕" , color:"red" ,size:1,position:2,time:9}
	,{ "text":"是否好，我是伊藤橙" ,color:"orange",size:1,position:1,time:25},{ "text":"我是帽子绿" ,color:"green",size:1,position:0,time:3}
	,{ "text":"范德萨发的发斯蒂芬" ,color:"black",size:1,position:0,time:45}
	,{ "text":"rghtynt" ,color:"yellow" ,size:1,position:1,time:45}
	,{ "text":"dssdetr" , color:"red" ,size:1,position:2,time:49}
	,{ "text":"hhsttht" ,color:"orange",size:1,position:1,time:23},{ "text":"我是帽子绿" ,color:"green",size:1,position:0,time:3}
	,{ "text":"哈哈哈啊哈" ,color:"black",size:1,position:0,time:45}
	,{ "text":"rhjghfgf" ,color:"yellow" ,size:1,position:1,time:45}
	,{ "text":"fdsfd幕" , color:"red" ,size:1,position:2,time:9}
	,{ "text":"大家好，我是伊藤橙" ,color:"orange",size:1,position:1,time:43},{ "text":"我是帽子绿" ,color:"green",size:1,position:0,time:3}
	,{ "text":"哈dfsdf啊哈" ,color:"black",size:1,position:0,time:10}
	,{ "text":"这是dfsdf部弹幕" ,color:"yellow" ,size:1,position:1,time:45}
	,{ "text":"dfsdf" , color:"red" ,size:1,position:2,time:9}
	,{ "text":"hf好，我是伊藤橙" ,color:"orange",size:1,position:1,time:45}
	])
	</script>
</html>