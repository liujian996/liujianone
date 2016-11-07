package com.ms.msspace.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.FilenameUtils;

import com.ms.msspace.product.dao.ProductDao;
import com.ms.msspace.product.entity.Product;

import cn.itcast.commons.CommonUtils;

@WebServlet("/ProductUpload")
public class ProductUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao dao = new ProductDao() ;
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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

						System.out.println(names + "--" + value);

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
							// System.out.println(fileNames + "=fileNames");
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
							String path = request.getServletContext().getRealPath("/shopimages") + File.separator;

							// System.out.println(path);

							// 判断是否是图片
							if ("jpg".equalsIgnoreCase(ext) || "png".equalsIgnoreCase(ext) && filename != null) {

								map.put(fileNames, filename);
								
							} 
							// 5.2.3)实现上传
							Streams.copy(stream, new FileOutputStream(path + filename), true);
						}

					}

				}
				Product product = CommonUtils.toBean(map, Product.class);
				product.setPid(UuidUtils.uuid());
				dao.ProductUpload(product);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
