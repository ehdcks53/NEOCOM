package com.jhta.neocom.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AdressVo {
	private int addr_no;
	private int mem_no;
	private int zip_code;
	private String address;
	private String adress_detail;
}
