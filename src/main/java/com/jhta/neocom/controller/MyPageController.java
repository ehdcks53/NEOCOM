package com.jhta.neocom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	@RequestMapping(value = "/account/mypage")
    public String frontendMyPage() {
        return "frontend/account/mypage";
    }
	
}
