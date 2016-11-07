package com.ms.msspace.product.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ms.msspace.category.daoimpl.CategoryImpl;
import com.ms.msspace.product.dao.ProductDao;
import com.ms.msspace.product.entity.Product;

import cn.itcast.servlet.BaseServlet;


@WebServlet("/ProductServlet")
public class ProductServlet extends BaseServlet{
	private static final long serialVersionUID = 1L;
	
	private ProductDao dao = new ProductDao() ;
	public String findShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List pdlist = dao.findShop() ;
		System.out.println(pdlist.get(7).toString());
		
		request.setAttribute("pdlist", pdlist);
		
		return "f:jsp/MsShop.jsp" ;
	}
}
