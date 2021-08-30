package com.jhta.neocom.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhta.neocom.mapper.MemberMapper;
import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.repository.MemberRepository;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private MemberService service;

	public int insert(MemberVo vo) {
		return mapper.insert(vo);
	}

	public int insert_role(int mem_no) {
		return mapper.insert_role(mem_no);
	}
	

	public MemberVo select(String id) {
		return mapper.select(id);
	}

	public MemberVo isMember(String id) {
		return mapper.isMember(id);
	}

	public int searchNo(String id) {
		return mapper.searchNo(id);
	}

	public List<MemberVo> list() {
		return mapper.list();
	}

	public int updateNickname(MemberVo vo) {
		return mapper.updateNickname(vo);
	}

	public int updateName(MemberVo vo) {
		return mapper.updateName(vo);
	}

	public int updatePhone(MemberVo vo) {
		return mapper.updatePhone(vo);
	}

	public MemberVo selectid(String id) {
		return mapper.selectid(id);
	}

	public int memberDel(MemberVo vo) {
		return mapper.memberDel(vo);
	}

	public int delete_role(int mem_no) {
		return mapper.delete_role(mem_no);
	}

	public MemberVo login(MemberVo vo) {
		return mapper.login(vo);
	}

	public int update(MemberVo vo) {
		return mapper.update(vo);
	}
	public int updatePwd(MemberVo vo) {
		return mapper.updatePwd(vo);
	}

	public int delete(int mem_no) {
		return mapper.delete(mem_no);
	}
	//test
	public MemberVo logina(String id) {
		return mapper.logina(id);
	}
	
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}
	public int emailCheck(String email) {
		return mapper.emailCheck(email);
	}
	
//	public MemberVo findPwd(String id) {
//		return mapper.findPwd(id);
//	}
	
	public boolean checkIdDuplicate(String id) {
		return memberRepository.existsById(id);
	}
	//아이디찾기
	public String find_id(HttpServletResponse response, String phone) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = mapper.findId(phone);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
	public String find_pwd(HttpServletResponse response, String id) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String pwd = mapper.findPwd(id);
		
		if (pwd == null) {
			out.println("<script>");
			out.println("alert('가입된 비번이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return pwd;
		}
	}
	
	
	public MemberVo update_pw(MemberVo member, String old_pw, HttpServletResponse response) throws Exception {
		CustomUserDetails cud=new CustomUserDetails(member);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(!old_pw.equals(service.find_pwd(response, old_pw))) {
			System.out.println("기존비번:"+cud.getPassword());
			out.println("<script>");
			out.println("alert('기존 비밀번호가 다릅니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			service.updatePwd(member);
			return service.logina(old_pw);
		}
	}
	 
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(service.idCheck(id));
		out.close();
	}

	// 이메일 중복 검사(AJAX)
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(service.emailCheck(email));
		out.close();
	}
	public int join_member(MemberVo member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (service.idCheck(member.getId()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (service.emailCheck(member.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {
			service.insert(member);
			return 1;
		}
	}

}