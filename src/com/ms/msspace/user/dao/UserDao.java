package com.ms.msspace.user.dao;

import com.ms.msspace.user.entity.Users;

/**
 * 
 * 描述用户的操作功能
 * @author Ms
 *
 */
public interface UserDao {
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
	public Users selectUsersById(String userid) ;
	
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
