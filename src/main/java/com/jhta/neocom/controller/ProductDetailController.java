package com.jhta.neocom.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.ProductVo;
import com.jhta.neocom.service.ProductService;

@Controller
public class ProductDetailController {
	@Autowired private ProductService service;
	
	@RequestMapping("/productDetail")
	public ModelAndView productDetail(int mem_no,int product_id) {
		ProductVo vo=service.select(product_id);
		ModelAndView mv=new ModelAndView("order_dc/productDetail");
		
			mv.addObject("mem_no",mem_no);
			mv.addObject("vo",vo);
			System.out.println(mv);
		return mv;
	}

}
