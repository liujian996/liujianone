package com.ms.msspace.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.ms.msspace.user.entity.Users;

/**
 * 这是一个监听器：
 * 		功能就是记录在线人数：
 * 			1.创建一个map集合，用于存放登录的用户
 * 			2.上下文对象的创建 -> 把Map集合设置在上下文对象中，和服务器共存
 * 			3.
 * 
 * 
 * */


@WebListener
public class MapOnlinelistener implements ServletContextListener {
	//创建一个map集合，用于存放登录的用户
	Map<String, Users> userMap = new HashMap<String,Users>() ;
	
    //上下文对象的创建 -> 把Map集合设置在上下文对象中，和服务器共存
    public void contextInitialized(ServletContextEvent evt)  { 
    	//获取上下文对象
        ServletContext context = evt.getServletContext() ;
        //把Map集合设置在上下文对象中
        context.setAttribute("userMap", userMap);
        System.out.println("Map准备就绪...");
    }
    
    //上下文的销毁
    public void contextDestroyed(ServletContextEvent evt)  { 
    	//获取上下文对象
        ServletContext context = evt.getServletContext() ;
        
        //把Map集合从上下文对象中删除
        context.removeAttribute("userMap");
        
    }
}
