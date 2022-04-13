package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.ReviewVO;

@Mapper
@Repository
public interface ReviewDAO {
	// 관리자페이지에서 리뷰목록 보기
	public List<ReviewVO> reviewList(ReviewVO vo);
	// 멤버페이지에서 리뷰목록 보기
	public List<ReviewVO> memberReviewList(ReviewVO vo);
}
