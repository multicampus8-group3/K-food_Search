package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.memberVO;

@Mapper
@Repository
public interface memberDAO {
	public int memberInsert(memberVO vo);
	public int memberIdOk(String id);
	public memberVO loginOk(memberVO vo);
	public memberVO memberSelect(String userid);
	// 관리자페이지에서 회원목록 보기
	public List<memberVO> memberList(memberVO vo);
	// 업주신청처리(수정)
	public int ownershipChange(memberVO vo);
}