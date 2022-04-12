package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
