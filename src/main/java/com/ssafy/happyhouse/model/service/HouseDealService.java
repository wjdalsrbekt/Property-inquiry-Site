package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.util.PageNavigation;

public interface HouseDealService {

	
	public List<HouseDealDto> listArticle(Map<String, String> map) throws Exception;

	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;

	public HouseDealDto getArticle(int no) throws Exception;

}
