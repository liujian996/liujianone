package com.ms.msspace.category.daoimpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.ms.msspace.category.dao.CategoryDao;
import com.ms.msspace.category.entity.Category;
import com.ms.msspace.util.JDBCUtil;


public class CategoryImpl implements CategoryDao {
	private QueryRunner qr = new QueryRunner();
	private Connection conn = JDBCUtil.getConnection();
	@Override
	public void add(Category c) {
		String sql = "insert into category (cid,cname) values(? , ?)"; 
		
		try {
			qr.update(conn, sql, c.getCid(),c.getCname());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Category delete(String cid) {
		return null;
	}

	@Override
	public Category update(String cid) {
		return null;
	}

	@Override
	public List<Category> find() {
		String sql= "select * from category" ;
		List<Category> clist = null ;
		try {
			clist = qr.query(conn, sql, new BeanListHandler<Category>(Category.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clist;
	}
	
	@Override
	public Category find(String cid) {
		String sql = "select * from category where = ? " ;
		Category cy = null ;
		try {
			cy = qr.query(conn, sql, new BeanHandler<Category>(Category.class), cid);
			if(cy!=null){
				return cy ;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
