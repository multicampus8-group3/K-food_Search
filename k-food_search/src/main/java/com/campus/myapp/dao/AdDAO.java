package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.AdVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.RestaurantVO;

@Mapper
@Repository
public interface AdDAO {

	// 관리자페이지에서 광고신청목록 보기
	public List<AdVO> adList(PagingVO vo);
	// 광고신청처리(수정)
	public int adStatusChange(AdVO vo);
	// 광고 db 입력
	public int restaurantAdInsert(AdVO vo);
	public List<AdVO> restaurantAdListView(String userid);
	public List<RestaurantVO> resnoList(String userid);
}
