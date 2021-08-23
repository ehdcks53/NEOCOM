package com.jhta.neocom.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.neocom.model.NoticeBoardVo;
import com.jhta.neocom.model.QnABoardVo;
import com.jhta.neocom.service.MemberService;
import com.jhta.neocom.service.NoticeBoardService;
import com.jhta.neocom.service.QnABoardService;
import com.jhta.neocom.util.PageUtil;

@Controller
public class CommunityController {
	@Autowired private NoticeBoardService nn_service;
	@Autowired private QnABoardService qq_service;
	@Autowired private MemberService mm_service;
	
	@RequestMapping(value = "/admin/community/board_list", method = RequestMethod.GET)
	public String boardList(@RequestParam(value = "nn_pageNum",defaultValue = "1") int nn_pageNum,String nn_field,String nn_keyword,Model nn_model,HashMap<String,Object> nn_map,
							@RequestParam(value = "qq_pageNum",defaultValue = "1") int qq_pageNum,String qq_field,String qq_keyword,Model qq_model,HashMap<String,Object> qq_map) {
		// 공지사항 리스트
		nn_map.put("nn_field", nn_field);
		nn_map.put("nn_keyword", nn_keyword);
		
		int nn_totlaRowCount = nn_service.getCount(nn_map);  //전체 공지사항 개수
		PageUtil nn_pu = new PageUtil(nn_pageNum, 10, 10, nn_totlaRowCount);
		int nn_startRow = nn_pu.getStartRow()-1;
		int nn_endRow = nn_pu.getEndRow();
		nn_map.put("nn_startRow", nn_startRow);
		nn_map.put("nn_endRow", nn_endRow);
		
		nn_model.addAttribute("nn_list", nn_service.nn_list(nn_map));
		nn_model.addAttribute("nn_pu", nn_pu);
		nn_model.addAttribute("nn_field", nn_field);
		nn_model.addAttribute("nn_keyword", nn_keyword);
		// 공지사항 리스트 끝
		
		// 문의게시판 리스트 ////////////////////////////////////////////////////// reset
		qq_map.put("qq_field", qq_field);
		qq_map.put("qq_keyword", qq_keyword);

		int qq_totalRowCount = qq_service.getCount(qq_map); // 전체 글 개수
		PageUtil qq_pu = new PageUtil(qq_pageNum, 10, 10, qq_totalRowCount);
		int qq_startRow = qq_pu.getStartRow()-1;
		int qq_endRow = qq_pu.getEndRow();

		qq_map.put("qq_startRow", qq_startRow);
		qq_map.put("qq_endRow", qq_endRow);

		qq_model.addAttribute("qq_list", qq_service.qq_list(qq_map));
		qq_model.addAttribute("qq_pu", qq_pu);
		qq_model.addAttribute("qq_field", qq_field);
		qq_model.addAttribute("qq_keyword", qq_keyword);
		// 문의게시판 리스트 끝
		
		return "/admin/menu/community/board_list";
	}
	
	// 공지사항 등록 페이지 이동
	@RequestMapping(value = "/admin/community/noticeboard_insert", method = RequestMethod.GET)
	public String noticeboardInsert() {
		return "/admin/menu/community/noticeboard_insert";
	}
	
	// 공지사항 등록 저장
	@RequestMapping(value = "/admin/community/noticeboard_insert", method = RequestMethod.POST)
	public String noticeboardInsertOk(Model model,NoticeBoardVo vo,HttpSession session) throws Exception{
	//	String id = (String) session.getAttribute("id");
	//	int mem_no = mm_service.searchNo(id);
	//	vo.setMem_no(mem_no);
		vo.setMem_no(2);
		
		System.out.println(vo);
		nn_service.insert(vo);
		
		return "redirect:/admin/community/board_list";
	}
	
	// 공지사항 삭제
	@RequestMapping(value = "/admin/community/noticeboard_delete", method = RequestMethod.GET)
	public String noticeboardDelete(int n_board_no) {
		nn_service.delete(n_board_no);
		return "redirect:/admin/community/board_list";
	}
	
	// 공지사항 수정
	@RequestMapping(value = "/admin/community/noticeboard_update", method = RequestMethod.POST)
	public String noticeboardUpdate(NoticeBoardVo vo) {
		nn_service.update(vo);
		return "redirect:/admin/community/board_list";
	}
	
	
	// 문의게시판 상세보기 페이지 이동
	@RequestMapping(value = "/admin/community/qnaboard_detail", method = RequestMethod.GET)
	public String qnaboardDetail(Model model, int qna_board_no) {
		HashMap<String, Object> map = qq_service.detail(qna_board_no);
		qq_service.cntHit(qna_board_no);
		model.addAttribute("map", map);
		
		return "/admin/menu/community/qnaboard_detail";
	}
	
	// 문의게시판 답변 페이지 이동
	@RequestMapping(value = "/admin/community/qnaboard_reply", method = RequestMethod.GET)
	public String qnaboardReply(Model model, int qna_board_no) {
		HashMap<String, Object> map = qq_service.detail(qna_board_no);
		model.addAttribute("map", map);
		
		return "/admin/menu/community/qnaboard_reply";
	}
	
	// 문의게시판 답변 저장
	@RequestMapping(value = "/admin/community/qnaboard_reply", method = RequestMethod.POST)
	public String qnaboardReplyOk(Model model,QnABoardVo vo,HttpSession session,int qna_board_no) {
	/*	String id = (String) session.getAttribute("id");
		int mem_no = mm_service.searchNo(id);
		vo.setMem_no(mem_no); */
		vo.setMem_no(2);
		
		HashMap<String,Object> map = qq_service.detail(qna_board_no);
		
		int groupNo = Integer.parseInt(map.get("qna_group_no").toString());
		int groupOrder = Integer.parseInt(map.get("qna_group_order").toString());
		int groupDepth = Integer.parseInt(map.get("qna_group_depth").toString());
		
		vo.setQna_group_no(groupNo);
		vo.setQna_group_order(groupOrder);
		vo.setQna_group_depth(groupDepth);
		
		qq_service.insertReply(vo);
		
		return "redirect:/admin/community/board_list";
	}
	
	// 답변 삭제
	@RequestMapping(value = "/admin/community/qnaboard_delete", method = RequestMethod.GET)
	public String qnaboardDelete(int qna_board_no) {
		qq_service.delete(qna_board_no);
		return "redirect:/admin/community/board_list";
	}
}