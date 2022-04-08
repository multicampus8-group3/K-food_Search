package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.memberService;
import com.campus.myapp.vo.memberVO;

@Controller
public class memberController {
	@Inject
	memberService service;
	
   @GetMapping("/logout")
   public ModelAndView logout(HttpSession session) {
      session.invalidate();
      ModelAndView mav = new ModelAndView();
      mav.setViewName("redirect:/");
      return mav;
   }
	   	
   // 관리자페이지에서 회원목록 보기
	@GetMapping("/listtoadmin")
	@ResponseBody
	public List<memberVO> list(memberVO vo) {
		return service.memberList(vo);
	}
	
	// 업주신청처리(수정)
	@PostMapping("/ownershipChangeOk")
	@ResponseBody
	public int ownershipChangeOk(memberVO vo) {
		return service.ownershipChange(vo);
	}
	
	@PostMapping("/loginOk")
	public ResponseEntity<String> loginOk(memberVO vo, HttpSession session){
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		memberVO rvo = service.loginOk(vo);
		try {
			if(rvo!=null) {
				session.setAttribute("logId", rvo.getUserid());
				session.setAttribute("username", rvo.getUsername());
				session.setAttribute("logStatus", "Y");
				session.setAttribute("logType", rvo.getUsertype());
				String msg = "<script>alert('로그인성공');location.href='/';</script>";
				
				entity=new ResponseEntity<String>(msg,headers,HttpStatus.OK);				
			}else {
				System.out.println("로그인실패!!-에러발생유도");
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('로그인실패!!');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/signUp")
	public String signUp() {
		return "/memberSignUp/signUp";
	}
	
	@PostMapping("/sighUpOk")
	public ModelAndView sighUpOk(memberVO vo) {
		ModelAndView mav = new ModelAndView();
		//System.out.println(vo.getTel());
		service.memberInsert(vo);
		//
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@GetMapping("/idOk")
	@ResponseBody
	public int idOk(String id) {
		return service.memberIdOk(id);
	}
	
	
	@GetMapping(value = {"/member/mypage", "member/memberEdit"}) 
	public ModelAndView mypage(HttpSession session) { 
		String userid = (String)session.getAttribute("logId"); 
		memberVO vo =service.memberSelect(userid); 
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		mav.setViewName("member/memberEdit"); 
		return mav; }
	 
	@PostMapping("/member/memberEdit2")
	public ModelAndView memberEdit2(HttpSession session) {
		String userid = (String)session.getAttribute("logId"); 
		memberVO vo =service.memberSelect(userid); 
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		mav.setViewName("member/memberEdit2");
		return mav;
	}
	@GetMapping("/member/memberBook")
	public ModelAndView memberBook() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberBook");
		return mav;
	}

	@GetMapping("/member/memberReview")
	public ModelAndView memberReview() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberReview");
		return mav;
	}

	@GetMapping("/member/memberFavor")
	public ModelAndView memberFavor() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberFavor");
		return mav;
	}
}
