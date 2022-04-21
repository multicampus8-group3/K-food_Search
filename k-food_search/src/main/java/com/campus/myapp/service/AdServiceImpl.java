package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.AdDAO;
import com.campus.myapp.vo.AdVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.RestaurantVO;

@Service
public class AdServiceImpl implements AdService {
	@Inject
	AdDAO dao;

	@Override
	public int adStatusChange(AdVO vo) {
		return dao.adStatusChange(vo);
	}

	@Override
	public int restaurantAdInsert(AdVO vo) {
		// TODO Auto-generated method stub
		return dao.restaurantAdInsert(vo);
	}

	@Override
	public List<AdVO> restaurantAdListView(String userid) {
		// TODO Auto-generated method stub
		return dao.restaurantAdListView(userid);
	}

	@Override
	public List<AdVO> adList(PagingVO vo) {
		// TODO Auto-generated method stub
		return dao.adList(vo);
	}

	@Override
	public List<RestaurantVO> resnoList(String userid) {
		// TODO Auto-generated method stub
		return dao.resnoList(userid);
	}

}
