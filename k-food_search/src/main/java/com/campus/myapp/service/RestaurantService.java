package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.memberVO;

public interface RestaurantService {
	// 관리자페이지에서 가게목록 보기
	public List<RestaurantVO> restaurantList(RestaurantVO vo);
	// 관리자페이지에서 가게검색
	public List<RestaurantVO> getSearchList(RestaurantVO vo);
		
	public int restaurantInsert(RestaurantVO vo);
	public List<RestaurantVO> restaurantMyList(String userid);
	public int restaurantDel (int resno);
	public RestaurantVO restaurantUpdateList(int resno);
	public int maxResno ();
	public String restarantImgDel(int resno);
	public int restaurantUpdateOk(RestaurantVO vo);
	
	//지도 클릭시 관리자페이지에서 해당 나라의 가게목록만 보이게 하기.
	public List<RestaurantVO> restaurantList_world(memberVO mVO);
}
