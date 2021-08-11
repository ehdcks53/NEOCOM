package com.jhta.neocom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.CartVo;
import com.jhta.neocom.service.CartService;




@Controller
public class CartListController {
	@Autowired private CartService service;
	
	@RequestMapping("/cartlist")
	public ModelAndView list(HttpSession session,Model model) {
		List<CartVo> cartList=service.cartList(99);

		ModelAndView mv=new ModelAndView("order_dc/cartlist");
		mv.addObject("cartlist",cartList);
		return mv;
	}
}
