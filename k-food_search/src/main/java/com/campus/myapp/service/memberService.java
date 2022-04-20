package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ReviewVO;
import com.campus.myapp.vo.memReservVO;
import com.campus.myapp.vo.memberVO;

public interface memberService {
	public int memberInsert(memberVO vo);
	public int memberIdOk(String id);
	public memberVO loginOk(memberVO vo);
	public memberVO memberSelect(String userid);
	// 관리자페이지에서 회원목록 보기
	public List<memberVO> memberList(PagingVO vo);
	// 관리자페이지에서 업주신청목록 보기
	public List<memberVO> ownershipList(memberVO vo);
	// 업주신청처리(수정)
	public int ownershipChange(memberVO vo);
	public int memberUpdate(memberVO vo);
	public int memberDelete(memberVO vo);

}
