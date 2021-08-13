package com.jhta.neocom.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.neocom.model.BoardVo;
import com.jhta.neocom.service.BoardService;



@Controller
public class BoardController {

private static Logger logger = LoggerFactory.getLogger(BoardController.class);

@Autowired
BoardService service;

// 글 작성 get
@RequestMapping(value ="/create", method = RequestMethod.GET)
public void getWrite() throws Exception {
	logger.info("get create");
}
// 글 작성 post
@RequestMapping(value="/create", method = RequestMethod.POST)
public String postWrite(BoardVo vo) throws Exception {
	logger.info("post create");
	
	service.create(vo);
	return "redirect:/";
}
}

