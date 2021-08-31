package com.jhta.neocom.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminIndexController {

    @GetMapping(value = "admin/")
    public String adminIndex() {

        return "admin/index";
    }
}
