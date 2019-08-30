package com.hanwha.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanwha.example.dto.BoardVO;
import com.hanwha.example.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	BoardService boardService;

//	@RequestMapping("../../")
//	public String test(){
//		return "redirect:list.do";
//	}
	
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

	// 02_01. 게시글 작성화면
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public ModelAndView write(BoardVO boardVo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/write");
		return mav;
	}

	// 02_02. 게시글 작성처리
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public String insert(BoardVO boardVo) throws Exception {
		boardService.writeArticle(boardVo);
		return "redirect:list.do";
	}

	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
	@RequestMapping(value = "view.do", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("bno") int bno, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		// 조회수 증가 처리
		boardService.increaseViewcnt(bno, session);
		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",boardService.View(bno));
		mav.setViewName("board/view");
		return mav;
	}

	// 04. 게시글 수정
	@RequestMapping(value="view.do", method = RequestMethod.POST)
	public String update(@ModelAttribute BoardVO vo) throws Exception {
		boardService.updateDao(vo);
		return "redirect:view.do?bno="+vo.getBno();
	} 

	// 05. 게시글 삭제
	@RequestMapping(value ="delete.do", method = RequestMethod.GET)
	public String delete(@RequestParam("bno") int bno) throws Exception {
		boardService.deleteService(bno);
		return "redirect:list.do";
	}

}
