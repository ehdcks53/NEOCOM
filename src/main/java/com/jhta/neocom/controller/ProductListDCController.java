package com.jhta.neocom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.ProductVo;
import com.jhta.neocom.service.ProductService;





@Controller
public class ProductListDCController {
	@Autowired private ProductService service;
	
	@RequestMapping("/productlistDC")
	public ModelAndView list() {
		List<ProductVo> productlist=service.listTest();
		System.out.println("aaaaaaaa");
		System.out.println(productlist);
		ModelAndView mv=new ModelAndView("order_dc/productlist");
		mv.addObject("productlist",productlist);
		return mv;
	}
}
