package com.jhta.neocom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.BoardMapper;
import com.jhta.neocom.model.BoardVo;

@Service
public class BoardService {

@Autowired
private BoardMapper mapper;

public int create(BoardVo vo) {
	return mapper.create(vo);
}

public int update(BoardVo vo) {
	return mapper.update(vo);
}
public int remove(int bno) {
	return mapper.remove(bno);
}
public BoardVo select(int bno) {
	return mapper.select(bno);
}
public List<BoardVo> list() {
	return mapper.list();
}
}