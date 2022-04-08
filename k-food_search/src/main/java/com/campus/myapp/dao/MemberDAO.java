package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.MemberVO;

@Mapper
@Repository
public interface MemberDAO {
	// 관리자페이지에서 회원목록 보기
	public List<MemberVO> memberList(MemberVO vo);
	// 업주신청처리(수정)
	public int ownershipChange(MemberVO vo);
	
}
