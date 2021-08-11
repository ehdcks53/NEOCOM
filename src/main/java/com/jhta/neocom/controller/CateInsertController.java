package com.jhta.neocom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.neocom.model.CategoryVo;
import com.jhta.neocom.service.CategoryService;




@Controller
public class CateInsertController {
		@Autowired private CategoryService service;
		
		@GetMapping("/admin/cate/cateinsert")
		public String insertForm() {
			return "admin/cate/cateinsert";
			
		}
		@PostMapping("/admin/cate/cateinsert")
		public String insert(CategoryVo vo,Model model) {
			try {
				service.insert(vo);
				model.addAttribute("code", "successs");
			}catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("code","fail");
			}
			return "/admin/cate/result";
		}

	}



