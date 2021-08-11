package com.jhta.neocom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.jhta.neocom.service.MemberInfoService;

@Controller
public class Purchase2Controller {
	@Autowired private MemberInfoService service;
	
	@GetMapping("/purchase2")
	public String perchase(String id,String pwd,HttpSession session,Model model) {
		if(session!=null) { //회원인 경우 세션에 아이디 담기
			session.setAttribute("id", id);
			return "order_dc/purchase2";
		}else {
			return "order_dc/purchase2";
		}
		
	}

}
