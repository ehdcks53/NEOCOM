package com.jhta.neocom.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping(value = "/admin/")
    public String adminIndex() {

        return "admin/index";
    }
}
