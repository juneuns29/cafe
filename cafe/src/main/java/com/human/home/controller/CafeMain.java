package com.human.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 이 클래스는 cafe 프로젝트의 컨트롤러 클래스로
 * 	"/" 요청되는 경우 응답 문서를 선택해서 응답해주는 컨트롤러
 * @author 전은석
 * @since	2024.05.31
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 					2024.05.31	: 	[ 담당자 ] 전은석
 * 									컨트롤러 제작
 * 									/ url 매핑
 *
 */
@Controller
public class CafeMain {
	
	@RequestMapping("/")
	public String getMain() {
		return "main";
	}
}
