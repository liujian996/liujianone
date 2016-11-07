package com.ms.msspace.factory;

import com.ms.msspace.user.dao.UserDao;
import com.ms.msspace.user.daoimpl.UserImpl;
import com.ms.msspace.user.service.dao.UserServiceDao;
import com.ms.msspace.user.service.daoimpl.UserServiceDaoImpl;
import com.ms.msspace.video.dao.VideoDao;
import com.ms.msspace.video.daoimpl.VideoDaoImpl;
import com.ms.msspace.video.service.dao.VideoServiceDao;
import com.ms.msspace.video.service.impl.VideoServiceDaoImpl;

public class MsspaceFactory {
	/**
	 * 用户dao工厂
	 * @return
	 */
	public static UserDao getUserImpl(){
		return new UserImpl() ;
	}
	
	public static UserServiceDao getUserServiceDaoImpl(){
		return new UserServiceDaoImpl() ;
	}
	
	//电影工厂Service
	public static VideoServiceDao getVideoServiceDaoImpl(){
		return new VideoServiceDaoImpl() ;
	}
	
	public static VideoDao getVideoDaoImpl(){
		return new VideoDaoImpl() ;
	}
}
