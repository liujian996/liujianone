package com.ms.msspace.test;

import java.io.UnsupportedEncodingException;

public class Urlcode {
	public static void main(String[] args) throws UnsupportedEncodingException {
		String name=java.net.URLEncoder.encode("测试", "UTF-8");
	   /* System.out.println(name);
	    name=java.net.URLEncoder.encode(name,"UTF-8");
	    System.out.println(name);
	    name=java.net.URLDecoder.decode(name, "UTF-8");
	    System.out.println(name);*/
	    System.out.println(java.net.URLDecoder.decode(name, "UTF-8"));
	}
	
}
