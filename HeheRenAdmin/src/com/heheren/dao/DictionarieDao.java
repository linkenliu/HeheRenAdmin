package com.heheren.dao;

import java.util.List;

import java.util.Map;

import com.heheren.model.Dictionarie;

public interface DictionarieDao {
	public List<Dictionarie> list(Class<Dictionarie> clz, Map<String, Object> params);
	public List<Dictionarie> find(Class<Dictionarie> clz, int id);
}
