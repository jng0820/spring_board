package com.hanwha.example.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.hanwha.example.dao.BoardDao;
import com.hanwha.example.dto.BoardVO;

public interface BoardService {
	
	// 01. 게시글 작성
	public void writeArticle(BoardVO boardvo);
	// 02. 게시글 상세보기
	public BoardVO View(int bno); 
	// 03. 게시글 수정
	public void updateDao(BoardVO vo);
	// 04. 게시글 삭제
	public void deleteService(int m); 
	// 05. 게시글 전체 목록
	public List<BoardVO> listAll() throws Exception;
	// 06. 게시글 조회수
	public void increaseViewcnt(int a, HttpSession b) throws Exception; 
}
