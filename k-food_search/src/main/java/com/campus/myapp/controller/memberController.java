package com.campus.myapp.controller;

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

import com.campus.myapp.Service.memberService;
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
				String msg = "<script>alert('성공');location.href='/';</script>";
				
				entity=new ResponseEntity<String>(msg,headers,HttpStatus.OK);				
			}else {
				System.out.println("로그인 실패 - 에러 발생 유도함.");
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('로그인 실패');history.back();</script>";
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
		//로그인 페이지로 보내야 함.
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@GetMapping("/idOk")
	@ResponseBody
	public int idOk(String id) {
		return service.memberIdOk(id);
	}
}
