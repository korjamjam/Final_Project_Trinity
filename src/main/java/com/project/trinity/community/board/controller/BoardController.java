package com.project.trinity.community.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import com.project.trinity.member.model.vo.Member;

@Controller
@RequestMapping("/community")
public class BoardController {
	private final BoardService boardService;

	@Autowired
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}

	@RequestMapping("/main")
	public String communityMain(@RequestParam(name = "type", required = false, defaultValue = "popular") String type,
			Model model) {
		String boardCategory;
		System.out.println("type 파라미터 값: " + type); // 디버깅용

		// 기본 게시판 유형 설정
		switch (type) {
		case "free":
			boardCategory = "자유게시판";
			break;
		case "meditalk":
			boardCategory = "메디톡";
			break;
		case "event":
			boardCategory = "이벤트";
			break;
		default:
			boardCategory = "실시간 인기글";
			break;
		}

		model.addAttribute("boardCategory", boardCategory);
		return "community/community_main";
	}

	// 동적으로 커뮤니티 페이지 연결 - type 파라미터에 따라 게시판 종류를 설정
	@RequestMapping("/board")
	public String getBoardPage(@RequestParam(name = "type", required = false) String type, Model model) {
		String boardCategory;

		if ("free".equals(type)) {
			boardCategory = "자유게시판";
		} else if ("meditalk".equals(type)) {
			boardCategory = "메디톡";
		} else if ("event".equals(type)) {
			boardCategory = "이벤트";
		} else {
			boardCategory = "실시간 인기글";
		}

		// 모델에 속성 추가
		model.addAttribute("boardCategory", boardCategory);

		// JSP 파일 이름을 community/Board로 설정하여 Board.jsp를 찾도록 함
		return "community/board";
	}

	// 글쓰기 페이지 이동 매핑
	@GetMapping("/write")
	public String showSummernote() {
		return "community/summernote";
	}

	@RequestMapping("/list.bo")
	public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
	                         @RequestParam(value = "sortType", required = false) String sortType,
	                         Model model) {
	    int boardCount = boardService.selectListCount();
	    PageInfo pi = Template.getPageInfo(boardCount, currentPage, 10, 5);
	    ArrayList<Board> list = boardService.selectList(pi, sortType);
	    System.out.println("게시글 수: " + list.size()); // 게시글 수 출력
	    model.addAttribute("list", list);
	    model.addAttribute("pi", pi);
	  
	    return "community/board";
	}

	@PostMapping("/boardDetail")
	public String selectBoard(@RequestParam("bno") String bno, Model model) {
	    // 조회수 증가 메서드 호출
	    boardService.increaseCount(bno);
	    
	    // 게시글 조회 메서드 호출
	    Board b = boardService.selectBoard(bno);
	    if (b != null) {
	        model.addAttribute("b", b);
	        return "community/community_board_detail";
	    } else {
	        model.addAttribute("errorMsg", "게시글이 존재하지 않습니다.");
	        return "/common/errorPage";
	    }
	}

	@PostMapping("/write")
	public String insertBoard(Board b, HttpSession session, Model m) {
	    // 디버깅 로그
	    System.out.println("세션 상태: " + session.getAttribute("loginUser"));
	  

	    // 필수 입력값 검증
	    if (b == null || b.getBoardTitle() == null || b.getBoardTitle().trim().isEmpty()) {
	        m.addAttribute("errorMsg", "제목은 필수 입력 항목입니다.");
	        return "/common/errorPage";
	    }

	    // 로그인 사용자 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        m.addAttribute("errorMsg", "로그인 후에 게시글을 작성할 수 있습니다.");
	        return "/common/errorPage";
	    }

	    // 작성자 정보 설정
	    System.out.println("Before setting boardWriter: " + b);
	    b.setBoardWriter(loginUser.getUserId());
	    b.setUserNo(loginUser.getUserNo());
	   

	    // 게시글 저장
	    int result = boardService.insertBoard(b, loginUser.getUserNo());
	    System.out.println("게시글 번호: " + b.getBoardNo()); // 추가 디버
	    if (result > 0) { // 성공 시 상세보기 페이지로 이동하며 게시글 데이터 전달
	        Board savedBoard = boardService.selectBoard(b.getBoardNo());
	        System.out.println("Board 객체 상태: " + b);
	        System.out.println("After setting boardWriter: " + b);
	        if (savedBoard == null) {
	            m.addAttribute("errorMsg", "게시글 저장 후 조회에 실패했습니다.");
	            return "/common/errorPage";
	        }
	        m.addAttribute("b", savedBoard);
	        session.setAttribute("alertMsg", "게시글 작성 성공");
	        return "redirect:/community/community_board_detail?bno=" + savedBoard.getBoardNo();
	    } else { // 실패 시 에러 페이지로 이동
	        m.addAttribute("errorMsg", "게시글 작성 실패");
	        return "/common/errorPage";
	    }
	}


  

    // AJAX를 통해 단일 파일 업로드 처리
    @ResponseBody
    @PostMapping("/upload")
    public String upload(MultipartFile upfile, HttpSession session) {
        // 파일 저장 후 변경된 파일명 반환
        String changeName = saveFile(upfile, session, "/resources/img/");
        List<String> changeNameList = new ArrayList<>();
        changeNameList.add(changeName);
        return new Gson().toJson(changeNameList);
    }

    // 파일 저장 메서드
    public String saveFile(MultipartFile upfile, HttpSession session, String path) {
        String originName = upfile.getOriginalFilename();
        String ext = originName.substring(originName.lastIndexOf("."));
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        int randNum = (int) (Math.random() * 90000) + 10000;
        String changeName = currentTime + "_" + randNum + ext;

        String savePath = session.getServletContext().getRealPath(path);
        try {
            upfile.transferTo(new File(savePath + changeName));
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        return changeName;
    }
    
}