package com.jhta.neocom.mapper;

import java.util.HashMap;

import com.jhta.neocom.model.PaymentVo;


public interface PaymentMapper {
	int insert(PaymentVo vo);
	int delete(int payment_num);
	int update(HashMap<String, Object> map);
}
