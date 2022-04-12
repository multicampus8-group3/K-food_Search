package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.BestMenuDAO;
import com.campus.myapp.vo.BestMenuVO;

@Service
public class BestMenuServiceImpl implements BestMenuService{
	@Inject
	BestMenuDAO dao;
	public List<BestMenuVO> bmSelect(){
		return dao.bmSelect();
	}
}
