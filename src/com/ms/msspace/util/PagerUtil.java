package com.ms.msspace.util;

import java.util.List;

/**
 * 定义一个分页的工具类
 * 
 * @author Administrator
 *
 */
public class PagerUtil<T> {
	//当前页
	private int currentPage ;
	
	//每一页的记录数，即当页面有多少条信息
	private int pageConut ;
	
	//总记录数，即数据库一共有多少条信息
	private int totalConut ;
	
	//总页数
	/**
	 * 整除 : 总页数 = 总记录数 / 每一页的记录数
	 * 不整除 : 总页数 = 总记录数 / 每一页的记录数 + 1
	 */
	private int currentPageSize ;
	
	//封装每一页的数据
	private List<T> data ;
	
	//当前页
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	//每一页的记录数
	public int getPageConut() {
		return pageConut;
	}
	
	public void setPageConut(int pageConut) {
		this.pageConut = pageConut;
	}
	
	
	//总记录数
	public int getTotalConut() {
		
		return totalConut;
	}

	public void setTotalConut(int totalConut) {
		this.totalConut = totalConut;
	}
	
	//总页数
	public int getCurrentPageSize() {
		//总页数=(总记录数+每页记录数-1)/每页记录数
		return currentPageSize = (this.totalConut+this.pageConut-1) / this.pageConut ;
	} 
	
	//总页数不能进行设置
	/*
	public void setCurrentPageSize(int currentPageSize) {
		this.currentPageSize = currentPageSize;
	}
	*/
	//每一页的数据
	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}
}
