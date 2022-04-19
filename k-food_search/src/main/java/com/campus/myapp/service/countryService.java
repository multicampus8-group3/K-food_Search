package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.countryVO;

public interface countryService {
	//국가목록 가져오기
	public List<countryVO> countryList();
	//도시목록 전부가져오기
	public List<countryVO> stateList(String nation);
	public List<RestaurantVO> restList(String nation, String state);
	public List<RestaurantVO> restListByNation(String nation);
}
