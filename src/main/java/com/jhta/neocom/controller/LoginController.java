package com.jhta.neocom.controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.MemberService;
import com.jhta.neocom.util.MemberLoginInfo;



@Controller
public class LoginController {
	@Autowired private MemberService memberService;
	
	@RequestMapping(value = "/account/login", method = RequestMethod.GET)
    public String loginForm() {
		return "frontend/account/login";
    }
	
	@RequestMapping(value = "/account/login", method = RequestMethod.POST)
    public String login(String id,String password,HttpSession session,Model model) {
    		
		
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		System.out.println(map);
		MemberVo vo=memberService.isMember(map);
		System.out.println(vo);
		if(vo!=null) {
			session.setAttribute("id", id);
			return "redirect:/";
		}else {
			model.addAttribute("errMsg","아이디 또는 비밀번호를 확인해주세요");
			return "frontend/account/login";
		}
    }
	
	@GetMapping("/account/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	

}
