package com.jhta.neocom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.AdressMapper;
import com.jhta.neocom.model.AdressVo;

@Service
public class AdressService {
	@Autowired private AdressMapper mapper;
	
	public int addrTest(AdressVo vo) {
		return mapper.addrTest(vo);
	}
}
