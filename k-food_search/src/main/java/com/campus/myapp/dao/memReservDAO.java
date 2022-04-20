package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.memReservVO;


@Mapper
@Repository
public interface memReservDAO {
	//마이페이지-멤버예약관련DAO-작성자: 최원준
	//예약목록 보기	
	public List<memReservVO> memReservList(memReservVO vo);
	//예약취소기능
	public int memReservCancel(memReservVO vo);
	//예약목록에서 삭제기능
	public int memReservDel(memReservVO vo);
	//내 예약자 명단 불러오기
	public List<memReservVO> myRestaurantReserveList(String userid);
	//예약 승인 밒 거절
	public int reserveCheckOk(int no, String status);
	//예약 삭제 - 손님이 거절한 예약
	public int reserveCheckDel(int no);
	//예약 등록
	public int memRservInsert(memReservVO vo);
}
