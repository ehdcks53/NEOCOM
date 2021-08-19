package com.jhta.neocom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.AdvBoardMapper;
import com.jhta.neocom.model.AdvBoardVo;

@Service
public class AdvBoardService {

@Autowired
private AdvBoardMapper mapper;

public int create(AdvBoardVo vo) {
	return mapper.create(vo);
}
public List<AdvBoardVo> list() {
	return mapper.list();
}
public int delete(int adv_board_no) {
     return mapper.delete(adv_board_no);
}
public int update(AdvBoardVo vo) {
	return mapper.update(vo);
}
public AdvBoardVo find(int adv_board_no) {
	return mapper.find(adv_board_no);
}
}


