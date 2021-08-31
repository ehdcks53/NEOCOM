package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.MemberService;

@Controller
public class Join2Controller {
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private MemberService service;

	@RequestMapping(value = "/account/join2", method = RequestMethod.GET)
	public String joinForm(Model model) {
		model.addAttribute("memberVo", new MemberVo());
		return "/frontend/account/join2";

	}

	@RequestMapping(value = "/account/join2", method = RequestMethod.POST)
	public String join(@Valid @ModelAttribute MemberVo memberVo, BindingResult result, Model model) {
		if (result.hasErrors()) {
			System.out.println("에러발생!!");
			return "/frontend/account/join2";
		}
		System.out.println("오예성공");
		memberVo.setPassword(bCryptPasswordEncoder.encode(memberVo.getPassword()));
		MemberVo vo = new MemberVo(memberVo.getMem_no(), memberVo.getNickname(), memberVo.getEmail(),
				memberVo.getPhone(), memberVo.getBirth_date(), null, memberVo.getName(), memberVo.getId(),
				memberVo.getPassword(), memberVo.getRoles());
		service.insert(memberVo);
		service.insert_role(memberVo.getMem_no());
		return "/frontend/account/join3";

	}
	/*
	 * 현재작업중..
	 * 
	 * @RequestMapping("/idcheck.do")
	 * 
	 * @ResponseBody public Map<Object, Object> idcheck(@RequestBody String id) {
	 * 
	 * int count = 0; Map<Object, Object> map = new HashMap<Object, Object>();
	 * 
	 * count = service.idCheck(id); map.put("cnt", count);
	 * 
	 * return map; }
	 */
	// 아이디 중복 검사(AJAX)
	// @RequestMapping(value = "/check_id", method = RequestMethod.POST)
	// public void check_id(@RequestParam("id"), HttpServletResponse response,
	// Authentication authentication) throws Exception{
	// CustomUserDetails cud=(CustomUserDetails)authentication.getPrincipal();
	// String id=cud.getUsername();
	// service.check_id(id, response);
	// }

	// 이메일 중복 검사(AJAX)
	// @RequestMapping(value = "/check_email.do", method = RequestMethod.POST)
	// public void check_email(@RequestParam("email") String email,
	// HttpServletResponse response) throws Exception{
	// service.check_email(email, response);
	// }

	// @RequestMapping(value = "/account/idcheck",produces =
	// {MediaType.APPLICATION_JSON_VALUE})
	// @RequestMapping(value = "/account/idcheck")
	// @ResponseBody
	// public Map<Object, Object> idcheck(@RequestBody String id) {
	//
	// int count = 0;
	// Map<Object, Object> map = new HashMap<Object, Object>();
	//
	// count = service.idcheck(id);
	// map.put("cnt", count);
	//
	// return map;
	// }

}
