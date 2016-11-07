package com.ms.msspace.video.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ms.msspace.factory.MsspaceFactory;
import com.ms.msspace.util.PagerUtil;
import com.ms.msspace.video.entity.Videos;
import com.ms.msspace.video.service.dao.VideoServiceDao;

import cn.itcast.servlet.BaseServlet;

/**
 * 处理视频的所有请求
 */
@WebServlet("/VideoServlet")
public class VideoServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private VideoServiceDao dao = MsspaceFactory.getVideoServiceDaoImpl() ;
	
	//通过关键字搜索视频
	public void findVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String keyWord = request.getParameter("keyWord");
	
		//判断获取到搜索框的值不为空时,进行搜索
		if(keyWord != null && !keyWord.trim().isEmpty()){
			
			List<Videos> videolist = dao.findVideos(keyWord);
			Gson gson = new Gson() ;
			String videoslist = gson.toJson(videolist);
			response.getWriter().write(videoslist);
		}
	}
	
	//遍历视频
	public void queryVideos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pc = request.getParameter("pc") ;//获取页面
		String keyWord = request.getParameter("kw");
	
		int p =1 ;								//默认为1
		if(pc!=null && pc.matches("\\d+")){		//判断是否为数字,或非空
			p = Integer.parseInt(pc) ;		
		}
		
		PagerUtil<Videos> videosList = dao.likeVideos(p, 9, keyWord);
								      	   
		Gson gson = new Gson() ;
		String pageVideosJson = gson.toJson(videosList);
		
		response.getWriter().write(pageVideosJson) ;
	}
	
	//文本空搜索
	public String likeVideos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyWord = request.getParameter("keyWord");
		
		String cp = request.getParameter("cp") ;//获取页面
	
		int p =1 ;	
		System.out.println("-->"+keyWord);
		//默认为1
		if(cp!=null && cp.matches("\\d+")){		//判断是否为数字,或非空
			p = Integer.parseInt(cp) ;		
		}
		
		PagerUtil<Videos> videosList = dao.likeVideo(p, 10, keyWord);
		
		List<Videos> list  = videosList.getData();
		
		request.setAttribute("videosList", videosList);
		
		String path ="f:jsp/Search_Result.jsp" ;
		if(keyWord!=null && !keyWord.trim().isEmpty()){
			path = "f:jsp/Search_Result.jsp?keyWord="+keyWord+"" ;
		}
		return path ;
	}
	
	//最新热点
	public void videoHot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String cp = request.getParameter("cp") ;//获取页面
	
		int p =1 ;								//默认为1
		if(cp!=null && cp.matches("\\d+")){		//判断是否为数字,或非空
			p = Integer.parseInt(cp) ;		
		}
		
		PagerUtil<Videos> videosList = dao.queryVideos(p, 10);
	
		Gson gson = new Gson() ;
		String pageVideosJson = gson.toJson(videosList);
		
		response.getWriter().write(pageVideosJson) ;
	}
	
	//视频的播放量
	public void playVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String videoid = request.getParameter("videoid") ;//获取视频的id
		
		dao.queryVideoById(videoid);
	}
}
