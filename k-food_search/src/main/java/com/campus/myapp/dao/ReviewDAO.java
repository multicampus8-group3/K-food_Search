package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.ReviewVO;

@Mapper
@Repository
public interface ReviewDAO {
	// 관리자페이지에서 리뷰목록 보기
	public List<ReviewVO> reviewList(ReviewVO vo);
	// 관리자페이지에서 리뷰검색
	public List<ReviewVO> getSearchList(ReviewVO vo);
	// 멤버페이지에서 리뷰목록 보기
	public List<ReviewVO> memberReviewList(ReviewVO vo);
	// 리뷰등록
	public int reviewWrite(ReviewVO vo);
	// 리뷰목록
	public List<ReviewVO> resReviewList(Integer resno);
	
	// 평점평균
    public Double getRatingAverage(int resno);
    public int updateRating(RestaurantVO vo);
}
