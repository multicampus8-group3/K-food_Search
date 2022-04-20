package com.campus.myapp.service;

import com.campus.myapp.vo.PagingVO;

public interface adminPageNationService {
	public int memberTotalRecord(PagingVO vo);
	public int restaurantTotalRecord(PagingVO vo);
	public int reviewTotalRecord(PagingVO vo);
	public int adTotalRecord(PagingVO vo);
}
