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
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.project.trinity.community.board.model.vo.BoardFile;
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
				: "meditalk".equals(type) ? "메디톡" : "event".equals(type) ? "이벤트" : "실시간 인기글";

		model.addAttribute("boardCategory", boardCategory);
		return "community/community_main";
	}

	// 동적으로 커뮤니티 페이지 연결 - type 파라미터에 따라 게시판 종류를 설정
	@RequestMapping("/board")
	public String getBoardPage(@RequestParam(name = "type", required = false, defaultValue = "popular") String type,
			Model model) {
		String boardCategory = "popular".equals(type) ? "실시간 인기글"
				: "free".equals(type) ? "자유게시판"
						: "meditalk".equals(type) ? "메디톡" : "event".equals(type) ? "이벤트" : "실시간 인기글";

		model.addAttribute("boardCategory", boardCategory);
		return "community/board";
	}

	// 게시판에서 글쓰기 버튼 누를 때
	@GetMapping("/write")
	public String showSummernote(@RequestParam(name = "type", required = false, defaultValue = "자유게시판") String type,
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
	public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			@RequestParam(value = "sortType", required = false) String sortType, Model model) {
		PageInfo pi = Template.getPageInfo(boardService.selectListCount(), currentPage, 10, 5);
		model.addAttribute("list", boardService.selectList(pi, sortType)).addAttribute("pi", pi);
		return "community/board";
	}

	// insertBoard하면서 동시에 작동해서 상세페이지를 바로 보여줌
	@GetMapping("/boardDetail")
	public String selectBoard(@RequestParam("bno") String bno, Model m) {
		Board b = boardService.selectBoard(bno);
		List<BoardFile> attachedFiles = boardService.getFilesList(bno); // 첨부파일 리스트 가져오기

		if (b != null) {
			m.addAttribute("b", b);
			m.addAttribute("attachedFiles", attachedFiles); // 첨부파일 정보 추가
			m.addAttribute("boardCategory", b.getBoardCategory());
			return "community/community_board_detail"; // 상세 페이지로 이동
		} else {
			m.addAttribute("errorMsg", "게시글을 찾을 수 없습니다.");
			return "/common/errorPage";
		}
	}

	// showSummernote 후에 작성완료 버튼 클릭하면 작동
	@PostMapping("/write")
	public String insertBoard(Board b,
	                          @RequestParam(value = "allowDownload", required = false) List<String> allowDownloadList,
	                          @RequestParam("upfiles") ArrayList<MultipartFile> upfiles,
	                          HttpSession session,
	                          Model m) {
	    // 로그인 사용자 확인 -> 인터셉터
	    Member loginUser = (Member) session.getAttribute("loginUser");

	    // 게시글 제목 검증
	    if (b.getBoardTitle() == null || b.getBoardTitle().trim().isEmpty()) {
	        m.addAttribute("errorMsg", "제목을 입력해야 합니다.");
	        return "/common/errorPage";
	    }

	    // 파일 업로드 개수 검사
	    if (upfiles != null && upfiles.size() > 3) {
	        m.addAttribute("errorMsg", "파일은 최대 3개까지만 업로드할 수 있습니다.");
	        return "/common/errorPage";
	    }

	    // 게시글 저장
	    int boardResult = boardService.insertBoard(b, loginUser.getUserNo());
	    if (boardResult > 0) {
	        // 파일 업로드 처리
	        if (upfiles != null && !upfiles.isEmpty()) {
	            for (int i = 0; i < upfiles.size(); i++) {
	                MultipartFile upfile = upfiles.get(i);
	                if (!upfile.isEmpty()) {
	                    String changeName = Template.saveFile(upfile, session, "/resources/uploadFile/");
	                    if (changeName != null) {
	                        // 파일 정보 설정
	                        BoardFile bf = new BoardFile();
	                        bf.setBoardNo(b.getBoardNo());
	                        bf.setUserNo(loginUser.getUserNo());
	                        bf.setOriginName(upfile.getOriginalFilename());
	                        bf.setChangeName("/resources/uploadFile/" + changeName);
	                        bf.setFileSize(upfile.getSize());

	                        // 기본값 설정 (allowDownload가 null이거나 인덱스 초과 시 기본값 "Y")
	                        String allowDownload = (allowDownloadList != null && allowDownloadList.size() > i) 
	                                               ? allowDownloadList.get(i) 
	                                               : "Y";
	                        bf.setAllowDownload(allowDownload);

	                        int fileResult = boardService.insertFile(bf);
	                        if (fileResult <= 0) {
	                            m.addAttribute("errorMsg", "파일 정보를 저장하는 중 오류가 발생했습니다.");
	                            return "/common/errorPage";
	                        }
	                    } else {
	                        m.addAttribute("errorMsg", "파일 업로드 중 문제가 발생했습니다.");
	                        return "/common/errorPage";
	                    }
	                }
	            }
	        }

	        session.setAttribute("alertMsg", "게시글 작성 성공");
	        return "redirect:/community/boardDetail?bno=" + b.getBoardNo();
	    } else {
	        m.addAttribute("errorMsg", "게시글 작성에 실패했습니다.");
	        return "/common/errorPage";
	    }
	}


	@ResponseBody
	@PostMapping("/upload")
	public String uploadImages(@RequestParam("fileList") List<MultipartFile> fileList, HttpSession session) {
		List<String> changeNameList = new ArrayList<>();
		String finalPath = "/resources/img/BoardUploadFile/"; // 최종 저장 경로

		for (MultipartFile f : fileList) {
			String changeName = saveFile(f, session, finalPath);
			changeNameList.add(changeName); // 경로 포함
		}

		System.out.println(changeNameList);
		// 디버깅용 출력
		System.out.println("서버 반환 경로: " + changeNameList);
		return new Gson().toJson(changeNameList);
	}

	public String saveFile(MultipartFile upfile, HttpSession session, String path) {
		String originName = upfile.getOriginalFilename();
		if (originName == null || originName.isEmpty())
			return null;

		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + "_"
				+ ((int) (Math.random() * 90000) + 10000) + ext;

		String savePath = session.getServletContext().getRealPath(path) + changeName;
		System.out.println("파일 저장 경로: " + savePath);

		try {
			upfile.transferTo(new File(savePath));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		// 경로에 큰따옴표 없이 반환
		return session.getServletContext().getContextPath() + path + changeName;
	}

	@GetMapping("/downloadFile")
	public ResponseEntity<Resource> downloadFile(@RequestParam("fileNo") String fileNo) {

	    // 파일 정보 가져오기
	    BoardFile bf = boardService.getSingleFile(fileNo);

	    // 파일 정보 검증
	    if (bf == null || !"Y".equals(bf.getAllowDownload())) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).build(); // 파일이 없거나 다운로드 불가
	    }

	    // 파일 경로 설정
	    String filePath = "파일 저장 경로/" + bf.getChangeName();
	    File file = new File(filePath);

	    // 파일이 실제로 존재하지 않으면 404 응답
	    if (!file.exists()) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	    }

	    // 파일 다운로드 응답
	    Resource resource = new FileSystemResource(file);
	    return ResponseEntity.ok()
	            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + bf.getOriginName() + "\"")
	            .body(resource);
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