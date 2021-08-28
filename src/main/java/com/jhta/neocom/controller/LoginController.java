package com.jhta.neocom.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	private MemberService service;

	@RequestMapping(value = "/account/login", method = RequestMethod.GET)
	public String loginForm(Model model, HttpSession session, boolean error) {

		return "frontend/account/login";
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
