package com.hanwha.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hanwha.example.dto.BoardVO;
import com.hanwha.example.service.BoardService;

@RestController
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	BoardService boardService;

	// 01. 게시글 목록
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception {
		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		// mav.setViewName("board/list");
		mav.addObject("list", boardService.listAll());
		mav.setViewName("board/list");
		return mav;
	}

	// 02_02. 게시글 작성처리
	@PostMapping(value = "insert.do")
	public String insert(@RequestBody BoardVO boardVo) throws Exception {
		System.out.println(boardVo);
		boardService.writeArticle(boardVo);
		return "redirect:list.do";
	}

	// 04. 게시글 수정
	@RequestMapping(value="view.do", method = RequestMethod.PUT)
	public String update(@ModelAttribute BoardVO vo) throws Exception {
		boardService.updateDao(vo);
		return "redirect:view.do?bno="+vo.getBno();
	} 

	// 05. 게시글 삭제
	@RequestMapping(value ="delete.do", method = RequestMethod.DELETE)
	public String delete(@RequestParam("bno") int bno) throws Exception {
		boardService.deleteService(bno);
		return "redirect:list.do";
	}

}
