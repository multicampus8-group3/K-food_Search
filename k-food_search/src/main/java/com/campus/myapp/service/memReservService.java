package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.memReservVO;



public interface memReservService {
	//마이페이지-멤버예약관련Service-작성자: 최원준
	//예약목록 보기	
	public List<memReservVO> memReservList(memReservVO vo);
	//예약취소기능
	public int memReservCancel(memReservVO vo);
	//예약목록에서 삭제기능
	public int memReservDel(memReservVO vo);
	public List<memReservVO> myRestaurantReserveList(String userid);
	public int reserveCheckOk(int no, String status);
	public int reserveCheckDel(int no);
	public int memRservInsert(memReservVO vo);
}
