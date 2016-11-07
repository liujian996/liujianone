package com.ms.msspace.video.service.dao;

import java.util.List;

import com.ms.msspace.util.PagerUtil;
import com.ms.msspace.video.entity.Videos;

public interface VideoServiceDao {
	
	//上传视频
	public int videoUpload(Videos videos) ;
	
	//搜索视频
	public List<Videos> findVideos(String keyword);
	
	
	//遍历视频----//最新热点
	public PagerUtil<Videos> queryVideos(int cpage,int conuts);
	
	//模糊查询
	public PagerUtil<Videos> likeVideos(int cpage,int conuts,String keyWord);
	public PagerUtil<Videos> likeVideo(int cpage,int conuts,String keyWord);
	//通过视频的id获取该视频的所有信息
	public Videos queryVideoById(String videoID) ;
}
