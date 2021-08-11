package com.jhta.neocom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.CategoryVo;
import com.jhta.neocom.service.CategoryService;


@Controller
public class CateUpdateController {
	@Autowired private CategoryService service;
	
	@GetMapping("/admin/cate/update")
	public ModelAndView updateFrom(int category_id) {
		CategoryVo vo=service.find(category_id);
		ModelAndView mv=new ModelAndView("/admin/cate/cateupdate");
		mv.addObject("vo",vo);
//		mv.setViewName("/admin/cate/cateupdate");
		return mv;
	}
	
	
	@PostMapping("/admin/cate/cateupdate")
	public String update(CategoryVo vo,Model model) {
		service.update(vo);
		return "redirect:/admin/cate/catelist";
	
	}

}
