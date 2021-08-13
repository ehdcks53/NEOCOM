package com.jhta.neocom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

   
    
    @RequestMapping(value = "/")
    public String frontendIndex() {

        return "frontend/index";
    }

    @RequestMapping(value 
= "/index_original")
    public String frontendIndex_original() {

        return "frontend/index_original";
    }

}
