package com.ms.msspace.util;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.util.Streams;
import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
/***
 * BeanServlet用于做其他Servlet的父类
 * @author 
 *
 */
public class BeanServlet extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");//处理响应编码
		request.setCharacterEncoding("UTF-8");
		
		/**
		 * 1. 获取method参数，它是用户想调用的方法 2. 把方法名称变成Method类的实例对象 3. 通过invoke()来调用这个方法
		 */
		//第一：解析请求,判断表单类型是否为:enctype="multipart/form-data"
		/*boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		if(isMultipart) {
			ServletFileUpload upload = new ServletFileUpload();
				
					FileItemIterator iter;
					try {
						iter = upload.getItemIterator(request);
						try {
							while(iter.hasNext()) {
								
								//4.1)注：item指是当前表单中某一个控件
								FileItemStream item = iter.next() ;
								
								//获取此控件的name属性名称
								String fileldName = item.getFieldName() ;
								InputStream stream = item.openStream() ;
								methodName = Streams.asString(stream, "UTF-8") ;
								System.out.println(fileldName+"_"+methodName);
								if("videoUpload".equals(methodName)){
									parmaterMethod(methodName,request,response) ;
								}
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
						
					} catch (FileUploadException e1) {
						
						e1.printStackTrace();
					}
		}else{*/
			//普通表单
		String methodName= request.getParameter("method");
			parmaterMethod(methodName,request,response) ;
		//}
	}
	
	private void parmaterMethod(String methodName,HttpServletRequest request, HttpServletResponse response){
		Method method = null;
		/**
		 * 2. 通过方法名称获取Method对象
		 */
		try {
			method = this.getClass().getMethod(methodName,
					HttpServletRequest.class, HttpServletResponse.class);
		} catch (Exception e) {
			throw new RuntimeException("您要调用的方法：" + methodName + "它不存在！", e);
		}
		
		/**
		 * 3. 通过method对象来调用它
		 */
		try {
			String result = (String)method.invoke(this, request, response);
			if(result != null && !result.trim().isEmpty()) {//如果请求处理方法返回不为空
				int index = result.indexOf(":");//获取第一个冒号的位置
				if(index == -1) {//如果没有冒号，使用转发
					request.getRequestDispatcher(result).forward(request, response);
				} else {//如果存在冒号
					String start = result.substring(0, index);//分割出前缀
					String path = result.substring(index + 1);//分割出路径
					if(start.equals("f")) {//前缀为f表示转发
						request.getRequestDispatcher(path).forward(request, response);
					} else if(start.equals("r")) {//前缀为r表示重定向
						response.sendRedirect(request.getContextPath() + path);
					}
				}
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
