package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.countryVO;

public interface countryService {
	//국가목록 가져오기
	public List<countryVO> countryList();
	//도시목록 전부가져오기
	public List<countryVO> stateList(String nation);
}
