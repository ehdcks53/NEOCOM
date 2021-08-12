package com.jhta.neocom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.neocom.model.MemberVo;

@Controller
public class Join1Controller {
	@RequestMapping(value="/join1", method = RequestMethod.GET)
	public String join1Form() {
		return "/frontend/join1";
	}
	
	@RequestMapping(value="/join1", method = RequestMethod.POST)
	public String join1(@RequestParam(value = "agree",defaultValue = "false")Boolean agree, Model model) {
		if(!agree) {
			return "/frontend/join1";
		}else {
			model.addAttribute("memberVo", new MemberVo());
			return "/frontend/join2";
		}
		
		
	}
}
