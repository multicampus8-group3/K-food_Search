package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.RestaurantVO;

@Mapper
@Repository
public interface RestaurantDAO {
	// 관리자페이지에서 가게목록 보기
	public List<RestaurantVO> restaurantList(RestaurantVO vo);
	// 관리자페이지에서 가게검색
	public List<RestaurantVO> getSearchList(RestaurantVO vo);
		
	public int restaurantInsert(RestaurantVO vo);
	public List<RestaurantVO> restaurantMyList(String userid);
	public int restaurantDel (int resno);
	public RestaurantVO restaurantUpdateList(int resno);
}
