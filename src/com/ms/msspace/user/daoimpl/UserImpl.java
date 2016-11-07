package com.ms.msspace.user.daoimpl;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.ms.msspace.user.dao.UserDao;
import com.ms.msspace.user.entity.Users;
import com.ms.msspace.util.JDBCUtil;
import com.ms.msspace.util.MD5Util;

/**
 * 实现用户所操作的功能
 * @author Ms
 *
 */
public class UserImpl implements UserDao {
	// 第一：创建QueryRunner对象
	private QueryRunner qr = new QueryRunner();
	private Connection conn = JDBCUtil.getConnection();

	@Override
	public Users login(Users users) {
		String sql = "select * from users where username = ? and [password] = ?";
		Object[] params = {users.getUsername(),MD5Util.MD5(users.getPassword())};
		Users user = null ;
		try {
			user = qr.query(conn,sql, new BeanHandler<Users>(Users.class),params);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	//注册
	@Override
	public int register(Users user) {
		int r = 0 ;
		String sql = "insert into users ([user_ID], username, [password], email, letterID) values (?,?,?,?,?)";
		
		Object[] params = {
				user.getUser_ID(),user.getUsername(),MD5Util.MD5(user.getPassword()),user.getEmail(),user.getLetterID()
		};
		
		try {
			r = qr.update(conn, sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return r;
	}

	@Override
	public Users selectUsersById(String usersid) {
		String sql = "select * from users where user_ID = ?" ;
		Users users = null ;
		try {
			users = qr.query(conn, sql, new BeanHandler<Users>(Users.class), usersid);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return users;
	}
	
	//通过用户名查找该用户是否存在
	@Override
	public Users isExistUser(String name) {
		String sql = "select * from users where username=?" ;
		Users user = null ;
		try {
			 user = qr.query(conn, sql, new BeanHandler<Users>(Users.class),name);
			 if(user!=null){
				 return user;
			 }
		} catch (SQLException e) {
			throw new RuntimeException();
		}
		
		return null;
	}
	
	//按邮箱查询
	@Override
	public Users isExistEmail(String email) {
		String sql = "select * from users where email=?" ; 
		Users user = null;
		try {
			user = qr.query(conn, sql, new BeanHandler<Users>(Users.class),email);
			if(user!=null){
				return user ;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
