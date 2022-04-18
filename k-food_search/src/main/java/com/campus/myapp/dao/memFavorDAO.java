package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.memFavorVO;
import com.campus.myapp.vo.memberVO;


@Mapper
@Repository
public interface memFavorDAO {
	//멤버 즐겨찾기 목록보기
	public List<memFavorVO> memFavorList(memFavorVO vo);
	public int memFavorDelete(memFavorVO vo);

}
