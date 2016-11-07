package com.msspace.shop.entity;

import java.math.BigDecimal;

import com.ms.msspace.product.entity.Product;

/**
 * 这是一个购物条目类
 * 
 * @author LJ
 *
 */
public class MsCartItem {
	private Product msproduct ;//商品
	private int count ;//商品的数量
	
	//购物车上所有的商品的小计
	public double getSubtotal() {
		//商品的价格 * 商品的数量 = 该商品的总价格
		
		/**
		 * 处理二进制运算误差
		 */
		BigDecimal bd = new BigDecimal("+msproduct.getPrice()+") ;
		BigDecimal bd1 = new BigDecimal("+count+") ;
		return bd.multiply(bd1).doubleValue() ;
	}
	
	public Product getMsproduct() {
		return msproduct;
	}
	public void setMsproduct(Product msproduct) {
		this.msproduct = msproduct;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
