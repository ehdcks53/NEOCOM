package com.jhta.neocom.mapper;

import java.util.HashMap;
import java.util.List;

import com.jhta.neocom.model.ReviewVo;


public interface ReviewMapper {
	int insert(ReviewVo vo);

	int delete(HashMap<String,Object> map);
	int update(ReviewVo vo);
	int getCount(HashMap<String,Object> map);
	List<HashMap<String,Object>> list(HashMap<String,Object> map); //전체 리스트
	List<HashMap<String,Object>> ajaxlist(HashMap<String,Object> map); //ajax용 리스트
	ReviewVo detail(int board_num);

}
