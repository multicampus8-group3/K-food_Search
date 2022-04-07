package com.campus.myapp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.MemberDAO;
import com.campus.myapp.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}

	//회원정보
	@Override
	public MemberVO memberSelect(String userid) {
		// TODO Auto-generated method stub
		return dao.memberSelect(userid);
	}

	//회원수정
	@Override
	public int memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(vo);
	}

}
