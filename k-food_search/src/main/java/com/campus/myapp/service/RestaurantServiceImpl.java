package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.RestaurantDAO;
import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.memberVO;

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

	@Override
	public List<RestaurantVO> getSearchList(RestaurantVO vo) {
		return dao.getSearchList(vo);
	}

	@Override
	public int maxResno() {
		// TODO Auto-generated method stub
		return dao.maxResno();
	}

	@Override
	public String restarantImgDel(int resno) {
		// TODO Auto-generated method stub
		return dao.restarantImgDel(resno);
	}

	@Override
	public int restaurantUpdateOk(RestaurantVO vo) {
		// TODO Auto-generated method stub
		return dao.restaurantUpdateOk(vo);
	}
	
	@Override
	public List<RestaurantVO> restaurantList_world(String nation) { //memberVO mVO  (�Ű����� �߰� �ʿ� favornation ���ؼ�)
		// TODO Auto-generated method stub
		return dao.restaurantList_world(nation);
	}

	@Override
	public List<RestaurantVO> resList(RestaurantVO vo) {
		return dao.resList(vo);
	}

	@Override
	public RestaurantVO resSelect(int resno) {
		return dao.resSelect(resno);
	}
}
