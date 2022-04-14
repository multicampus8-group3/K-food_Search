package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.countryDAO;
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
	

}
