package com.ms.msspace.video.service.impl;

import java.util.List;

import com.ms.msspace.factory.MsspaceFactory;
import com.ms.msspace.user.dao.UserDao;
import com.ms.msspace.user.entity.Users;
import com.ms.msspace.util.PagerUtil;
import com.ms.msspace.video.dao.VideoDao;
import com.ms.msspace.video.entity.Videos;
import com.ms.msspace.video.service.dao.VideoServiceDao;

public class VideoServiceDaoImpl implements VideoServiceDao {
	private VideoDao dao = MsspaceFactory.getVideoDaoImpl();
	
	//上传视频
	@Override
	public int videoUpload(Videos videos) {
		
		int r = dao.videoUpload(videos);
		return r;
	}
	
	//搜索视频
	@Override
	public List<Videos> findVideos(String keyword) {
		
		return dao.findVideos(keyword);
	}
	
	
	
	//视频直播
	@Override
	public PagerUtil<Videos> queryVideos(int cpage, int conuts) {
		PagerUtil<Videos> pu = dao.queryVideos(cpage,conuts) ;
		
		List<Videos> videolist = pu.getData() ;
		UserDao userdao = MsspaceFactory.getUserImpl();
		
		for (Videos v : videolist) {
			
			String userid = v.getVideouserid() ;
			
			//用视频表的外键查询该用户
			Users users = userdao.selectUsersById(userid) ;
			
			v.setUsers(users);
		}
		
		return pu ;
	}
	
	@Override
	public PagerUtil<Videos> likeVideos(int cpage, int conuts, String keyWord) {
		PagerUtil<Videos> list = dao.likeVideos(cpage, conuts, keyWord);
		return list ;
	}
	
	@Override
	public PagerUtil<Videos> likeVideo(int cpage, int conuts, String keyWord) {
		PagerUtil<Videos> list = dao.likeVideo(cpage, conuts, keyWord);
		return list ;
	}
	@Override
	public Videos queryVideoById(String videoID) {
		Videos video = dao.queryVideoById(videoID);
		
		//如果
		if(video.getPlay()==0){
			
		}
		return video;
	}
	
}
