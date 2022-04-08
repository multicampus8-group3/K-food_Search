package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.MemberVO;

public interface MemberService {
	// 관리자페이지에서 회원목록 보기
	public List<MemberVO> memberList(MemberVO vo);
}
