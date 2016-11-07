package com.msspace.shop.entity;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 购物车类
 * 
 * 其实购物车就是对集合进行增删改查操作
 * @author LJ
 *
 */
public class MsCart {
	//创建一个Map集合,用户存放商品的Id,获取购物条目
	Map<String,MsCartItem> msCart = new LinkedHashMap<String,MsCartItem>() ;
	
	//合计=所有条目小计之和
	public double getTotal(){
		/**
		 * 因为购物车上也就是Map集合存放N多个购物条目,
		 * 而这些购物条目都有自己的小计,我们只需要把这
		 * 些小计相加就是合计了
		 */
		BigDecimal total = new BigDecimal(0);
		
		//遍历购物车上所有的购物条目,获取这些购物条目的小计
		for (MsCartItem cItems : msCart.values()) {
			//这是一个double类型的BigDecimal
			BigDecimal carttotals = new BigDecimal(cItems.getSubtotal());
			
			//所有购物条目相加得出合计
			total = total.add(carttotals) ;
		}
		return total.doubleValue() ;
	}
	
	//添加购物条目
	public void addPt(MsCartItem cartItem){//这是一个新的条目
		/*如果新条目的商品ID和购物车上的商品ID相同,
		 * 说明这个商品已经存在购物车中,那么我们商品的ID获取该商品,
		 * 改变该商品的数量即可
		 */
		if(msCart.containsKey(cartItem.getMsproduct().getPid())){
			//获取老条目,改变老条目的数量
			MsCartItem oddCartItem =  msCart.get(cartItem.getMsproduct().getPid());
			oddCartItem.setCount(oddCartItem.getCount()+cartItem.getCount());
			msCart.put(cartItem.getMsproduct().getPid(), oddCartItem);
		}else{//否则这是一个新的购物条目
			msCart.put(cartItem.getMsproduct().getPid(), cartItem);
		}
	}
	
	//根据商品的ID编号删除购物车的购物条目
	public void deletePt(String pid){
		msCart.remove(pid) ;
	}
	
	//清空购物车
	public void clearPt(){
		msCart.clear();
	}
	
	//我的购物车,查看(map集合)购物车上的所有商品
	public Collection<MsCartItem> getCartItem(){
		//返回所有的购物条目
		return msCart.values() ;
	}
	
}
