package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.RestaurantDAO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ResPagingVO;
import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.memberVO;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	@Inject
	RestaurantDAO dao;
	@Override
	public int restaurantInsert(RestaurantVO vo) {
		return dao.restaurantInsert(vo);
	}

	@Override
	public List<RestaurantVO> restaurantMyList(String userid) {
		return dao.restaurantMyList(userid);
	}

	@Override
	public int restaurantDel(int resno) {
		return dao.restaurantDel(resno);
	}

	@Override
	public RestaurantVO restaurantUpdateList(int resno) {
		return dao.restaurantUpdateList(resno);
	}

	@Override
	public int maxResno() {
		return dao.maxResno();
	}

	@Override
	public String restarantImgDel(int resno) {
		return dao.restarantImgDel(resno);
	}

	@Override
	public int restaurantUpdateOk(RestaurantVO vo) {
		return dao.restaurantUpdateOk(vo);
	}
	

	@Override
	public RestaurantVO resSelect(int resno) {
		return dao.resSelect(resno);
	}

	@Override
	public List<RestaurantVO> restaurantList(PagingVO vo) {
		return dao.restaurantList(vo);
	}

	@Override
	public int totalRecord(ResPagingVO pVO) {
		return dao.totalRecord(pVO);
	}

	@Override
	public List<RestaurantVO> resList(ResPagingVO pVO) {
		return dao.resList(pVO);
	}
}
