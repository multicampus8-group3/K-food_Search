package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.memFavorVO;


public interface memFavorService {
	//멤버 즐겨찾기 목록보기
	public List<memFavorVO> memFavorList(memFavorVO vo);
	public int memFavorDelete(memFavorVO vo);
	public String memFavorSelect(String userid, int resno);
	public int memFavorInsert(memFavorVO vo);

}
