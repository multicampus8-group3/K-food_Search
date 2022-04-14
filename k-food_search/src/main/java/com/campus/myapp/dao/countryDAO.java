package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.countryVO;

@Mapper
@Repository
public interface countryDAO {

	//국가목록 가져오기
	public List<countryVO> countryList();
	
	//도시목록 전부가져오기
	public List<countryVO> stateList(String nation);
	
}
