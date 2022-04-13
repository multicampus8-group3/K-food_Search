package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.campus.myapp.dao.memFavorDAO;
import com.campus.myapp.vo.memFavorVO;



@Service
@Primary
public class memFavorServiceImpl implements memFavorService {
	@Inject
	memFavorDAO dao;

	@Override
	public List<memFavorVO> memFavorList(memFavorVO vo) {
		return dao.memFavorList(vo);
	}
	
	
}
