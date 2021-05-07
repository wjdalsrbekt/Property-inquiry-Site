package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.SearchDto;

public interface UserMapper {
	public MemberDto login(Map<String, String> map) throws SQLException;
	
	
	
	//REST
	
	public List<MemberDto> userList(SearchDto searchDto);
	public MemberDto userInfo(String userid);
	public int userRegister(MemberDto memberDto);
	public int userModify(MemberDto memberDto);
	public int userDelete(String userid);
	
	
}
