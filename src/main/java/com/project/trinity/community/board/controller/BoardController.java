package com.project.trinity.community.board.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.google.gson.Gson;
import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.Reply;
import com.project.trinity.community.board.service.BoardService;
import com.project.trinity.community.common.template.Template;
import com.project.trinity.community.common.vo.PageInfo;

@Controller
@RequestMapping("/community")
public class BoardController {
	private final BoardService boardService;

	@Autowired
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}

	@RequestMapping("/main")
	public String communityMain(@RequestParam(name = "type", required = false) String type, Model model) {
		String boardTitle;
		System.out.println("type 파라미터 값: " + type); // type 값 확인
		if ("free".equals(type)) {
			boardTitle = "자유게시판";
		} else if ("meditalk".equals(type)) {
			boardTitle = "메디톡";
		} else if ("event".equals(type)) {
			boardTitle = "이벤트";
		} else {
			boardTitle = "실시간 인기글";
		}
		model.addAttribute("boardTitle", boardTitle);
		return "community/community_main";
	}

	// 동적으로 커뮤니티 페이지 연결 - type 파라미터에 따라 게시판 종류를 설정
	@RequestMapping("/board")
	public String getBoardPage(@RequestParam(name = "type", required = false) String type, Model model) {
		String boardTitle;

		if ("free".equals(type)) {
			boardTitle = "자유게시판";
		} else if ("meditalk".equals(type)) {
			boardTitle = "메디톡";
		} else if ("event".equals(type)) {
			boardTitle = "이벤트";
		} else {
			boardTitle = "실시간 인기글";
		}

		// 모델에 속성 추가
		model.addAttribute("boardTitle", boardTitle);

		// JSP 파일 이름을 community/Board로 설정하여 Board.jsp를 찾도록 함
		return "community/board";
	}

	// 게시글 상세 페이지 연결 - 카테고리와 함께
	@RequestMapping("/PostDetail")
	public String showCommunityPostDetailPage(@RequestParam("category") String category, Model model) {
		model.addAttribute("currentCategory", category);
		return "community/community_post_detail";
	}

	// 글쓰기 페이지 이동 매핑
	@RequestMapping("/write")
	public String showSummernotePage() {
		return "community/summernote";
	}

	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		int boardCount = boardService.selectListCount();

		PageInfo pi = Template.getPageInfo(boardCount, currentPage, 10, 5);
		ArrayList<Board> list = boardService.selectList(pi);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "board/boardListView";
	}

	@GetMapping("detail.bo")
	public String selectBoard(int bno, Model model) {
		int result = boardService.increaseCount(bno);

		if (result > 0) {
			Board b = boardService.selectBoard(bno);
			model.addAttribute("b", b);

			return "board/boardDetailView";

		} else {
			model.addAttribute("errorMsg", "게시글 조회 실패");
			return "common/errorPage";
		}
	}
}
