package com.ms.msspace.util;

import java.util.Date;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;


/**
 * 对javaBean工具类的封装
 * 
 * @author Ms
 *
 */
public class BeanUtil{

	public static <T> T toBean(Map map, Class<T> clazz){
		/**
		 * 通过反射创建实体对象
		 */
		T bean = null ;
		try {
			bean = clazz.newInstance();
			/**
			 * 把map中的数据封装到bean实体中
			 * 
			 * ConvertUtils.register()方法把
			 * 
			 */
						
			ConvertUtils.register(new DateConverter(), Date.class);
			BeanUtils.populate(bean,map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean ;
	}
}
