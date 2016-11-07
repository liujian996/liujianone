package com.ms.msspace.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.FilenameUtils;

import com.ms.msspace.factory.MsspaceFactory;
import com.ms.msspace.user.entity.Users;
import com.ms.msspace.video.entity.Videos;
import com.ms.msspace.video.service.dao.VideoServiceDao;

import cn.itcast.commons.CommonUtils;

@WebServlet("/commonsfileupload.do")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideoServiceDao dao = MsspaceFactory.getVideoServiceDaoImpl();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 判断用户是否已经登录??
		Users users =  (Users)request.getSession().getAttribute("user");
		
		// 证明用户已经登录了,所有可以进行上传操作
		if (users != null) {
			// 用户存放上传表单中的数据
			Map<String, String> map = new HashMap<String, String>();
			try {
				// 第一：解析请求,判断表单类型是否为:enctype="multipart/form-data"
				boolean isMultipart = ServletFileUpload.isMultipartContent(request);

				if (isMultipart) {
					// 第二：创建文件上传的核心类对象:ServletFileUpload
					ServletFileUpload upload = new ServletFileUpload();

					// 2.1设置最大上传文件的容量大小,以B为单位,1kb=1024b(字节)
					upload.setSizeMax(70000 * 1024);// 69M

					// 第三：获取表单控件的迭代器对象--[获取所有的文件表单项]
					FileItemIterator iter = upload.getItemIterator(request);

					// 第四：通过迭代器对象遍历表单中的所有控制
					while (iter.hasNext()) {

						// 4.1)注：item指是当前表单中某一个控件
						FileItemStream item = iter.next();

						InputStream stream = item.openStream();

						// 第五：判断控制是否是普通控件
						if (item.isFormField()) {
							// 5.1)普通控件->获取控件的值 ->
							// 注：getParameter()方法获取表单控件的值“失效”(传输方式改变)

							// 获取上传表单中传个来的name属性名
							String names = item.getFieldName();
							// 5.1.1)把流转换为字符串--获取上传表单中的值
							String value = Streams.asString(stream, "UTF-8");

							//System.out.println(names + "--" + value);

							// 上传的文件获取不到,把表单中的数据添加到map集合中
							map.put(names, value);

						} else {

							// System.out.println("大小：" + stream.available());
							// 过滤空文件
							if (stream.available() != 0) {
								// 5.2)文件上传控件->以“流”的方式上传

								// 5.2.1)获取上传文件的名称
								// 非IE
								String name = item.getName();
								// System.out.println("name1:" + name);

								// 获取上传文件的name属性名
								String fileNames = item.getFieldName();
								//System.out.println(fileNames + "=fileNames");
								// 处理IE的
								// 注：在IE浏览器,获取上传文件名称name的值为完整路径
								// C:\Users\Administrator\Desktop\文件上传\note.txt转换为note.txt
								name = FilenameUtils.getName(name);

								// System.out.println("name2:" + name);
								// 截取后缀名
								String ext = name.substring(name.lastIndexOf(".") + 1);

								// 以exe || bat结尾的文件,不允许上传
								if ("exe".equals(ext) || "bat".equals(ext)) {
									return;
								}

								// 上传文件到服务器的名称
								String filename = UUID.randomUUID().toString() + name;

								// 5.2.2)获取服务器的真实路径
								String path = request.getServletContext().getRealPath("/WEB-INF/video")
										+ File.separator;

								// System.out.println(path);

								// 判断是否是图片
								if("jpg".equalsIgnoreCase(ext) || "png".equalsIgnoreCase(ext) && filename!=null){

									map.put(fileNames, filename);
									
									
								}else if("MP4".equalsIgnoreCase(ext) ||"avi".equalsIgnoreCase(ext) && filename!=null){
									// 封装视频名称
									map.put(fileNames, filename);
									
									/**
									 * 第一个参数:上传控件对应的文件的输入流 第二个参数:文件上传的路径->输出流
									 * 第三个参数:是否关闭流
									 */
									
									Videos videos = CommonUtils.toBean(map, Videos.class);
									// 封装视频的Id
									videos.setVideo_ID(UuidUtils.uuid());
									// 封装上传视频的用户
								
					
									videos.setUsers(users);
									dao.videoUpload(videos);
									
								 }
								
								// 5.2.3)实现上传
								Streams.copy(stream, new FileOutputStream(path + filename), true);
							}

						}

					}
					
				}

				/*
				 * Set<Entry<String, String>> maps = map.entrySet(); for
				 * (Entry<String, String> entry : maps) {
				 * System.out.println(entry.getKey()+"-=-"+entry.getValue()); }
				 */

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/error/msg.html");
		}
	}

}
