package com.campus.myapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.PagingVO;

@Mapper
@Repository
public interface adminPageNationDAO {
	public int memberTotalRecord(PagingVO vo);
	public int restaurantTotalRecord(PagingVO vo);
	public int reviewTotalRecord(PagingVO vo);
	public int adTotalRecord(PagingVO vo);
}
