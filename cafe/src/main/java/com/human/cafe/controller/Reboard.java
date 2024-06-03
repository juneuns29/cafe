package com.human.cafe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/reboard")
public class Reboard {
	
	@RequestMapping("/reboard.cafe")
	public ModelAndView reboardList(HttpSession session, ModelAndView mv, RedirectView rv) {
		mv.setViewName("reboard/reboard");
		return mv;
	}
}
