package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.memReservService;
import com.campus.myapp.vo.memReservVO;


@RestController
@RequestMapping("/memReserv/*")
public class memReservController {
	//마이페이지-멤버예약관련controller-작성자: 최원준
	@Inject
	memReservService service;
	
	// 마이페이지에서 리뷰목록 보기
	@GetMapping("memReservList")
	public List<memReservVO> memReservList(memReservVO vo, HttpSession session )	{
		vo.setUserid((String)session.getAttribute("logId"));
		List<memReservVO> list = service.memReservList(vo);
		
		return service.memReservList(vo);
	}
	@GetMapping("/restaurantReserveCheck")
	public ModelAndView restaurantReserveCheck() {
		ModelAndView mav = new ModelAndView ();
		mav.setViewName("/myrestaurant/restaurantReserveCheck");
		return mav;
	}
	@GetMapping("/restaurantReserveCheckList")
	public List<memReservVO> restaurantReserveCheckList(HttpSession session) {
		return service.myRestaurantReserveList((String)session.getAttribute("logId"));
	}
	//예약 승인 및 거절
	@GetMapping("/reserveCheckOk")
	public int reserveCheckOk(int no, String status) {
		return service.reserveCheckOk(no, status);
	}
	//손님 거절 예약 삭제
	@GetMapping("/reserveCheckDel")
	public int reserveCheckDel(int no) {
		return service.reserveCheckDel(no);
	}
	@PostMapping("memReservCancel")
	public int memReservCancel(memReservVO vo){
		System.out.println(vo.getNo());
		return service.memReservCancel(vo);
	}
}