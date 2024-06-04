package com.human.cafe.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.human.cafe.vo.*;
import com.human.cafe.util.*;

public class ReboardDao {
	@Autowired
	SqlSessionTemplate session;
	
	/**
	 * 게시글등록 데이터베이스작업 전담 처리함수
	 */
	public int addBoard(ReboardVO rVO) {
		return session.insert("rSQL.addBoard", rVO);
	}
	
	/**
	 * 총 게시글 수 조회 전담 처리함수
	 */
	public int getTotal() {
		return session.selectOne("rSQL.getTotal");
	}
	
	/**
	 * 게시글 리스트 조회 전담 처리함수
	 */
	public List getList(PageUtil page) {
		return session.selectList("rSQL.getList", page);
	}
}