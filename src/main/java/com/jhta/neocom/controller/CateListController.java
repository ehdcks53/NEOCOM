package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.CategoryVo;
import com.jhta.neocom.service.CategoryService;
import com.jhta.neocom.util.PageUtil;








@Controller
public class CateListController {
	@Autowired CategoryService service;

	@RequestMapping("/admin/cate/catelist")
	public ModelAndView list(@RequestParam(value="pageNum",defaultValue="1")int pageNum,String field,String keyword) {
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("field",field);
		map.put("keyword",keyword);
		
		int totalRowCount=service.getCount(map);//전체 글의 갯수
		PageUtil pu=new PageUtil(pageNum,10, 10, totalRowCount); //한 페이지글의 개수 5개 , 페이지 처리된 개수 5개 
		System.out.println(pu);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();	
		

	


		map.put("startRow",startRow);
		map.put("endRow",endRow);
		List<CategoryVo> list=service.list(map);
		
	
		ModelAndView mv=new ModelAndView("/admin/cate/catelist");
		mv.addObject("list",list);
		mv.addObject("pu",pu);	
		mv.addObject("field",field);
		mv.addObject("keyword",keyword);
//		mv.setViewName("/admin/cate/catelist");
		return mv;
		
	}
}
	
