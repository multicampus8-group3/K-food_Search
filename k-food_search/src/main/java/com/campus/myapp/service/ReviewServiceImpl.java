package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.ReviewDAO;
import com.campus.myapp.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
	ReviewDAO dao;
	
	@Override
	public List<ReviewVO> reviewList(ReviewVO vo) {
		return dao.reviewList(vo);
	}
	@Override
	public List<ReviewVO> memberReviewList(ReviewVO vo) {
		return dao.memberReviewList(vo);
	}
	@Override
	public List<ReviewVO> getSearchList(ReviewVO vo) {
		return dao.getSearchList(vo);
	}

}
