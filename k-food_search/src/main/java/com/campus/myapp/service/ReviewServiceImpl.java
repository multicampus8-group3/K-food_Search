package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.ReviewDAO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Inject
	ReviewDAO dao;

	@Override
	public List<ReviewVO> memberReviewList(ReviewVO vo) {
		return dao.memberReviewList(vo);
	}
	@Override
	public List<ReviewVO> reviewList(PagingVO vo) {
		return dao.reviewList(vo);
	}
	
	@Override
	public int reviewWrite(ReviewVO vo) {
		
		int result = dao.reviewWrite(vo);
		setRating(vo.getResno());
		return result;
	}
	@Override
	public List<ReviewVO> resReviewList(Integer resno) {
		return dao.resReviewList(resno);
	}
	
	// 평점평균
	@Override
	public void setRating(Integer resno) {
		Double resgrade = dao.getRatingAverage(resno);
		
		if(resgrade == null) {
			resgrade = 0.0;
		}
		
		resgrade = (double) (Math.round(resgrade*10));
		resgrade = resgrade / 10;
		
		RestaurantVO rvo = new RestaurantVO();
		rvo.setResno(resno);
		rvo.setResgrade(resgrade);
		System.out.println(rvo.getResgrade());
		dao.updateRating(rvo);
	}
	
	
}
