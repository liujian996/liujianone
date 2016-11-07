package com.ms.msspace.category.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ms.msspace.category.daoimpl.CategoryImpl;
import com.ms.msspace.category.entity.Category;
import com.ms.msspace.util.UuidUtils;

import cn.itcast.servlet.BaseServlet;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private CategoryImpl dao = new CategoryImpl() ;
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cname = request.getParameter("cname");
		Category cy= new Category() ;
		cy.setCid(UuidUtils.uuid());
		cy.setCname(cname);
		dao.add(cy);
	}
	
	//查询所有的商品类型并转发到添加商品的页面
	public String find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category>  clist = dao.find();
		request.setAttribute("clist", clist);
		
		return "f:admin/shopUpload.jsp" ;
	}

}
