package com.jhta.neocom.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.jhta.neocom.model.MemberRole;
import com.jhta.neocom.model.MemberVo;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	 @Autowired private MemberVo memberVo;
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		Set<MemberRole> roles = memberVo.getRoles();
		List<String> roleName=new ArrayList<String>();
		for(GrantedAuthority auth:authentication.getAuthorities()) {
			roleName.add(auth.getAuthority());
			
		}
		if(roleName.contains("ROLE_ADMIN")) {
			response.sendRedirect(request.getContextPath()+"/admin");
		}else if(roleName.contains("ROLE_NOTUSER")) {
			response.sendRedirect(request.getContextPath()+"/account/login");
		}else {
			response.sendRedirect(request.getContextPath()+"/");
		}
		
	}

}
