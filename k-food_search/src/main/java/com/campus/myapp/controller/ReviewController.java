package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.ReviewService;
import com.campus.myapp.vo.ReviewVO;

@RestController
@RequestMapping("/review/*")
public class ReviewController {
	@Inject
	ReviewService service;
	
	// 관리자페이지에서 리뷰목록 보기
	@GetMapping("revListToAdmin")
	public List<ReviewVO> list(ReviewVO vo)	{
		return service.reviewList(vo);
	}
	// 마이페이지에서 리뷰목록 보기
	@GetMapping("memberReviewList")
	public List<ReviewVO> memberReviewList(ReviewVO vo, HttpSession session )	{
		vo.setUserid((String)session.getAttribute("logId"));
		List<ReviewVO> list = service.memberReviewList(vo);
		return service.memberReviewList(vo);
	}
	
}
