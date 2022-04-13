package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.memberVO;

public interface memberService {
	public int memberInsert(memberVO vo);
	public int memberIdOk(String id);
	public memberVO loginOk(memberVO vo);
	public memberVO memberSelect(String userid);
	// 관리자페이지에서 회원목록 보기
	public List<memberVO> memberList(memberVO vo);
	// 관리자페이지에서 회원검색
	public List<memberVO> getSearchList(memberVO vo);
	// 업주신청처리(수정)
	public int ownershipChange(memberVO vo);
}
