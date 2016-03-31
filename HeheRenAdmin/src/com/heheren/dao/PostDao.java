package com.heheren.dao;

import java.util.List;
import java.util.Map;

import com.heheren.model.Post;
import com.heheren.utils.QiNiu;

public interface PostDao {
	public List<Post> list(Class<Post> clz, Map<String, Object> params);
	public void add(Post post);
	public Post load(Class<Post> clz,int id);
	public void update(Post post);
	public void delete(Class<Post> clz,Map<String, Object> params);
}
