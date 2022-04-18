package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.ReviewVO;

public interface ReviewService {
	// 관리자페이지에서 리뷰목록 보기
	public List<ReviewVO> reviewList(ReviewVO vo);
	// 관리자페이지에서 리뷰검색
	public List<ReviewVO> getSearchList(ReviewVO vo);
	// 멤버페이지에서 리뷰목록 보기
	public List<ReviewVO> memberReviewList(ReviewVO vo);

}
