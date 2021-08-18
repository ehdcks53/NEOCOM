package com.jhta.neocom.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.neocom.model.QnABoardVo;
import com.jhta.neocom.service.QnABoardService;

@Controller
public class QnABoardController {
	@Autowired private QnABoardService service;
	
	//문의게시판 리스트 페이지 이동
	@RequestMapping(value = "/community/qnaboard_list", method = RequestMethod.GET)
	public String qnaboard_list(Model model,HashMap<String,Object> map) {
		model.addAttribute("list",service.list(map));
		return "frontend/community/qnaboard_list";
	}
	
	//문의게시판 상세 페이지 이동
	@RequestMapping(value = "/community/qnaboard_detail", method = RequestMethod.GET)
	public String qnaboard_detail(Model model,int qna_board_no) {
		QnABoardVo vo = service.detail(qna_board_no);
		model.addAttribute("vo",vo);
		return "frontend/community/qnaboard_detail";
	}
	
	//문의게시판 등록 페이지 이동
	@RequestMapping(value = "/community/qnaboard_insert", method = RequestMethod.GET)
	public String qnaboard_insert() {
		return "frontend/community/qnaboard_insert";
	}
	
	//문의게시판 글 작성
	@RequestMapping(value = "/community/qnaboard_insert", method = RequestMethod.POST)
	public String qnaboard_insertOk(Model model,QnABoardVo vo,HashMap<String,Object> map) {
		try {
			service.insert(vo);
			model.addAttribute("list",service.list(map));
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(vo);
		return "frontend/community/qnaboard_list";
	}
}
