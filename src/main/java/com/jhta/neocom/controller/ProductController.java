package com.jhta.neocom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	@RequestMapping(value = "/shop/product_list")
    public String frontendGoodsList() {
        return "frontend/shop/product_list";
    }
	
}
