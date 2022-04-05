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
	
	//로그인폼으로 이동.
	@GetMapping("/member/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/loginForm");
		return mav;
	}
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
				session.setAttribute("", headers);
				session.setAttribute("logStatus", "Y");
				
				String msg = "<script>location.href='/';</script>";
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
	
	//회원정보 수정폼으로 이동.
		@GetMapping("/member/mypage")
		public ModelAndView mypage() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("member/mypage");
			return mav;
		}
}
