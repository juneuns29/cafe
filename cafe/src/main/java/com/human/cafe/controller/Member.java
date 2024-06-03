package com.human.cafe.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.human.cafe.dao.MemberDao;
import com.human.cafe.vo.MemberVO;

/**
 * 회원 관련 요청 처리 컨트롤러 클래스
 * @author	전은석\
 * @since	2024.06.03
 * @version v.1.0
 * 			
 * 			작업이력 ]
 * 				2024.06.03 - 담당자 : 전은석
 * 							로그인 폼보기 요청 처리
 * 
 *
 */

@Controller
@RequestMapping("/member")
public class Member {
	@Autowired
	MemberDao mDao;
	
	@RequestMapping("/login.cafe")
	public ModelAndView login(HttpSession session, ModelAndView mv, RedirectView rv) {
		mv.setViewName("member/login");
		return mv;
	}
	
	/**
	 * 로그인 처리 요청
	 */
	@RequestMapping("/loginProc.cafe")
	public ModelAndView loginProc(HttpSession session, ModelAndView mv, RedirectView rv, MemberVO mVO) {
		int cnt = mDao.getLogin(mVO);
		if(cnt == 1) {
			session.setAttribute("SID", mVO.getId());
			rv.setUrl("/cafe/main.cafe");
		} else {
			rv.setUrl("/cafe/member/login.cafe");
		}
		mv.setView(rv);
		return mv;
	}
	
	/**
	 * 로그아웃 처리 요청
	 */
	@RequestMapping("/logout.cafe")
	public ModelAndView logout(HttpSession session, ModelAndView mv, RedirectView rv) {
		session.removeAttribute("SID");
		rv.setUrl("/cafe/main.cafe");
		mv.setView(rv);
		return mv;
	}
	
	/**
	 * 회원가입 폼보기 요청
	 * 
	 */
	@RequestMapping("/join.cafe")
	public ModelAndView join(HttpSession session, ModelAndView mv, RedirectView rv) {
		mv.setViewName("member/join");
		return mv;
	}
	
	/**
	 * 아이디 중복검사 요청
	 */
	@RequestMapping("/idCheck.cafe")
	@ResponseBody
	 public HashMap<String, String> idCheck(String id){
		HashMap<String, String> map = new HashMap<String, String>();
		int cnt = mDao.idCheck(id);
		if(cnt == 0) {
			map.put("result", "OK");
		} else {
			map.put("result", "NO");
		}
		return map;
	 }
}
