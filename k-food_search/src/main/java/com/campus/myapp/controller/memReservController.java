package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
		// System.out.println(vo.getUserid());
		// System.out.println(list.get(0).getStatus());
		return service.memReservList(vo);
	}
	
}
