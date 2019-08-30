package com.hanwha.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.hanwha.example.dto.BoardVO;

//@Component
@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 01. 게시글 작성
	public void insert(BoardVO vo) {
		sqlSession.insert("board.insert",vo);
	}

	// 02. 게시글 상세보기
	public int selectOne(int code) {
		return sqlSession.selectOne("board.view",code);
	}

	// 03. 게시글 수정
	public void update(BoardVO vo){
		sqlSession.update("board.updateArticle", vo);
	} 
	
	// 04. 게시글 삭제
	public void delete(int key) {
		sqlSession.delete("board.deleteArticle",key);
	}
	
	// 05. 게시글 전체 목록
	public List<BoardVO> selectAll() {
		return sqlSession.selectList("board.listAll");
	}

	// 06. 게시글 카운트 증가
	public void increaseViewcnt(int bno) {
		sqlSession.update("increaseViewcnt",bno);
	}
	
	// 07. 상세보기
	public BoardVO view(BoardVO vo){
		vo = sqlSession.selectOne("board.view",vo.getBno());
		return vo;
	}
}
