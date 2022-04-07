package com.campus.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.MemberService;
import com.campus.myapp.vo.MemberVO;

@RestController
public class MemberController {
	@Inject
	MemberService service;
	
	//로그인
	@PostMapping("/member/loginOk")
	public ResponseEntity<String> loginOk(MemberVO vo, HttpSession session){
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("content-Type","text/html; charset=utf-8");
		try {
			MemberVO rVo = service.login(vo);
			if(rVo!=null) {//로그인성공
				session.setAttribute("logId", rVo.getUserid());
				session.setAttribute("logName", rVo.getUsername());
				session.setAttribute("logType", rVo.getUsertype());
				session.setAttribute("logStatus", "Y");
				
				String msg = "<script>alert('로그인 성공!!!!');location.href='/';</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			}else {
				throw new Exception();
			}
		} catch (Exception e) {
			e.printStackTrace();
			//로그인실패
			String msg = "<script>alert('로그인 실패!!!!!');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}
	//로그아웃
	@GetMapping("/member/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//마이페이지로 이동.
	@GetMapping(value = {"/member/mypage", "member/memberEdit"})
	public ModelAndView mypage(HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		MemberVO vo =service.memberSelect(userid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		mav.setViewName("member/memberEdit");
		return mav;
	}
	
	//회원정보수정(2)으로 이동.
		@PostMapping("/member/memberEdit2")
		public ModelAndView memberEdit2(HttpSession session) {
			String userid = (String)session.getAttribute("logId");
			MemberVO vo =service.memberSelect(userid);
			ModelAndView mav = new ModelAndView();
			mav.addObject("vo",vo);
			mav.setViewName("member/memberEdit2");
			return mav;
		}

	//회원예약목록으로 이동.
	@GetMapping("/member/memberBook")
	public ModelAndView memberBook() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberBook");
		return mav;
	}
	//회원리뷰목록으로 이동.
	@GetMapping("/member/memberReview")
	public ModelAndView memberReview() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberReview");
		return mav;
	}
	//회원즐겨찾기목록으로 이동.
	@GetMapping("/member/memberFavor")
	public ModelAndView memberFavor() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberFavor");
		return mav;
	}

	
	//업체정보로 이동.
	@GetMapping("/member/myrestaurant")
	public ModelAndView myrestaurant() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/myrestaurant");
		return mav;
	}
}
