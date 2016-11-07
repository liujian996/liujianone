package com.ms.msspace.user.service.dao;

import com.ms.msspace.user.entity.Users;

public interface UserServiceDao {
	/**
	 * 用户登录
	 * 
	 * @param name 		登录账号
	 * @param password	密码
	 * @return
	 */
	public Users login(Users users) ;
	
	/**
	 * 用户注册
	 * 
	 * @param user 用户相关信息
	 * @return
	 */
	public int register(Users user) ;
	
	/**
	 * 通过id查找用户
	 * 
	 * @param id
	 * @return
	 */
	public Users selectUsersById(int id) ;
	
	/**
	 * 通过用户名查找这个用户是否已经存在
	 * 
	 * @param name
	 * @return
	 */
	public Users isExistUser(String name) ;
	
	
	/**
	 * 通过邮箱号查找这个用户是否已经被注册
	 * 
	 * @param email
	 * @return
	 */
	public Users isExistEmail(String email);
	
	
}
