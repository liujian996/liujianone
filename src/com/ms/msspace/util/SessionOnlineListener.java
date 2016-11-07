package com.ms.msspace.util;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.ms.msspace.user.entity.Users;



@WebListener
public class SessionOnlineListener implements HttpSessionAttributeListener {
	// 属性的添加(设置)
    public void attributeAdded(HttpSessionBindingEvent evt)  { 
        //获取当前session对象
    	HttpSession session = evt.getSession() ;
        //获取上下文对象
    	ServletContext context = session.getServletContext() ;
    	//获取Map集合
    	@SuppressWarnings("unchecked")
		Map<String,Users> map = (Map<String, Users>)context.getAttribute("userMap") ;
    	//获取当前用户的信息
    	System.out.println("把当前的用户信息设置在Map集合中....");
    	Users user = (Users)session.getAttribute("user") ;
    	map.put(user.getUsername(),user) ;
    	//把Map集合重新设置在上下文对象中 ->更新在线人数
    	context.setAttribute("userMap", map);
    	
        
    }

    // 属性的移除
    public void attributeRemoved(HttpSessionBindingEvent evt)  { 
    	 //获取当前session对象
    	HttpSession session = evt.getSession() ;
    	 //获取上下文对象
    	ServletContext context = session.getServletContext() ;
    	// 获取上下文对象中的Map集合
    	@SuppressWarnings("unchecked")
		Map<String, Users> map = (Map<String, Users>)context.getAttribute("userMap") ;
    	// 获取退出登录的用户信息
    	Users user = (Users)evt.getValue() ;
    	// 把当前退出登录的用户从Map集合中移除
    	map.remove(user.getUsername()) ;
    	// 把当前的Map集合重新的设置在上下文对象中->更新在线人数
    	context.setAttribute(user.getUsername(), user);
    	
    }

    // 属性的替换
    public void attributeReplaced(HttpSessionBindingEvent evt)  { 
    	 //获取当前session对象
    	HttpSession session = evt.getSession() ;
        //获取上下文对象
    	ServletContext context = session.getServletContext() ;
    	//获取Map集合
    	@SuppressWarnings("unchecked")
		Map<String,Users> map = (Map<String, Users>)context.getAttribute("userMap") ;
    	
    	//获取之后（当前）的用户信息
    	Users user = (Users)session.getAttribute("user") ;
    	// 把之后的用户从Map集合中添加
    	map.put(user.getUsername(), user) ;
    	// 把当前的Map集合重新的设置在上下文对象中->更新在线人数
    	context.setAttribute("userMap", map);
    }
	
}
