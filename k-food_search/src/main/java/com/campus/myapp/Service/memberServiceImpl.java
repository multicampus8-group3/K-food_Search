package com.campus.myapp.Service;

import javax.inject.Inject;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.campus.myapp.DAO.memberDAO;
import com.campus.myapp.vo.memberVO;

@Service
@Primary
public class memberServiceImpl implements memberService {
	@Inject
	memberDAO dao;
	@Override
	public int memberInsert(memberVO vo) {
		// TODO Auto-generated method stub
		return dao.memberInsert(vo);
	}
	@Override
	public int memberIdOk(String id) {
		// TODO Auto-generated method stub
		return dao.memberIdOk(id);
	}
	@Override
	public memberVO loginOk(memberVO vo) {
		// TODO Auto-generated method stub
		return dao.loginOk(vo);
	}
}
