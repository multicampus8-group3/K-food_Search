package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.mainAdVO;

//김자영- 메인페이지 ad_banner
@Mapper
@Repository
public interface mainAdDAO {
	public List<mainAdVO> mainAdSelect();
}
