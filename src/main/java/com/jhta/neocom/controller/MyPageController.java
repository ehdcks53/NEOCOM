package com.jhta.neocom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.OrderMainVo;
import com.jhta.neocom.service.MemberService;
import com.jhta.neocom.service.OrderMainService;

@Controller
public class MyPageController {
    @Autowired
    private OrderMainService service;
    @Autowired
    private MemberService memberService;
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

    @RequestMapping(value = "/account/mypage_question")
    public String frontendMyPageQuestion() {
        return "frontend/account/mypage_question";
    }

    @RequestMapping(value = "/account/mypage_wishlist")
    public String frontendMyPageWishlist() {
        return "frontend/account/mypage_wishlist";
    }

    @RequestMapping(value = "/account/mypage_myreview")
    public String frontendMyPageMyreview() {
        return "frontend/account/mypage_myreview";
    }

    @RequestMapping(value = "/account/mypage_modify", method = RequestMethod.GET)
    public ModelAndView frontendMyPageModify(String id) {
    	ModelAndView mv=new ModelAndView("frontend/account/mypage_modify");
    	mv.addObject("vo",memberService.selectid(id));
    	
        return mv;
    }
    @PostMapping("/account/update")
    public String update(MemberVo vo) {  	
    		memberService.updateNickname(vo);  	
    		memberService.updateName(vo);
    		memberService.updatePhone(vo);
    	return "frontend/account/mypage_order";
    }
    @RequestMapping(value = "/account/pwdmodify", method = RequestMethod.GET)
    public String pwdModifyForm() {
        return "frontend/account/mypage_pwdmodify";
    }
    @RequestMapping(value = "/account/pwdmodify", method = RequestMethod.POST)
    public String pwdModify() {
        return "frontend/account/mypage_pwdmodify";
    }
    @RequestMapping(value = "/account/memberDel", method = RequestMethod.GET)
    public ModelAndView memberDelForm(String id) {
    	ModelAndView mv=new ModelAndView("frontend/account/mypage_memberDelete");
    	mv.addObject("vo",memberService.selectid(id));
        return mv;
    }
    @RequestMapping(value = "/account/memberDel", method = RequestMethod.POST)
    public String memberDel(HttpSession session,MemberVo vo, Model model) {
    	MemberVo user=(MemberVo) session.getAttribute("user");
    	String oldPwd=vo.getPassword();
    	System.out.println("oldPwd:"+oldPwd);
    	String newPwd=user.getPassword();
    	System.out.println("newPwd:"+newPwd);
    	if(!(oldPwd.equals(newPwd))) {
    		model.addAttribute("msg",false);
    		return "redirect:/frontend/account/mypage_memberDelete";
    	}else {
    		memberService.memberDel(vo);
    		return "redirect:/frontend/index";
    	}
      
    }
}



















