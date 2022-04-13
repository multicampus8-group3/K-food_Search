package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.campus.myapp.dao.memberDAO;
import com.campus.myapp.vo.ReviewVO;
import com.campus.myapp.vo.memberVO;

@Service
@Primary
public class memberServiceImpl implements memberService {
	@Inject
	memberDAO dao;
	@Override
	public int memberInsert(memberVO vo) {
		return dao.memberInsert(vo);
	}
	@Override
	public int memberIdOk(String id) {
		return dao.memberIdOk(id);
	}
	@Override
	public memberVO loginOk(memberVO vo) {
		return dao.loginOk(vo);
	}
	@Override
	public memberVO memberSelect(String userid) {
		return dao.memberSelect(userid);
	}
	
	@Override
	public List<memberVO> memberList(memberVO vo) {
		return dao.memberList(vo);
	}

	@Override
	public int ownershipChange(memberVO vo) {
		return dao.ownershipChange(vo);
	}
	@Override
	public List<memberVO> getSearchList(memberVO vo) {
		return dao.getSearchList(vo);
	}
	@Override
	public int memberUpdate(memberVO vo) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(vo);
	}
	
	
}
