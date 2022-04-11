package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.RestaurantVO;

public interface RestaurantService {
	// 관리자페이지에서 가게목록 보기
	public List<RestaurantVO> restaurantList(RestaurantVO vo);
	public int restaurantInsert(RestaurantVO vo);
}
