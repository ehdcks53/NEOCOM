package com.jhta.neocom.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.neocom.service.CartService;


@Controller
public class InsertCartController {
	@Autowired private CartService service;
	
	@GetMapping("/insertCart")
	public String insertCart(int mem_no,String product_id) {
		HashMap<String , Object> map=new HashMap<String, Object>();
	
		map.put("mem_no",mem_no);
		map.put("product_id",product_id);
		int n=service.insert(map);
			
		return "redirect:/";
	}
	
}
