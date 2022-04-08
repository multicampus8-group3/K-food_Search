package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.MemberDAO;
import com.campus.myapp.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;

	@Override
	public List<MemberVO> memberList(MemberVO vo) {
		return dao.memberList(vo);
	}

	@Override
	public int ownershipChange(MemberVO vo) {
		return dao.ownershipChange(vo);
	}

}
