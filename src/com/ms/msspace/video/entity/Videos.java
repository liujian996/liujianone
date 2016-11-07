package com.ms.msspace.video.entity;

import com.ms.msspace.user.entity.Users;

/**
 * 描述视频的实体
 * @author Ms
 *
 */
public class Videos {
	private String video_ID ;				//视频ID
	private String title;					//标题
	private String type;					//类型
	private String introduction;			//简介
	private String Release;           		//发布时间
	private int praise;						//点赞数量
	private int share;	 					//关注量
	private int concern;					//分享量
	private int audience;					//观众人数
	private int collection;  				//收藏量
	private int play;						//播放量
	private int support ;					//支持量
	private int status ;					//状态0:表示播放成功--状态1:表示播放失败
	private int danmaku ;					//弹幕量
	private String videoname;				//视频名称
	private String videoimg ;				//视频图片
	private String videouserid ;			//用户的id
	private Users users ;
	
	
	
	
	public String getVideouserid() {
		return videouserid;
	}
	public void setVideouserid(String videouserid) {
		this.videouserid = videouserid;
	}
	
	public String getVideoimg() {
		return videoimg;
	}
	public void setVideoimg(String videoimg) {
		this.videoimg = videoimg;
	}
	public String getVideo_ID() {
		return video_ID;
	}
	public void setVideo_ID(String video_ID) {
		this.video_ID = video_ID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	public String getRelease() {
		return Release;
	}
	public void setRelease(String release) {
		Release = release;
	}
	public int getConcern() {
		return concern;
	}
	public void setConcern(int concern) {
		this.concern = concern;
	}
	public int getPraise() {
		return praise;
	}
	public void setPraise(int praise) {
		this.praise = praise;
	}
	public int getShare() {
		return share;
	}
	public void setShare(int share) {
		this.share = share;
	}
	public int getAudience() {
		return audience;
	}
	public void setAudience(int audience) {
		this.audience = audience;
	}
	public int getCollection() {
		return collection;
	}
	public void setCollection(int collection) {
		this.collection = collection;
	}
	public int getPlay() {
		return play;
	}
	public void setPlay(int play) {
		this.play = play;
	}
	public int getSupport() {
		return support;
	}
	public void setSupport(int support) {
		this.support = support;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getDanmaku() {
		return danmaku;
	}
	public void setDanmaku(int danmaku) {
		this.danmaku = danmaku;
	}

	public String getVideoname() {
		return videoname;
	}
	public void setVideoname(String videoname) {
		this.videoname = videoname;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	
	
}
