package com.jhta.neocom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.jhta.neocom.model.AddressVo;
import com.jhta.neocom.model.CustomUserDetails;
import com.jhta.neocom.model.MemberVo;
import com.jhta.neocom.model.WishlistVo;
import com.jhta.neocom.service.AddressService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jhta.neocom.service.MemberService;
import com.jhta.neocom.service.QnABoardService;
import com.jhta.neocom.service.WishlistService;

import ch.qos.logback.classic.Logger;

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
	private AddressService adressService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;	

	// 마이페이지 배송지관리
	@RequestMapping(value = "/account/mypage_delivery")
	public String frontendMyPageDelivery(Authentication auth, Model model) {

		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		String id = cud.getUsername();
		System.out.println(id);
		List<AddressVo> list=adressService.addrList(id);
		model.addAttribute("list",list); 
		System.out.println("리스트:"+list);
        return "frontend/account/mypage_delivery";
	}

	// 마이페이지 배송지추가
	@GetMapping("/account/delivery")
	public String PlusdeliveryForm(Model model) {
		return "frontend/account/mypage_plusDelivery";
	}

	// 배송지 추가,리스트 재출력
	@PostMapping("/account/delivery")
	public String Plusdelivery(AddressVo vo,Model model,Authentication auth) {
		System.out.println("auth:"+auth);
		System.out.println("우편추가시작");
		System.out.println("우편:" + vo.getZip_code() + "주소1:" + vo.getAddress() + "주소2:" + vo.getAdress_detail());

		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		MemberVo mvo = cud.getMemberVo();
		String id = cud.getUsername();
		int mem_no = mvo.getMem_no();
		vo.setMem_no(mem_no);
		adressService.addrTest(vo);
		List<AddressVo> list=adressService.addrList(id);
		model.addAttribute("list",list); 
		return "frontend/account/mypage_delivery";
	}

	// 배송지 수정
	@GetMapping("/yongupdate")
	public ModelAndView dddefsdf(Authentication auth, int addr_no) {
		System.out.println(addr_no);
		ModelAndView mv = new ModelAndView("frontend/account/mypage_modifyDelivery");
		mv.addObject("vo", adressService.zipSelect(addr_no));
		return mv;
	}

	// 배송지 수정및 리스트 재출력
	@PostMapping("/account/modifyDel")
	public String modifyDel(AddressVo vo, Authentication auth, Model model, int addr_no) {
		System.out.println(addr_no);
		System.out.println(vo);
		CustomUserDetails cud = (CustomUserDetails) auth.getPrincipal();
		String id = cud.getUsername();
		adressService.addrModify(vo);
		System.out.println("MODIFY VO:"+vo);
		List<AddressVo> list=adressService.addrList(id);
		model.addAttribute("list",list); 


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

	// 회원정보수정페이지
	@RequestMapping(value = "/account/mypage_modify", method = RequestMethod.GET)
	public ModelAndView frontendMyPageModify(String id) {
		ModelAndView mv = new ModelAndView("frontend/account/mypage_modify");
		mv.addObject("vo", memberService.selectid(id));

		return mv;
	}

	// 회원정보수정
	@PostMapping("/account/update")
	public String update(MemberVo vo) {
		memberService.updateNickname(vo);
		memberService.updateName(vo);
		memberService.updatePhone(vo);
		return "frontend/account/mypage_order";
	}

	@RequestMapping(value = "/account/pwdmodify", method = RequestMethod.GET)
	public ModelAndView pwdModifyForm() {
		return new ModelAndView("frontend/account/find_PwdResult");
	}

	// test===============================================================
	@RequestMapping(value = "/account/pwdmodify", method = RequestMethod.POST)
	public String update_pw(@ModelAttribute MemberVo member, @RequestParam("old_pw") String old_pw, HttpSession session,
			HttpServletResponse response, RedirectAttributes rttr) throws Exception {

		session.setAttribute("member", memberService.update_pw(member, old_pw, response));
		rttr.addFlashAttribute("msg", "비밀번호 수정 완료");
		return "redirect:/member/find_PwdResult";
	}

	// ========================================================================
	@RequestMapping(value = "/account/memberDel", method = RequestMethod.GET)
	public ModelAndView memberDelForm(String id) {
		ModelAndView mv = new ModelAndView("frontend/account/mypage_memberDelete");
		mv.addObject("vo", memberService.selectid(id));
		return mv;
	}

	@RequestMapping(value = "/account/memberDel", method = RequestMethod.POST)
	public String memberDel(HttpSession session, MemberVo memberVo, Model model, String password,
			HttpServletRequest req) {
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
		MemberVo vo = new MemberVo(memberVo.getMem_no(), memberVo.getNickname(), memberVo.getEmail(),
				memberVo.getPhone(), memberVo.getBirth_date(), null, memberVo.getName(), memberVo.getId(),
				memberVo.getPassword(), memberVo.getRoles());
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
