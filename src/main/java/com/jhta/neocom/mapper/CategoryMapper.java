package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.CategoryVo;










public interface CategoryMapper {
	int insert(CategoryVo vo);
	List<CategoryVo> list(HashMap<String,Object> map);
	int count(HashMap<String,Object> map);
	int delete(int category_id);
	CategoryVo find(int category_id);
	int update(CategoryVo vo);
}
