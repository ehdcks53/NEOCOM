package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.WishlistVo;
import com.jhta.neocom.service.MemberService;
import com.jhta.neocom.service.QnABoardService;
import com.jhta.neocom.service.WishlistService;

// MyPageController AJAX때문에 컨트롤러 분리했습니다!!

@Controller
public class MyPageOtherController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private QnABoardService qna_service;
	@Autowired
	private WishlistService wishlist_service;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

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
		// System.out.println(mvo);
		List<HashMap<String, Object>> list = qna_service.myqna(mem_no);

		model.addAttribute("list", list);

		return "frontend/account/mypage_question";
	}

	// @RequestMapping(value = "/account/mypage_qnadetail")
	// public String frontendMyPageQnADetail(Model model, Authentication auth)
	// throws Exception {
	//
	// return "frontend/account/mypage_qnadetail";
	// }

	// 관심상품 리스트 출력
	@RequestMapping(value = "/account/mypage_wishlist")
	public String frontendMyPageWishlist(Model model, Authentication auth) throws Exception {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();
		List<HashMap<String, Object>> list = wishlist_service.list(mem_no);

		model.addAttribute("list", list);

		return "frontend/account/mypage_wishlist";
	}

	// 관심상품 db 저장 / db 삭제
	@RequestMapping(value = "/account/mypage_wishinsert", produces = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody HashMap<String, Object> frontendMyPageWishInsert(Authentication auth, int product_id) {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();

		WishlistVo vo = new WishlistVo();
		vo.setMem_no(mem_no);
		vo.setProduct_id(product_id);

		int n = wishlist_service.getCount(vo);

		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("회원번호:" + mem_no + ", " + "상품번호:" + product_id);

		map.put("mem_no", mem_no);
		map.put("product_id", product_id);

		if (n != 0) {
			wishlist_service.delete(map);
			map.put("status", 0);
		} else {
			wishlist_service.insert(map);
			map.put("status", 1);
		}

		return map;
	}

	// 관심상품 마이페이지 내에서 삭제
	@RequestMapping(value = "/account/mypage_wishdelete", method = RequestMethod.GET)
	public String frontendMyPageWishDelete(Authentication auth, int product_id) throws Exception {
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		int mem_no = mvo.getMem_no();

		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("회원번호:" + mem_no + "," + "상품번호:" + product_id);

		map.put("mem_no", mem_no);
		map.put("product_id", product_id);

		wishlist_service.delete(map);

		return "redirect:/account/mypage_wishlist";
	}

	@RequestMapping(value = "/account/mypage_myreview")
	public String frontendMyPageMyreview() {
		return "frontend/account/mypage_myreview";
	}

	@RequestMapping(value = "/account/mypage_modify", method = RequestMethod.GET)
	public ModelAndView frontendMyPageModify(String id) {
		ModelAndView mv = new ModelAndView("frontend/account/mypage_modify");
		mv.addObject("vo", memberService.selectid(id));

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
		ModelAndView mv = new ModelAndView("frontend/account/mypage_memberDelete");
		mv.addObject("vo", memberService.selectid(id));
		return mv;
	}

	@RequestMapping(value = "/account/memberDel", method = RequestMethod.POST)
	public String memberDel(HttpSession session, MemberVo memberVo, Model model, String password) {

		// memberVo.setPassword(bCryptPasswordEncoder.encode(memberVo.getPassword()));
		// password=req.getParameter("password");
		String encode = bCryptPasswordEncoder.encode(password);
		// System.out.println("encode: "+encode);
		String voPwd = bCryptPasswordEncoder.encode(memberVo.getPassword());
		System.out.println("voPwd: " + voPwd);
		boolean isMatches = bCryptPasswordEncoder.matches(password, voPwd);
		System.out.println("password: " + password);
		System.out.println("isMatches: " + isMatches);
		memberVo.getMem_no();
		System.out.println("기존vo넘버:" + memberVo.getMem_no());
		MemberVo vo = new MemberVo(memberVo.getMem_no(), memberVo.getNickname(), memberVo.getPhone(),
				memberVo.getBirth_date(), null, memberVo.getName(), memberVo.getId(), memberVo.getPassword(),
				memberVo.getRoles());
		System.out.println("새로운mem_no:" + memberVo.getMem_no());
		if (isMatches == false) {
			return "frontend/account/mypage_memberDelete";
		} else {
			System.out.println(memberVo.getMem_no() + "+" + memberVo.getId());
			memberService.delete_role(memberVo.getMem_no());
			// memberService.memberDel(memberVo);
			session.invalidate();
			return "redirect:/";
		}
	}

}
