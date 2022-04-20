package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.AdVO;
import com.campus.myapp.vo.PagingVO;

public interface AdService {
	// 관리자페이지에서 광고신청목록 보기
	public List<AdVO> adList(PagingVO vo);
	// 광고신청처리(수정)
	public int adStatusChange(AdVO vo);
	public int restaurantAdInsert(AdVO vo);
	public List<AdVO> restaurantAdListView(String userid);
}
