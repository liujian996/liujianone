package com.ms.msspace.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import com.ms.msspace.product.entity.Product;
import com.ms.msspace.util.JDBCUtil;

public class ProductDao {
	private QueryRunner qr = new QueryRunner();
	private Connection conn = JDBCUtil.getConnection();
	
	public boolean ProductUpload(Product p){
		String sql = "insert into product (pid,pname,price,pcount,pimg,pdescription,cid) values (? ,? ,? ,? ,? ,? ,? )" ;
		Object[] params = {
				p.getPid(),p.getPname(),p.getPrice(),p.getPcount(),p.getPimg(),p.getPdescription(),p.getCid()
		};
		try {
			int r = qr.update(conn, sql, params);
			if(r>0)
				return true ;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false ;
	}
	
	public List findShop(){
		
		PreparedStatement ps = null ;
		ResultSet rs = null ;
		String sql = "select pid,pname,price,pcount,pimg,pdescription,a.cid,cname from product a,category b where a.cid=b.cid" ;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();//执行sql语句
			List list = new ArrayList();
			while(rs.next()){
				String[] str = new String[8];
				for(int i=0;i<str.length;i++){
					str[i] = rs.getString(i+1);
				}
				list.add(str);
			}
			return list ;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
}
