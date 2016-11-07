package com.ms.msspace.user.web.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ms.msspace.factory.MsspaceFactory;
import com.ms.msspace.user.entity.Users;
import com.ms.msspace.user.service.dao.UserServiceDao;
import com.ms.msspace.util.UuidUtils;
import com.msspace.shop.entity.MsCart;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

/**
 * 处理用户的所有请求
 */
@WebServlet("/UserInfor")
public class UserServlet extends BaseServlet {

	// 调用业务层
	private UserServiceDao dao = MsspaceFactory.getUserServiceDaoImpl();
	
	/**
	 * map集合用于保存错误信息
	 */

	private Map<String, String> errormap = new HashMap<String, String>();
	
	/**
	 * 注册功能
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**
		 * 1.获取注册表单中传递过来的数据 2.封装数据 3.进行合法性验证 4.调用service业务处理 5.把数据添加到数据库
		 */
		
		
		 
		// 从请求中获取表单中的数据,并封装到Users实体中
		Users user = CommonUtils.toBean(request.getParameterMap(), Users.class);
		 
		// 用户的id编号
		user.setUser_ID(UuidUtils.uuid());
		// 私信的ID
		user.setLetterID(UuidUtils.uuid());
		
		//验证昵称
		String username = user.getUsername();
		if (username == null || username.trim().isEmpty()) {
			errormap.put("username", "昵称不能为空");
		} else if (!(username.length() >= 4 && username.length() <= 16)) {
			errormap.put("username", "昵称长度应在4到16字符之间");
		}
		//验证密码
		String password = user.getPassword();
		if (password == null || password.trim().isEmpty()) {
			errormap.put("password", "密码不能为空");
		} else if (!(password.length() >= 6 && password.length() <= 32)) {
			errormap.put("password", "密码长度应在4到16字符之间");
		}
		//验证邮箱
		String email = user.getEmail();
		if (email == null || email.trim().isEmpty()) {
			errormap.put("email", "邮箱不能为空");
		} else if (email.matches("^([\\w\\.\\-])+\\@(([\\w\\-])+\\.)+([\\w]{2,4})+")) {
			errormap.put("email", "请输入正确的邮箱格式");
		}


		//注册成功后跳转的页面
		String path = "r:/error/404.html";
		
		//注册失败后跳转的页面
		if (errormap.size() > 0) {
			request.setAttribute("errormap", errormap);
			request.setAttribute("user", user);
			path =  "f:admin/register.jsp";
		}
		
		
		// 调用serviceDao处理业务
		 int r = dao.register(user);
		if(r==1){//注册成功后,跳转到的页面
			path = "r:/admin/login.jsp";
		}
		
		return path;
	}

	// 验证该用户是否已经存在
	public void checkName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");

		// 调用dao处理业务
		Users user = dao.isExistUser(username);
		// 如果user不等于null说明这个用户是存在的
		if (user != null) {
			response.getWriter().write(user.getUsername());
		}
	}

	// 验证该邮箱是否被注册过
	public void checkEmail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		Users user = dao.isExistEmail(email);
		if (user != null) {
			response.getWriter().write(user.getEmail());
		}
	}
	
	//验证码
	public void checkCoed(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		//验证码验证
				String checkcode_session = (String) request.getSession().getAttribute("checkcode_session");
				String checkcoed = request.getParameter("checkcoed");
				
				if (checkcoed == null || checkcoed.trim().isEmpty()) {
					errormap.put("checkcoed", "验证码不能为空");
				}else if(!(checkcode_session.equals(checkcoed))){
					errormap.put("checkcoed", "验证码不正确");
				}else if(!(checkcoed.length()==4)){
					errormap.put("checkcoed", "验证码必须为4个字符");
				}else{
					response.getWriter().write(checkcode_session);
				}
	}
	
	public String loggin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		Users users = CommonUtils.toBean(request.getParameterMap() , Users.class);
		
		//获取表单中的用户名和密码
	
		String username = users.getUsername();
		String password = users.getPassword();
		Map<String, String> map = new HashMap<String, String>();
		
		if(username==null || username.trim().isEmpty()){
			map.put("username", "昵称不能为空");
		}
		
		if(password==null || password.trim().isEmpty()){
			map.put("password", "密码不能为空");
		}
		
		//调用Service处理业务
		Users user = dao.login(users);
	
		String checkboxs = request.getParameter("checkboxs") ;
		String path = "f:admin/login.jsp";
		//说明该用户是存在的
		if(user!=null){
		
			//保存密码
			if("on".equals(checkboxs)){
				Cookie c1 = new Cookie("username",URLEncoder.encode(username,"UTF-8")) ;
				Cookie c2 = new Cookie("password",password) ;
				c1.setMaxAge(60*60*24);//以秒为单位
				response.addCookie(c1);
				c2.setMaxAge(60*60*24);//以秒为单位
				response.addCookie(c2);
			
			}else{//不保存密码
				Cookie c2 = new Cookie("password","") ;	
				c2.setMaxAge(0);
				response.addCookie(c2);
			}
			//request.getSession().invalidate();
			request.getSession().setAttribute("user", user);
			
			//用户登录成功后,给用户分配一台购物车
			request.getSession().setAttribute("MsCart", new MsCart());
			path = "r:/jsp/MsSpace.jsp" ;
			
		}
		
		if(map.size()>0){
			request.setAttribute("loginMap", map);
			
			path =  "f:admin/login.jsp" ;
		}
		
		return path ;
	}
	
	//退出登录
	public String exit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		request.getSession().invalidate();
		return "r:/admin/login.jsp" ;
	}
}
