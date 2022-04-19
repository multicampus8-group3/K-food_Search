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

	@Override
	public int memFavorDelete(memFavorVO vo) {
		return dao.memFavorDelete(vo);
	}

	@Override
	public String memFavorSelect(String userid, int resno) {
		return dao.memFavorSelect(userid, resno);
	}

	@Override
	public int memFavorInsert(memFavorVO vo) {
		return dao.memFavorInsert(vo);
	}


	
}
