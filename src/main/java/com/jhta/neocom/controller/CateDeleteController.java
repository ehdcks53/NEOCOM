package com.jhta.neocom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.neocom.service.CategoryService;



@Controller
public class CateDeleteController {
	@Autowired private CategoryService service;

	@RequestMapping("/admin/cate/delete")
	public String delete(int category_id) {
		service.delete(category_id);
		return "redirect:/admin/cate/catelist";
	}
}
