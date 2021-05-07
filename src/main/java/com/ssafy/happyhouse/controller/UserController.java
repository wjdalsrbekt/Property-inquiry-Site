package com.ssafy.happyhouse.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.cj.jdbc.SuspendableXAConnection;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session,
			HttpServletResponse response) {
		try {
			MemberDto memberDto = userService.login(map);
			if (memberDto != null) {
				session.setAttribute("userinfo", memberDto);

				Cookie cookie = new Cookie("ssafy_id", memberDto.getUserid());
				cookie.setPath("/");
				if ("saveok".equals(map.get("idsave"))) {
					cookie.setMaxAge(60 * 60 * 24 * 365); // 1년
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 과정 중 문제가 발생하였습니다.");
			return "error/error";
		}
		return "index";

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "user/list";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "user/join";
	}

	@RequestMapping(value = "/memberjoin", method = RequestMethod.POST)
	public String userRegister(@RequestParam Map<String, String> map, Model model) {

		MemberDto memberDto = new MemberDto();
		memberDto.setUsername(map.get("username"));
		memberDto.setUserid(map.get("userid"));
		memberDto.setUserpwd(map.get("userpwd"));

		String email = map.get("emailid") + "@" + map.get("emaildomain");

		memberDto.setEmail(email);

		userService.userRegister(memberDto);

		model.addAttribute("msg", "등록되었습니다.");

		return "index";

	}

	@RequestMapping(value = "/delete/{userid}",method=RequestMethod.GET)
	public String deleteMember(@PathVariable("userid") String userid) {
		userService.userDelete(userid);
		return "user/list";
	}
	
	@RequestMapping(value="/modify/{userid}",method=RequestMethod.GET)
	public String modifyMember(@PathVariable("userid") String userid,Model model) {
		MemberDto memberDto = userService.userInfo(userid);
		model.addAttribute("modify", memberDto);
		return "user/modify";
	}
	
	@RequestMapping(value="/membermodify",method=RequestMethod.POST)
	public String modifyInfo(@RequestParam Map<String, String> map, Model model)
	{
		
		MemberDto memberDto = new MemberDto();
		memberDto.setUsername(map.get("username"));
		memberDto.setUserid(map.get("userid"));
		memberDto.setUserpwd(map.get("userpwd"));

		String email = map.get("emailid") + "@" + map.get("emaildomain");

		memberDto.setEmail(email);

		userService.userModify(memberDto);

		model.addAttribute("msg", "수정되었습니다.");

		return "user/list";
	}
	
}