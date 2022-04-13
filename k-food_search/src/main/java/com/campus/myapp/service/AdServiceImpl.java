package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.AdDAO;
import com.campus.myapp.vo.AdVO;

@Service
public class AdServiceImpl implements AdService {
	@Inject
	AdDAO dao;
	
	@Override
	public List<AdVO> adList(AdVO vo) {
		return dao.adList(vo);
	}

	@Override
	public int adStatusChange(AdVO vo) {
		return dao.adStatusChange(vo);
	}

}
