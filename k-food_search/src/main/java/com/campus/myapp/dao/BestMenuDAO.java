package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.BestMenuVO;

@Mapper
@Repository
public interface BestMenuDAO {
	public List<BestMenuVO> bmSelect();
}
