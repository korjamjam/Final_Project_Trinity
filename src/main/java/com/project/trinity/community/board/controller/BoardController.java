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
		String boardTitle;
		System.out.println("type 파라미터 값: " + type); // 디버깅용

		// 기본 게시판 유형 설정
		switch (type) {
		case "free":
			boardTitle = "자유게시판";
			break;
		case "meditalk":
			boardTitle = "메디톡";
			break;
		case "event":
			boardTitle = "이벤트";
			break;
		default:
			boardTitle = "실시간 인기글";
			break;
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
	@RequestMapping("/boardDetail")
	public String showCommunityPostDetailPage(
	        @RequestParam("bno") int bno, 
	        @RequestParam("category") String category, 
	        Model model) {
	    
	    // 게시글 번호(bno)에 해당하는 게시글 정보 조회
	    Board board = boardService.selectBoard(bno); // BoardService에서 selectBoard 메서드 호출
	    
	    // 조회된 게시글과 카테고리를 모델에 추가
	    model.addAttribute("b", board); // 게시글 정보를 "b"에 담아 전달
	    model.addAttribute("currentCategory", category); // 현재 카테고리를 "currentCategory"에 담아 전달
	    
	    return "community/community_board_detail"; // 상세 페이지 JSP 경로 반환
	}


	// 글쓰기 페이지 이동 매핑
	@RequestMapping("/write")
	public String showSummernotePage() {
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

	@GetMapping("/detail.bo")
	public String selectBoard(@RequestParam("bno") int bno, Model model) {
	    // 조회수 증가 메서드 호출
	    boardService.increaseCount(bno);
	    
	    // 게시글 조회 메서드 호출
	    Board b = boardService.selectBoard(bno);
	    if (b != null) {
	        model.addAttribute("b", b);
	        return "community/community_board_detail";
	    } else {
	        model.addAttribute("errorMsg", "게시글이 존재하지 않습니다.");
	        return "common/errorPage";
	    }
	}

    @Autowired
    private BoardService summernoteService; // 서비스 객체를 주입받아 사용

    @PostMapping("/summernote")
    public String insertBoard(Board b, Model m, HttpSession session) {
        // 세션에서 로그인 사용자 정보 가져오기
        Member loginUser = (Member) session.getAttribute("loginUser");
        b.setUserNo(loginUser.getUserNo()); // Board 객체에 userId 설정
        
        int result = summernoteService.insertBoard(b); // 로그인한 사용자의 ID가 설정된 후 DB에 게시글 삽입
        if (result > 0) {
            // 게시글 작성 성공 시 상세보기 페이지로 이동하며 게시글 데이터 전달
            Board savedBoard = summernoteService.selectBoard(b.getBoardNo()); // 새로 저장된 게시글 조회
            m.addAttribute("b", savedBoard); // Model에 저장된 게시글 추가
            return "community/community_board_detail"; // 상세보기 페이지로 이동
        } else {
            // 작성 실패 시 에러 메시지를 담아 에러 페이지로 이동
            m.addAttribute("errorMsg", "게시글 작성에 실패했습니다.");
            return "errorPage";
        }
    }


    @GetMapping("/boardDetail")
    public String boardDetail(@RequestParam("boardNo") int boardNo, Model model) {
        // boardNo에 해당하는 게시글을 조회
        Board b = summernoteService.selectBoard(boardNo);
        model.addAttribute("b", b);
        return "board_detail"; // 상세보기 페이지
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
