package com.ms.msspace.category.dao;

import java.util.List;

import com.ms.msspace.category.entity.Category;

public interface CategoryDao {
	public void add(Category c);
	public Category delete(String cid);
	public Category update(String cid);
	public List<Category> find();
	public Category find(String cid);
}
