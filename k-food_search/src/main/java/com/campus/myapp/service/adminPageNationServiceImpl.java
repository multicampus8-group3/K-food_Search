package com.campus.myapp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.adminPageNationDAO;
import com.campus.myapp.vo.PagingVO;

@Service
public class adminPageNationServiceImpl implements adminPageNationService {
	@Inject
	adminPageNationDAO dao;

	@Override
	public int memberTotalRecord(PagingVO vo) {
		// TODO Auto-generated method stub
		return dao.memberTotalRecord(vo);
	}

	@Override
	public int restaurantTotalRecord(PagingVO vo) {
		// TODO Auto-generated method stub
		return dao.restaurantTotalRecord(vo);
	}

	@Override
	public int reviewTotalRecord(PagingVO vo) {
		// TODO Auto-generated method stub
		return dao.reviewTotalRecord(vo);
	}

	@Override
	public int adTotalRecord(PagingVO vo) {
		// TODO Auto-generated method stub
		return dao.adTotalRecord(vo);
	}
}
