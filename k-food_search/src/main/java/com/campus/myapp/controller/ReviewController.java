package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.dao.adminPageNationDAO;
import com.campus.myapp.service.ReviewService;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ReviewVO;

@RestController
@RequestMapping("/review/*")
public class ReviewController {
	@Inject
	ReviewService service;
	@Inject
	adminPageNationDAO apnService;
	// 관리자페이지에서 리뷰목록 보기
	@GetMapping("/revListToAdmin")
	public List<ReviewVO> list(PagingVO vo)	{
		return service.reviewList(vo);
	}
	@GetMapping("/reviewPageNation")
	@ResponseBody
	public PagingVO restaurantPageNation(PagingVO vo) {
	   vo.setTotalRecord(apnService.reviewTotalRecord(vo));
	   return vo;
	}
	
	// 마이페이지에서 리뷰목록 보기
	@GetMapping("/memberReviewList")
	public List<ReviewVO> memberReviewList(ReviewVO vo, HttpSession session )	{
		vo.setUserid((String)session.getAttribute("logId"));
		List<ReviewVO> list = service.memberReviewList(vo);
		return service.memberReviewList(vo);
	}
	
	// 리뷰등록
	@PostMapping("/reviewOk")
	public int reviewOk(ReviewVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		
		return service.reviewWrite(vo);
	}
	
	// 리뷰목록
	@GetMapping("/resReviewList")
	@ResponseBody
	public List<ReviewVO> list(Integer resno) {
		return service.resReviewList(resno);
	}
	

}
