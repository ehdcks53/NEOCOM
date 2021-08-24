package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.OrderMainVo;
import com.jhta.neocom.model.QnABoardVo;
import com.jhta.neocom.service.OrderMainService;
import com.jhta.neocom.service.QnABoardService;

@Controller
public class MyPageController {
    @Autowired private OrderMainService service;
    @Autowired private QnABoardService qna_service;
    

    @RequestMapping(value = "/account/mypage_order")
    public ModelAndView frontendMyPageOrder(Authentication authentication, HttpSession session) {
        CustomUserDetails cud = (CustomUserDetails) authentication.getPrincipal();
        MemberVo vo = cud.getMemberVo();
        int mem_no = vo.getMem_no();
        List<OrderMainVo> myOrderList = service.myOrderList(mem_no);
        ModelAndView mv = new ModelAndView("frontend/account/mypage_order");
        mv.addObject("myOrderList", myOrderList);
        return mv;

    }

    @RequestMapping(value = "/account/mypage_delivery")
    public String frontendMyPageDelivery() {
        return "frontend/account/mypage_delivery";
    }

    // 나의 문의내역
    @RequestMapping(value = "/account/mypage_question")
    public String frontendMyPageQuestion(Model model, Authentication auth) throws Exception {
    	CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		System.out.println(mvo);
		List<HashMap<String, Object>> list = qna_service.myqna(mem_no);
		
		model.addAttribute("list", list);
		System.out.println(list);
		
        return "frontend/account/mypage_question";
    }
    
    @RequestMapping(value = "/account/mypage_qnadetail")
    public String frontendMyPageQnADetail(Model model, Authentication auth) throws Exception {
    	
    	return "frontend/account/mypage_qnadetail";
    }

    @RequestMapping(value = "/account/mypage_wishlist")
    public String frontendMyPageWishlist() {
        return "frontend/account/mypage_wishlist";
    }

    @RequestMapping(value = "/account/mypage_myreview")
    public String frontendMyPageMyreview() {
        return "frontend/account/mypage_myreview";
    }

    @RequestMapping(value = "/account/mypage_modify")
    public String frontendMyPageModify() {
        return "frontend/account/mypage_modify";
    }

}
