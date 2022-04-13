package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.RestaurantDAO;
import com.campus.myapp.vo.RestaurantVO;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	@Inject
	RestaurantDAO dao;
	
	@Override
	public List<RestaurantVO> restaurantList(RestaurantVO vo) {
		return dao.restaurantList(vo);
	}

	@Override
	public int restaurantInsert(RestaurantVO vo) {
		// TODO Auto-generated method stub
		return dao.restaurantInsert(vo);
	}

	@Override
	public List<RestaurantVO> restaurantMyList(String userid) {
		// TODO Auto-generated method stub
		return dao.restaurantMyList(userid);
	}

	@Override
	public int restaurantDel(int resno) {
		// TODO Auto-generated method stub
		return dao.restaurantDel(resno);
	}

	@Override
	public RestaurantVO restaurantUpdateList(int resno) {
		// TODO Auto-generated method stub
		return dao.restaurantUpdateList(resno);
	}
}
