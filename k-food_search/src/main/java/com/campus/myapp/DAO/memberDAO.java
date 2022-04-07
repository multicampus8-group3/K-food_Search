package com.campus.myapp.DAO;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.memberVO;
@Mapper
@Repository
public interface memberDAO {
	public int memberInsert(memberVO vo);
	public int memberIdOk(String id);
	public memberVO loginOk(memberVO vo);
}
