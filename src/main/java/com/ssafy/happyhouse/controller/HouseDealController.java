package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.service.HouseDealService;
import com.ssafy.util.PageNavigation;

@Controller
@RequestMapping("/article")
public class HouseDealController {
	private static final Logger logger = LoggerFactory.getLogger(HouseDealController.class);
	@Autowired
	ServletContext servletContext;
	@Autowired
	private HouseDealService houseDealService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam Map<String, String> map, Model model) throws Exception {
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");// sizePerPage
		try {
			List<HouseDealDto> list = houseDealService.listArticle(map);
			PageNavigation pageNavigation = houseDealService.makePageNavigation(map);
			model.addAttribute("articles", list);
			model.addAttribute("navigation", pageNavigation);
			return "house/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}

}
