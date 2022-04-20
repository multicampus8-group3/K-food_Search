package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ReviewVO;
import com.campus.myapp.vo.memberVO;

@Mapper
@Repository
public interface memberDAO {
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
