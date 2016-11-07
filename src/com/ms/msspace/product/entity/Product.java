package com.ms.msspace.product.entity;

/**
 * 商品类
 * @author LJ
 *
 */
public class Product {
	private String pid ; //商品的ID编号
	private String pname ;//商品的名称
	private double price ;//商品的价格
	private int pcount ;//商品的数量
	private String pimg ;//商品的图片
	private String pdescription ;//商品的描述
	private String cid ;//商品的分类
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getPdescription() {
		return pdescription;
	}
	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	
}
