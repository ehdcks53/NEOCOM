package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.CategoryMapper;
import com.jhta.neocom.model.CategoryVo;








@Service
public class CategoryService {
	
	@Autowired private CategoryMapper mapper;
	public void setDao(CategoryMapper mapper) {
		this.mapper = mapper;
	}
	
	public int insert(CategoryVo vo) {
		return mapper.insert(vo);
	}
	public List<CategoryVo> list(HashMap<String,Object> map){
		return mapper.list(map);
		
	}
	public int getCount(HashMap<String,Object> map) {
		return mapper.count(map);
	}
	public CategoryVo find(int category_id) {
		return mapper.find(category_id);
	}
	public int delete(int category_id) {
		return mapper.delete(category_id);
	}
	public int update(CategoryVo vo) {
		return mapper.update(vo);
	}


	
	
	


}
