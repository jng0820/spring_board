package com.hanwha.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hanwha.example.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	BoardService boardService;

	// 01. 게시글 목록
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception {
		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list");
		return mav;
	}

	// 02_01. 게시글 작성화면
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String write() {
		return "";
	}

	// 02_02. 게시글 작성처리
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public String insert() throws Exception {
		return "";
	}

	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
	@RequestMapping(value = "view.do", method = RequestMethod.GET)
	public ModelAndView view() throws Exception {
		// 조회수 증가 처리
		// boardService.increaseViewcnt(?, session);
		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	// 04. 게시글 수정
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String update() throws Exception {
		// return "redirect:list.do";
		return "";
	}

	// 05. 게시글 삭제
	@RequestMapping("delete.do")
	public String delete() throws Exception {
		return "redirect:list.do";
	}

}
