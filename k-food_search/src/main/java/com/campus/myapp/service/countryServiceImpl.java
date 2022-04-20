package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.countryDAO;
import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.countryVO;


@Service
public class countryServiceImpl implements countryService {
	@Inject
	countryDAO dao;

	@Override
	public List<countryVO> countryList() {
		return dao.countryList();
	}

	@Override
	public List<countryVO> stateList(String nation) {
		return dao.stateList(nation);
	}

	@Override
	public List<RestaurantVO> restList(String nation, String state) {
		return dao.restList(nation,state);
	}

	@Override
	public List<RestaurantVO> restListByNation(String nation) {
		return dao.restListByNation(nation);
	}

	@Override
	public List<RestaurantVO> restListRestype(String resty) {
		return dao.restListRestype(resty);
	}

	@Override
	public List<RestaurantVO> restListAll() {
		return dao.restListAll();
	}
	
}