package com.ms.msspace.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.beanutils.Converter;

public class DateConverter implements Converter {
	// 日期格式化对象
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@SuppressWarnings("unchecked")
	@Override
	public <T> T convert(Class<T> type, Object value) {
		//如果type不是Date类型,返回null
		if (type != Date.class) {
			return null;
		}
		
		//如果获取到的值是null 或 是空字符串或是空格都返回null
		if (value == null || "".equals(value.toString().trim())) {
			return null;
		}

		// 判断param对象是否是一个字符串对象
		if (value instanceof String) {
			
			String values = (String) value;

			try {//把values转成sdf指定的格式然后强转为Date类型
				return (T)sdf.parse(values);
			} catch (ParseException e) {
				throw new RuntimeException(e);
			}
		}

		return null;
	}
}
