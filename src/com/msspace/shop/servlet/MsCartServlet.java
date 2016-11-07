package com.msspace.shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.servlet.BaseServlet;

@WebServlet("/MsCartServlet")
public class MsCartServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	//添加购物条目
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	//删除购物条目
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	//清空购物条目
	protected void clear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
