package com.heheren.dao;

import java.util.List;
import java.util.Map;

import com.heheren.utils.QiNiu;


public interface BaseDao<T> {
	
	public void deleteQiniuImage(QiNiu qiniu);
	
	public String getQiNiuToken(QiNiu qiniu);
	
	public void add(T obj);

	public void update(T obj);
	
	public void delete(Class<T> clz,Map<String, Object> params);

	public T load(Class<T> clz,int id);

	public T load(Class<T> clz,long id);
	
	public T loadBySqlId(String sqlId, Map<String, Object> params);

	public T loadBySqlId(String sqlId, Object obj);


	public List<T> list(Class<T> clz,Map<String, Object> params);
	

	public int findCount(Class<T> clz,Map<String, Object> map) ;
	
}
