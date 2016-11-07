package com.ms.msspace.user.service.daoimpl;

import com.ms.msspace.factory.MsspaceFactory;
import com.ms.msspace.user.dao.UserDao;
import com.ms.msspace.user.entity.Users;
import com.ms.msspace.user.service.dao.UserServiceDao;

public class UserServiceDaoImpl implements UserServiceDao {
	private UserDao dao = MsspaceFactory.getUserImpl();
	//登录
	@Override
	public Users login(Users users) {
		
		Users user = dao.login(users);
	
		return user;
	}
	
	//注册
	@Override
	public int register(Users user) {
		int r = 0 ;
		
		//调用dao
		r = dao.register(user) ;
		
		return r;
	}
	
	//按用户id查询
	@Override
	public Users selectUsersById(int id) {
		return null;
	}
	
	//按用户名查询
	@Override
	public Users isExistUser(String name) {
		Users user = dao.isExistUser(name);
		if(user!=null){
			return user;
		}
		return null;

	}
	
	//按邮箱查询
	@Override
	public Users isExistEmail(String email) {
		Users user = dao.isExistEmail(email);
		if(user!=null){
			return user ;
		}
		return null;
	}
}
