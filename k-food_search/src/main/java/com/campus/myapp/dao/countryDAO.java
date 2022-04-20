package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.countryVO;

@Mapper
@Repository
public interface countryDAO {

	//������� ��������
	public List<countryVO> countryList();
	
	//���ø�� ���ΰ�������
	public List<countryVO> stateList(String nation);

	public List<RestaurantVO> restList(String nation, String state);

	public List<RestaurantVO> restListByNation(String nation);
	
	public List<RestaurantVO> restListRestype(String resty);
}
