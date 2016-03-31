package com.heheren.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.heheren.dao.DictionarieDao;
import com.heheren.model.Dictionarie;
@Service
public class DictionarieServiceImpl extends BaseServiceImpl<Dictionarie> implements com.heheren.service.DictionarieService{

	
	@Autowired
	private DictionarieDao dictionarieDao;
	
	@Override
	public List<Dictionarie> find(Class<Dictionarie> clz, int id) {
		return dictionarieDao.find(clz, id);
	}
	

}
