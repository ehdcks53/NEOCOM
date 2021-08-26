package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.MemberService;
import com.jhta.neocom.service.QnABoardService;

import ch.qos.logback.classic.Logger;

// MyPageController AJAX때문에 컨트롤러 분리했습니다!!

@Controller
public class MyPageOtherController {
	@Autowired
    private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired private QnABoardService qna_service;
	
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
    public String memberDel( HttpSession session,MemberVo memberVo, Model model,String password,HttpServletRequest req) {
    	

    	
    	//memberVo.setPassword(bCryptPasswordEncoder.encode(memberVo.getPassword()));
    	//password=req.getParameter("password");	
    	String encode = bCryptPasswordEncoder.encode(password);
    	//System.out.println("encode: "+encode);
    	String voPwd=bCryptPasswordEncoder.encode(memberVo.getPassword());
    	System.out.println("voPwd: "+voPwd);
    	boolean isMatches=bCryptPasswordEncoder.matches(password, voPwd);
    	System.out.println("password: "+password);
    	System.out.println("isMatches: "+isMatches);
    	memberVo.getMem_no();
    	System.out.println("기존vo넘버:"+memberVo.getMem_no());
    	MemberVo vo=new MemberVo(memberVo.getMem_no(),memberVo.getNickname(), memberVo.getPhone(), memberVo.getBirth_date(), null, 
				 memberVo.getName(), memberVo.getId(), memberVo.getPassword(), memberVo.getRoles());
    	System.out.println("새로운mem_no:"+memberVo.getMem_no());
    	if(isMatches==false) {
    		return "frontend/account/mypage_memberDelete";
    	}else { 
    		System.out.println(memberVo.getMem_no()+"+"+memberVo.getId());
    		memberService.delete_role(memberVo.getMem_no());
    		//memberService.memberDel(memberVo);
    		session.invalidate();
    		return "redirect:/";
    	}
    }
//	String result=null;
//	BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
//	
//	MemberVo dbUser=(MemberVo) session.getAttribute("login");
//	if(encoder.matches(password, dbUser.getPassword())) {
//		result="pwConfirmOk";
//		System.out.println("pwConfirmOk");
//	}else {
//		result="pwdConfirmNo";
//		System.out.println("pwdConfirmNo");
//	}
//	return result;
//}
    	
    	
//    	MemberVo member=(MemberVo) session.getAttribute("member");
//    	String oldPwd=member.getPassword();
//    	System.out.println("oldPwd:"+oldPwd);
//    	
//    	
//    	boolean passwordMatch = bCryptPasswordEncoder.matches(password, oldPwd);  // 첫번째 인자는 평문, 두번 째 인자는 암호화로 설정해야 오류가 안난다.
//    	System.out.println("password:"+password);
//    	System.out.println("비밀번호 비교 : " + passwordMatch);
//    	
//    	MemberVo vo=new MemberVo(memberVo.getMem_no(),memberVo.getNickname(), memberVo.getPhone(), memberVo.getBirth_date(), null, 
//				 memberVo.getName(), memberVo.getId(), memberVo.getPassword(), memberVo.getRoles());
//    	if(passwordMatch == true) {
//    		memberService.memberDel(vo);
//    		System.out.println("삭제");
//    		session.invalidate();
//    		return "redirect:/";
//    	} else {
//    		System.out.println("삭제실패");
//    		return "redirect:/user/remove";
//    	}
//    	
//    }  
    
	
	
    }
