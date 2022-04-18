package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.mainAdDAO;
import com.campus.myapp.vo.mainAdVO;

//김자영- 메인페이지 ad_banner
@Service
public class mainAdServiceImpl implements mainAdService{
	@Inject
	mainAdDAO dao;
	public List<mainAdVO> mainAdSelect(){
		return dao.mainAdSelect();
	}
}
