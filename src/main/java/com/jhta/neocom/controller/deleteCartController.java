package com.jhta.neocom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.neocom.service.CartService;


@Controller
public class deleteCartController {
	@Autowired private CartService service;
	
	@GetMapping("/deleteCart")
	public String deleteCart(int cart_no) {
		int n=service.delete(cart_no);
			
		return "redirect:/cartlist";
	}
	
}
