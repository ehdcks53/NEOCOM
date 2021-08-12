package com.jhta.neocom.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.jhta.neocom.service.ImgFileService;
import com.jhta.neocom.service.ProductService;
import com.jhta.neocom.util.PageUtil;


@Controller
public class IndexController {

	@Autowired ProductService service;
	@Autowired ImgFileService service1;
	@Autowired
	ServletContext sc;
	
    @RequestMapping(value = "/")
    
    	public ModelAndView frontend(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field,
    			String keyword) {
    		HashMap<String, Object> map = new HashMap<String, Object>();
    		map.put("field", field);
    		map.put("keyword", keyword);

    		int totalRowCount = service.getCount(map);// 전체 글의 갯수
    		PageUtil pu = new PageUtil(pageNum, 10, 10, totalRowCount);
    		System.out.println(pu);
    		int startRow = pu.getStartRow();
    		int endRow = pu.getEndRow();

    		map.put("startRow", startRow);
    		map.put("endRow", endRow);
    		List<HashMap<String, Object>> list = service.list(map);
    		System.out.println("list"+list);

    		ModelAndView mv = new ModelAndView("/frontend/index");
    		mv.addObject("list", list);
    		mv.addObject("pu", pu);
    		mv.addObject("field", field);
    		mv.addObject("keyword", keyword);
    		// mv.setViewName("/admin/cate/catelist");
    		
//    		
//    		Product_ImgVo vo=service1.find(product_img_no);
//    		
//    		String dir=sc.getRealPath("/resources/upload");
//    		File f=new File(dir +"\\" + vo.getImg_name_save());//다운로드할 파일에 대한 정보를 갖는 File객체
////    		String filename=vo.getOrgfilename();//다운로드창에 보여질 파일명
////    		long filesize=vo.getFilesize();//다운로드할 파일크기
////    		//다운로드할 파일정보를 모델객체에 담기
////    		model.addAttribute("file",f);
////    		model.addAttribute("filename",filename);
////    		model.addAttribute("filesize",filesize);
////    		return "filedownloadView";
//    		mv.addObject("file",f);
    		return mv;
        
    }

    @RequestMapping(value = "/index_original")
    public String frontendIndex_original() {

        return "frontend/index_original";
    }

}
