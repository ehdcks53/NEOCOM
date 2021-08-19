package com.jhta.neocom.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.neocom.model.NoticeBoardVo;
import com.jhta.neocom.service.NoticeBoardService;

@Controller
public class NoticeBoardController {
	@Autowired private NoticeBoardService service;
	
	//공지사항 리스트 페이지 이동
	@RequestMapping(value = "/community/noticeboard_list", method = RequestMethod.GET)
    public String noticeboard_list(Model model,HashMap<String,Object> map) {
		model.addAttribute("list",service.list(map));
        return "frontend/community/noticeboard_list";
    }
	
	//공지사항 상세 페이지 이동
	@RequestMapping(value = "/community/noticeboard_detail", method = RequestMethod.GET)
	public String noticeboard_detail(Model model,int n_board_no) {
		NoticeBoardVo vo = service.detail(n_board_no);
		NoticeBoardVo prev = service.prev(n_board_no);
		NoticeBoardVo next = service.next(n_board_no);
		model.addAttribute("vo",vo);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		return "frontend/community/noticeboard_detail";
	}
	
}
