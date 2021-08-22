package com.jhta.neocom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.MemberMapper;
import com.jhta.neocom.model.MemberVo;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;

	public int insert(MemberVo vo) {
		return mapper.insert(vo);
	}

	public int insert_role(String id) {
		return mapper.insert_role(id);
	}

	public MemberVo select(String id) {
		return mapper.select(id);
	}

	public MemberVo isMember(HashMap<String, String> map) {
		return mapper.isMember(map);
	}

	public int searchNo(String id) {
		return mapper.searchNo(id);
	}

	public List<MemberVo> list() {
		return mapper.list();
	}
}