package com.jhta.neocom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.service.MemberInfoService;

@Controller
public class PurchaseController {
	@Autowired private MemberInfoService service;
	
	@GetMapping("/purchase")
	public ModelAndView perchase(String product_name,int selling_price,
			HttpSession session,Model model) {
	/*	if(session!=null) { //회원인 경우 세션에 아이디 담기
			session.setAttribute("id", id);
			return "order_dc/purchase";
		}else { */
		
		ModelAndView mv=new ModelAndView("order_dc/purchase");
		mv.addObject("product_name",product_name);
		Object mem_no= session.getAttribute("mem_no");
		mv.addObject("mem_no",mem_no);
		mv.addObject("selling_price",selling_price);
		return mv;
	/*	} */
		
	}

}
