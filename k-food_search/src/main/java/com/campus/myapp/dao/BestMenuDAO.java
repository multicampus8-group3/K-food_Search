package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.BestMenuVO;

// 김자영- 메인페이지 top_Res
@Mapper
@Repository
public interface BestMenuDAO {
	public List<BestMenuVO> bmSelect();
}
