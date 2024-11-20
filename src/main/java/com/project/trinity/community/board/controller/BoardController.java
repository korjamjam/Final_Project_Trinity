package com.project.trinity.community.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	    String boardCategory = "free".equals(type) ? "자유게시판"
	                        : "meditalk".equals(type) ? "메디톡"
	                        : "event".equals(type) ? "이벤트"
	                        : "실시간 인기글";

	    model.addAttribute("boardCategory", boardCategory);
	    return "community/community_main";
	}


	// 동적으로 커뮤니티 페이지 연결 - type 파라미터에 따라 게시판 종류를 설정
	@RequestMapping("/board")
	public String getBoardPage(@RequestParam(name = "type", required = false, defaultValue = "popular") String type, Model model) {
	    String boardCategory = "popular".equals(type) ? "실시간 인기글"
	                        : "free".equals(type) ? "자유게시판"
	                        : "meditalk".equals(type) ? "메디톡"
	                        : "event".equals(type) ? "이벤트"
	                        : "실시간 인기글";

	    model.addAttribute("boardCategory", boardCategory);
	    return "community/board";
	}


	@GetMapping("/write")
	public String showSummernote(
	        @RequestParam(name = "type", required = false, defaultValue = "자유게시판") String type,
	        Model m) {
	    String boardCategory;

	    // type 값에 따라 카테고리 설정
	    if ("meditalk".equals(type)) {
	        boardCategory = "메디톡";
	    } else if ("event".equals(type)) {
	        boardCategory = "이벤트게시판";
	    } else {
	        boardCategory = "자유게시판";
	    }

	    m.addAttribute("boardCategory", boardCategory);
	    return "community/summernote";
	}



	@RequestMapping("/list.bo")
	public String selectList(
	        @RequestParam(value = "cpage", defaultValue = "1") int currentPage,
	        @RequestParam(value = "sortType", required = false) String sortType,
	        Model model) {
	    PageInfo pi = Template.getPageInfo(boardService.selectListCount(), currentPage, 10, 5);
	    model.addAttribute("list", boardService.selectList(pi, sortType))
	         .addAttribute("pi", pi);
	    return "community/board";
	}

	@GetMapping("/boardDetail")
	public String selectBoard(@RequestParam("bno") String bno, Model m) {
	    Board b = boardService.selectBoard(bno);

	    if (b != null) { 
	        m.addAttribute("b", b);
	        m.addAttribute("boardCategory", b.getBoardCategory());
	        return "community/community_board_detail"; // 상세 페이지로 이동
	    } else { 
	        m.addAttribute("errorMsg", "게시글을 찾을 수 없습니다.");
	        return "/common/errorPage";
	    }
	}


	@PostMapping("/write")
	public String insertBoard(Board b, HttpSession session, Model m) {
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        m.addAttribute("errorMsg", "로그인 후에 게시글을 작성할 수 있습니다.");
	        return "/common/errorPage";
	    }

	    b.setUserNo(loginUser.getUserNo());
	    b.setBoardWriter(loginUser.getUserId());

	    return boardService.insertBoard(b, loginUser.getUserNo()) > 0 
	            ? "redirect:/community/boardDetail?bno=" + b.getBoardNo() 
	            : m.addAttribute("errorMsg", "게시글 작성에 실패했습니다.").toString();
	}

	@GetMapping("edit.bo")
	public String editBoardPage(@RequestParam("bno") String boardNo, Model m) {
		// 게시글 정보 가져오기
		Board b = boardService.selectBoard(boardNo);

		if (b != null) {
			m.addAttribute("b", b); // 게시글 정보를 Model에 추가
			return "community/summernoteUpdateForm"; // 수정 페이지 JSP
		} else {
			m.addAttribute("errorMsg", "게시글을 불러오는데 실패했습니다.");
			return "common/errorPage";
		}
	}

	@PostMapping("/update")
	public String updateBoard(Board b, Model m) {
		// 수정된 데이터 처리
		int result = boardService.updateBoard(b); // 데이터베이스 업데이트
		if (result > 0) {
			return "redirect:/community/boardDetail?bno=" + b.getBoardNo(); // 성공 시 상세 페이지로 이동
		} else {
			m.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}

	@ResponseBody
	@PostMapping("/upload")
	public String uploadImages(@RequestParam("fileList") List<MultipartFile> fileList, HttpSession session) {
		List<String> changeNameList = new ArrayList<>();
		for (MultipartFile f : fileList) {
			String changeName = saveFile(f, session, "/resources/img/");
			 changeNameList.add("/resources/img/" + changeName); // 경로 포함
		}
		return new Gson().toJson(changeNameList);
	}

	
	
	public String saveFile(MultipartFile upfile, HttpSession session, String path) {
	    String originName = upfile.getOriginalFilename(); // 파일 원본명
	    if (originName == null || originName.isEmpty()) return null;

	    String ext = originName.substring(originName.lastIndexOf(".")); // 확장자 추출
	    String changeName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())
	            + "_" + ((int) (Math.random() * 90000) + 10000) + ext;

	    String savePath = session.getServletContext().getRealPath(path) + changeName;
	    System.out.println("파일 저장 경로: " + savePath);

	    try {
	        upfile.transferTo(new File(savePath));
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null; // 예외 발생 시 null 반환
	    }

	    return changeName; // 변경된 파일명 반환
	}


	@ResponseBody
	@PostMapping("/deleteFile")
	public String deleteFile(@RequestBody Map<String, String> fileData, HttpSession session) {
	    String fileName = fileData.get("fileName");

	    if (fileName == null || fileName.contains("..") || fileName.contains("/") || fileName.contains("\\")) {
	        return "유효하지 않은 파일 이름입니다.";
	    }

	    File file = new File(session.getServletContext().getRealPath("/resources/img/") + fileName);

	    return (file.exists() && file.delete()) ? "삭제 성공" : "파일 삭제 실패 또는 파일이 존재하지 않습니다.";
	}



}