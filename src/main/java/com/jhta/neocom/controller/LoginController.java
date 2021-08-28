package com.jhta.neocom.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.MemberService;

import javassist.bytecode.Descriptor.Iterator;

@Controller
public class LoginController {

	@Autowired
	private MemberService service;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;


	@RequestMapping(value = "/account/login", method = RequestMethod.GET)
	public String loginForm(Model model, HttpSession session, boolean error) {


		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 
		String naverAuthUrl = naverLoginVo.getAuthorizationUrl(session);

		// 네이버
		model.addAttribute("url", naverAuthUrl);
		if (error == true) {
			String errMsg = "아이디 또는 비밀번호가 틀렸습니다.";
			model.addAttribute("errMsg", errMsg);
		}
		 */

		return "frontend/account/login";
	}
	
	@GetMapping("/user")
	public @ResponseBody String user(@AuthenticationPrincipal CustomUserDetails principal) {
		System.out.println("Principal : " + principal);
		System.out.println("OAuth2 : "+principal.getUsername());
		// iterator 순차 출력 해보기
		java.util.Iterator<? extends GrantedAuthority> iter = principal.getAuthorities().iterator();
		while (iter.hasNext()) {
			GrantedAuthority auth = iter.next();
			System.out.println(auth.getAuthority());
		}

		return "유저 페이지입니다.";
	}

	@RequestMapping(value = "/account/login", method = RequestMethod.POST)

	public String login(Authentication authentication, MemberVo vo, Model model, HttpServletRequest req,HttpServletResponse response) throws IOException {
		System.out.println("로그인 컨트롤러 vo : " + vo);
		System.out.println("로그인 컨트롤러 : " + authentication.getPrincipal() + ", " + authentication.getCredentials() + ", "
				+ authentication.getAuthorities());
		PrintWriter out=response.getWriter();
		out.println("<script>alert('');</script>");
		return "redirect:/";
	}

	@RequestMapping(value = "/account/denied", method = RequestMethod.POST)
	public String logout() {
		return "frontend/account/denied";
	}

	@GetMapping("/account/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
