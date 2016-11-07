$(function(){
	
	//视频的播放量
	$("#modular-THP-LGYL").on("click",".zhibo1 a,.zhibo2 a,.zhibo3 a",function(){
		//向服务器传递一个方法
	
	}) ;
	
	
	//搜索框
	$("#search_form_module_val").blur(function(){
		$("#showMsgDiv #ulMsg").html('') ;
	});
	
	//在鼠标按下的时候,获取该节点上的值,赋值给搜索框
	$("#showMsgDiv").on("mousedown","#ulMsg li",function(){	
		
		var keyWord = $(this).text();
		keyWord = $("#search_form_module_val").val(keyWord) ;
	});
		
	
	//最新热点
	 $("#titlehost").on("mouseover", "li time", function() {
	 $(this).addClass("liemOver"); });
	  
	 $("#titlehost").on("mouseout", "li time", function() {
	 $(this).removeClass("liemOver"); });
	 
	 $("#modu_header-newest").on("mouseover", "#titlehost li a", function() {
	 $(this).addClass("titleSpanOver");
	 $(this).prev("time").addClass("liemOver"); });
	 
	 $("#modu_header-newest").on("mouseout", "#titlehost li a", function() {
	 $(this).removeClass("titleSpanOver");
	 $(this).prev("time").removeClass("liemOver"); });
	 
	
	
	var ht = $("#HT-modular .changeVideo") ;
	var htkw = ht.prev("h2").text();

	ht.click(function(){
		changeVideos(htkw,ht);
	});
	
	var bbl = $("#BBL-modular .changeVideo") ;
	var bblkw = bbl.prev("h2").text();

	bbl.click(function(){
		changeVideos(bblkw,bbl);
	});
	
	var gyl = $("#GYL-modular .changeVideo") ;
	var gylkw = gyl.prev("h2").text();
	gyl.click(function(){
		changeVideos(gylkw,gyl);
	});
	
	
	changeVideos(htkw,ht);
	changeVideos(bblkw,bbl);
	changeVideos(gylkw,gyl);
	
	//最新热点
	test();
});

//搜索框
function keyWordChang(){
	var keyWord = $("#search_form_module_val").val() ;	//获取文本框的值
	if(keyWord != ''){
		
		$.ajax({
			url:"../VideoServlet?method=findVideo",
			type:"post",
			data:"keyWord="+keyWord ,
			dataType : "json",
			success:function(returnedData){
			
				$("#ulMsg").html('') ;//在获取数据之前,清空ui中的所有li
				$.each(returnedData ,function(k,v){
					$("#ulMsg").append("<li>"+v.title+"</li>") ;
				}) ;
			}
		}) ;
	}else{//搜索框为空时,清空该节点
		$("#showMsgDiv #ulMsg").html('') ;
	}
}

function changeVideos(kw,ths){
	var r = ths.find(".cval").val();
	$.ajax({
		url : "../VideoServlet?method=queryVideos",
		type : "post",
		data : "pc="+r+"&kw="+kw ,
		dataType : "json",
		success : function(data) {// data:PagerUtil<Videos>
			if (r >= data.currentPageSize) {
				ths.find(".cval").val(1);
			} else {
				ths.find(".cval").val(r * 1 + 1);// 让页码递增
			}
			
			// 第二个data是返回来的PagerUtil<Videos>中的Videos,
			// 页就是PagerUtil<Videos> 中的一个属性并且这是一个集合
			$.each(data.data, function(i, v) {
				
				if(i<4){
					ths.siblings(".zhibo1").find("div:eq("+i+")").html("<a href='/msspace/video/Video_Watch.jsp?text="+v.videoname+"' target='_blank'><img src='/msspace/videosImages/"+v.videoimg+"' width='190' height='125'/></a>");
					ths.siblings(".zhibo1").find("div:eq("+i+")").append("<p>"+v.title+"</p>");
					
				}else if(i>=4){
					ths.siblings(".zhibo2").find("div:eq("+(i-4)+")").html("<a href='/msspace/video/Video_Watch.jsp?text="+v.videoname+"' target='_blank'><input type='hidden' name='videoid' value='"+v.video_ID+"'/><img src='/msspace/videosImages/"+v.videoimg+"' width='190' height='125'/></a>");
					ths.siblings(".zhibo2").find("div:eq("+(i-4)+")").append("<p>"+v.title+"</p>");
				}
				// 推广
				if(i==8){
					ths.siblings(".zhibo3").html("<a href='/msspace/video/Video_Watch.jsp?text="+v.videoname+"' target='_blank'><input type='hidden' name='videoid' value='"+v.video_ID+"'/><img src='/msspace/videosImages/"+v.videoimg+"' width='338' height='310'/></a>");
				}
			});
		}
	});
}

function test(){
	var r = $("#huantitle input").val();
	$.ajax({
		url:"../VideoServlet?method=videoHot",
		type:"post",
		data:"cp="+r ,
		dataType : "json",
		success:function(returnedData){
			if (r >= returnedData.currentPageSize) {
				 $("#huantitle input").val(1);
			} else {
				 $("#huantitle input").val(r * 1 + 1);// 让页码递增
			}
			$("#titlehost li").html('') ;
			$.each(returnedData.data ,function(k,v){
				
				$("#titlehost li").append("<time> <em>"+v.Release+"</em> </time> ") ;
				$("#titlehost li").append("<a href='/msspace/video/Video_Watch.jsp?text="+v.videoname+"' target='_blank'>"+v.title+"</a>") ;
			}) ;
		}
	}) ;
}

