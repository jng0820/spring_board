package com.hanwha.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.PostMapping;
>>>>>>> f3fbb4b8ef93eb5aad0977717807a1a5d3c0d3b4
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.RestController;
>>>>>>> f3fbb4b8ef93eb5aad0977717807a1a5d3c0d3b4
import org.springframework.web.servlet.ModelAndView;

import com.hanwha.example.dto.BoardVO;
import com.hanwha.example.service.BoardService;

<<<<<<< HEAD
@Controller
=======
@RestController
>>>>>>> f3fbb4b8ef93eb5aad0977717807a1a5d3c0d3b4
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	BoardService boardService;

<<<<<<< HEAD
//	@RequestMapping("../../")
//	public String test(){
//		return "redirect:list.do";
//	}
	
=======
>>>>>>> f3fbb4b8ef93eb5aad0977717807a1a5d3c0d3b4
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

<<<<<<< HEAD
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
=======
	// 02_02. 게시글 작성처리
	@PostMapping(value = "insert.do")
	public String insert(@RequestBody BoardVO boardVo) throws Exception {
		System.out.println(boardVo);
>>>>>>> f3fbb4b8ef93eb5aad0977717807a1a5d3c0d3b4
		boardService.writeArticle(boardVo);
		return "redirect:list.do";
	}

<<<<<<< HEAD
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
=======
	// 04. 게시글 수정
	@RequestMapping(value="view.do", method = RequestMethod.PUT)
>>>>>>> f3fbb4b8ef93eb5aad0977717807a1a5d3c0d3b4
	public String update(@ModelAttribute BoardVO vo) throws Exception {
		boardService.updateDao(vo);
		return "redirect:view.do?bno="+vo.getBno();
	} 

	// 05. 게시글 삭제
<<<<<<< HEAD
	@RequestMapping(value ="delete.do", method = RequestMethod.GET)
=======
	@RequestMapping(value ="delete.do", method = RequestMethod.DELETE)
>>>>>>> f3fbb4b8ef93eb5aad0977717807a1a5d3c0d3b4
	public String delete(@RequestParam("bno") int bno) throws Exception {
		boardService.deleteService(bno);
		return "redirect:list.do";
	}

}
