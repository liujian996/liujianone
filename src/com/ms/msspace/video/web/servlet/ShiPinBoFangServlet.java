package com.ms.msspace.video.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ms.msspace.user.entity.Users;

import cn.itcast.servlet.BaseServlet;

/**
 * Servlet implementation class ShiPinBoFangServlet
 */
@WebServlet("/ShiPinBoFangServlet")
public class ShiPinBoFangServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	public String shiPinBoFang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("运行了");
		
		Users user = new Users() ;
		user = (Users)request.getSession().getAttribute("user") ;
		System.out.println(user.getUsername());
		return "f:video/Video_Watch.jsp";
		
	}

}
