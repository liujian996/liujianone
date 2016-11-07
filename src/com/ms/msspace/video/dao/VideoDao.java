package com.ms.msspace.video.dao;

import java.util.List;

import com.ms.msspace.user.entity.Users;
import com.ms.msspace.util.PagerUtil;
import com.ms.msspace.video.entity.Videos;

/**
 * 描述视频的功能
 * @author Ms
 *
 */
public interface VideoDao {
	
	//上传视频
	public int videoUpload(Videos videos) ;
	
	//搜索视频
	public List<Videos> findVideos(String keyword);
	
	public PagerUtil<Videos> queryVideos(int cpage, int conuts) ;
	
	//通过id找用户
	public Users queryUsersById(String usersid) ;
	
	//模糊查询
	public PagerUtil<Videos> likeVideos(int cpage, int conuts,String keyWord) ;
	public PagerUtil<Videos> likeVideo(int cpage, int conuts,String keyWord) ;
	
	//通过视频的id获取该视频信息
	public Videos queryVideoById(String videoID) ;
	
}
