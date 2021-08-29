package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.AdressVo;
import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.AdressService;
import com.jhta.neocom.service.MemberService;
import com.jhta.neocom.service.QnABoardService;

import ch.qos.logback.classic.Logger;

// MyPageController AJAX때문에 컨트롤러 분리했습니다!!

@Controller
public class MyPageOtherController {
	@Autowired
    private MemberService memberService;
	@Autowired
	private AdressService adressService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired private QnABoardService qna_service;	
	
	//마이페이지 배송지관리
	@RequestMapping(value = "/account/mypage_delivery")
    public String frontendMyPageDelivery(Authentication auth, Model model) {
		
		CustomUserDetails cud=(CustomUserDetails) auth.getPrincipal();
		String id=cud.getUsername();
		System.out.println(id);
		List<AdressVo> list=adressService.addrList(id);
		model.addAttribute("list",list); 
		System.out.println("리스트:"+list);
        return "frontend/account/mypage_delivery";
    
	}
	//마이페이지 배송지추가
	@GetMapping("/account/delivery")
	public String PlusdeliveryForm(Model model) {
		return "frontend/account/mypage_plusDelivery";
	}
	//배송지 추가,리스트 재출력
	@PostMapping("/account/delivery")
	public String Plusdelivery(AdressVo vo,Model model,Authentication auth) {
		System.out.println("auth:"+auth);
		System.out.println("우편추가시작");
		System.out.println("우편:"+vo.getZip_code()+"주소1:"+vo.getAddress()+"주소2:"+vo.getAdress_detail());

		CustomUserDetails cud=(CustomUserDetails) auth.getPrincipal();
		MemberVo mvo=cud.getMemberVo();
		String id=cud.getUsername();
		int mem_no=mvo.getMem_no();
		vo.setMem_no(mem_no);
		adressService.addrTest(vo);
		List<AdressVo> list=adressService.addrList(id);
		model.addAttribute("list",list); 
		return "frontend/account/mypage_delivery";
	}
	//배송지 수정
	@GetMapping("/yongupdate")
	public ModelAndView dddefsdf(Authentication auth, int addr_no) {
		System.out.println(addr_no);
		ModelAndView mv=new ModelAndView("frontend/account/mypage_modifyDelivery");
		mv.addObject("vo",adressService.zipSelect(addr_no));
		return mv;
	}
	//배송지 수정및 리스트 재출력
	@PostMapping("/account/modifyDel")
	public String modifyDel(AdressVo vo, Authentication auth, Model model, int addr_no) {
		System.out.println(addr_no);
		System.out.println(vo);
		
		CustomUserDetails cud=(CustomUserDetails) auth.getPrincipal();
		String id=cud.getUsername();
		adressService.addrModify(vo);
		System.out.println("MODIFY VO:"+vo);
		List<AdressVo> list=adressService.addrList(id);
		model.addAttribute("list",list); 

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
    public String pwdModify(Model model) {
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
 }
