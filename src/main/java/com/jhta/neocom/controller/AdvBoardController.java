package com.jhta.neocom.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.AdvBoardVo;
import com.jhta.neocom.service.AdvBoardService;



@Controller
public class AdvBoardController {



@Autowired
AdvBoardService service;

// 글 작성 get
@RequestMapping(value ="advboard/create", method = RequestMethod.GET)
public String getWrite() throws Exception {
    return "frontend/board/BoardCreate";
}
// 글 작성 post
@RequestMapping(value="advboard/create", method = RequestMethod.POST)
public String postWrite(AdvBoardVo vo) throws Exception {
	service.create(vo);
	return "redirect:/";
}
// 글 목록   
@RequestMapping("advboard/list")
public ModelAndView list(HttpSession session,Model model) {
	List<AdvBoardVo> list=service.list();
	ModelAndView mv=new ModelAndView("frontend/board/BoardList");
	mv.addObject("advboardlist",list);
	return mv;
}
//글 삭제
@GetMapping("advboard/delete")
public String getDelete(int adv_board_no) throws Exception {
	service.delete(adv_board_no);
	return "redirect:/advboard/list";
}

//글 수정 post
@PostMapping("advboard/update")
public String postupdate(AdvBoardVo vo,Model model) {
	System.out.println(vo);
	service.update(vo);
	return "redirect:/advboard/list";
	
}
//글 수정 get
@GetMapping("advboard/update")
public ModelAndView update(int adv_board_no,Model model) {
	AdvBoardVo vo=service.find(adv_board_no);
	ModelAndView mv=new ModelAndView("frontend/board/BoardUpdate");
			mv.addObject("vo",vo);
			return mv;
	
}
}