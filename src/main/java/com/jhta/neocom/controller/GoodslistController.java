package com.jhta.neocom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GoodslistController {
	
	@RequestMapping(value = "/goods_list")
    public String frontendGoodsList() {
        return "frontend/goods_list";
    }
	
}
