package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ReviewVO;

public interface ReviewService {
	// 관리자페이지에서 리뷰목록 보기
	public List<ReviewVO> reviewList(PagingVO vo);
	// 멤버페이지에서 리뷰목록 보기
	public List<ReviewVO> memberReviewList(ReviewVO vo);
	// 리뷰등록
	public int reviewWrite(ReviewVO vo);
	// 리뷰목록
	public List<ReviewVO> resReviewList(Integer resno);
	
	// 평점평균
	public void setRating(Integer resno);
}
