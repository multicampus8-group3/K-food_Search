package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.campus.myapp.service.ReviewService;
import com.campus.myapp.vo.ReviewVO;

@RestController
@RequestMapping("/review/*")
public class ReviewController {
	@Inject
	ReviewService service;
	
	// 관리자페이지에서 리뷰목록 보기
	@GetMapping("/revListToAdmin")
	public List<ReviewVO> list(ReviewVO vo)	{
		return service.reviewList(vo);
	}
	// 관리자페이지에서 리뷰검색
		@GetMapping("/revSearchToAdmin")
		@ResponseBody
		public List<ReviewVO> getSearchList(@RequestParam("searchKey") String searchKey, 
					@RequestParam("searchWord") String searchWord, ReviewVO vo) {
			vo.setSearchKey(searchKey);
			vo.setSearchWord(searchWord);
			return service.getSearchList(vo);
		}
}
