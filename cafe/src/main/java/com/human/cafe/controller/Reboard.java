package com.human.cafe.controller;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.human.cafe.dao.ReboardDao;
import com.human.cafe.util.PageUtil;
import com.human.cafe.vo.*;

/**
 * 이 클래스는 댓글 게시판 관련 요청을 처리해주는 컨트롤러 클래스
 * @author	전은석
 * @since	2024.06.03
 * @version v.1.0
 * 
 * 			작업이력 ]
 * 				2024.06.03 - 담당자 : 전은석
 * 								리스트 폼보기 요청
 * 								글쓰기 폼보기 요청
 * 				2024.06.04 - 담당자 : 전은석
 * 								리스트 폼보기 요청 페이지 객체 추가 수정
 * 								글등록 요청 
 *
 */

@Controller
@RequestMapping("/reboard")
public class Reboard {
	@Autowired
	ReboardDao rDao;
	
	@RequestMapping("/reboard.cafe")
	public ModelAndView reboardList(HttpSession session, ModelAndView mv, 
											RedirectView rv, PageUtil page) {
		int total = rDao.getTotal();
		page.setTotalCount(total);
		page.setPage();
		
		List list = rDao.getList(page);
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		mv.setViewName("reboard/reboard");
		return mv;
	}
	
	/**
	 * 게시글 작성 폼보기 요청
	 */
	@RequestMapping("/reboardWrite.cafe")
	public ModelAndView reboardWrite(HttpSession session, ModelAndView mv, 
											RedirectView rv, ReboardVO rVO) {
		
		mv.addObject("DATA", rVO);
		mv.setViewName("reboard/reboardWrite");
		return mv;
	}
	
	/**
	 * 댓글 쓰기 폼보기 요청 처리함수
	 */
	@RequestMapping("/reboardRewrite.cafe")
	public ModelAndView reboardRewrite(HttpSession session, ModelAndView mv, 
			RedirectView rv, ReboardVO rVO) {
		rVO = rDao.getUpContent(rVO.getBno());
		mv.addObject("DATA", rVO);
		mv.setViewName("reboard/reboardWrite");
		return mv;
	}
	
	/**
	 * 게시글 등록 요청 처리 함수
	 */
	@RequestMapping("/reboardWriteProc.cafe")
	public ModelAndView reboardWriteProc(HttpSession session, ModelAndView mv, RedirectView rv, ReboardVO rVO) {
		// 작업 순서
		// 0. 세션검사는 인터셉터에서 처리
		// 1. 데이터 입력하고 결과 받고
		int cnt = rDao.addBoard(rVO);
		// 2. 결과 처리
		String path = "";
		if(cnt == 1) {
			// 성공한 경우
			path = "/cafe/reboard/reboard.cafe";
		} else {
			// 실패한 경우
			path = "/cafe/reboard/reboardWrite.cafe";
		}
		// 데이터 전달 하고
		mv.addObject("DATA", rVO);
		mv.addObject("PATH", path);
		mv.setViewName("redirect");
		return mv;
	}
	
	/**
	 * 게시글 삭제 요청 처리 함수
	 */
	@RequestMapping("/delReboard.cafe")
	public ModelAndView delReboard(HttpSession session, ModelAndView mv, 
											RedirectView rv, ReboardVO rVO) {
		int cnt = rDao.delReboard(rVO);
		String path = "/cafe/reboard/reboard.cafe";
		
		mv.addObject("PATH", path);
		mv.addObject("nowPage", rVO.getNowPage());
		mv.setViewName("redirect");
		return mv;
	}
}
