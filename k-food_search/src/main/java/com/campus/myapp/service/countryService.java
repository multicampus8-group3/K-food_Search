package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.countryVO;

public interface countryService {
	//������� ��������
	public List<countryVO> countryList();
	//���ø�� ���ΰ�������
	public List<countryVO> stateList(String nation);
	public List<RestaurantVO> restList(String nation, String state);
	public List<RestaurantVO> restListByNation(String nation);
	public List<RestaurantVO> restListRestype(String resty);
	public List<RestaurantVO> restListAll();
}