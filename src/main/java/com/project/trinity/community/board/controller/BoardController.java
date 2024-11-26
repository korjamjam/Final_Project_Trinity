package com.project.trinity.community.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
	
	// 총 게시글 리스트(단 조회수)
	@GetMapping("/main")
	public String popularList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
	    int listCount = boardService.selectListCount();
	    int boardLimit = 16;
	    int pageLimit = 5;

	    PageInfo pi = Template.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	    int startRow = (currentPage - 1) * boardLimit + 1;
	    int endRow = startRow + boardLimit - 1;

	    Map<String, Object> params = new HashMap<>();
	    params.put("startRow", startRow);
	    params.put("endRow", endRow);

	    ArrayList<Board> popularList = boardService.selectPopularList(params);
	    model.addAttribute("popularList", popularList);
	    model.addAttribute("pi", pi);
	    
	    System.out.println("popularList: " + popularList);

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
			@RequestParam(value = "allowDownload", required = false) List<String> allowDownload, // 기본값 "Y" 설정,
			@RequestParam(value = "upfiles", required = false) ArrayList<MultipartFile> upfiles ,
	                          HttpSession session,
	                          Model m) {
		
		System.out.println("upfiles : " + upfiles);
		System.out.println("-------------------------");
		System.out.println(allowDownload);
		System.out.println("-------------------------");
		
	
	    // 로그인 사용자 확인 -> 인터셉터
	    Member loginUser = (Member) session.getAttribute("loginUser");

	    // 게시글 제목 검증
	    if (b.getBoardTitle() == null || b.getBoardTitle().trim().isEmpty()) {
	        m.addAttribute("errorMsg", "제목을 입력해야 합니다.");
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

	                        // allowDownload 값 설정
	                        if (allowDownload != null && allowDownload.size() > i) {
	                            bf.setAllowDownload(allowDownload.get(i)); // 다운로드 허용 여부 설정
	                        } else {
	                            bf.setAllowDownload("Y"); // 기본값 설정
	                        }

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
	    BoardFile file = boardService.getSingleFile(fileNo);
	    if (file == null || !"Y".equals(file.getAllowDownload())) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	    }

	    // 파일 경로로 실제 파일 제공
	    String filePath = "파일 저장 경로/" + file.getChangeName();
	    Resource resource = new FileSystemResource(new File(filePath));
	    return ResponseEntity.ok()
	        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getOriginName() + "\"")
	        .body(resource);
	}

	
//수정버튼 클릭 시 
	@GetMapping("/edit")
	public String editBoardPage(@RequestParam("bno") String boardNo, Model m) {
		// 게시글 정보 가져오기
		Board b = boardService.selectBoard(boardNo);
		 // 첨부파일 정보 가져오기
	    List<BoardFile> attachedFiles = boardService.getFilesList(boardNo);

		if (b != null) {
			 m.addAttribute("b", b); // 게시글 정보
		        m.addAttribute("attachedFiles", attachedFiles); // 첨부파일 정보
		        System.out.println("첨부파일 리스트: " + attachedFiles);

			return "community/summernoteUpdateForm"; // 수정 페이지 JSP
		} else {
			m.addAttribute("errorMsg", "게시글을 불러오는데 실패했습니다.");
			return "common/errorPage";
		}
	}
//수정 완료 후
	@PostMapping("/update")
	public String updateBoard(Board b,
	                          @RequestParam(value = "allowDownload", required = false) List<String> allowDownload,
	                          @RequestParam(value = "existingFileNos", required = false) List<String> existingFileNos,
	                          @RequestParam(value = "upfiles", required = false) List<MultipartFile> newFiles,
	                          HttpSession session, Model m) {

	    // 게시글 수정
	    int boardResult = boardService.updateBoard(b);

	    if (boardResult > 0) {
	        // 기존 첨부파일 다운로드 허용 상태 업데이트
	        if (allowDownload != null && existingFileNos != null) {
	            for (int i = 0; i < existingFileNos.size(); i++) {
	                String fileNo = existingFileNos.get(i);
	                String allow = allowDownload.get(i);

	                BoardFile bf = new BoardFile();
	                bf.setFileNo(fileNo);
	                bf.setAllowDownload(allow);

	                boardService.updateFileAllowDownload(bf); // 기존 파일 상태 업데이트
	            }
	        }

	        // 새 파일 업로드 처리
	        if (newFiles != null && !newFiles.isEmpty()) {
	            for (MultipartFile file : newFiles) {
	                if (!file.isEmpty()) {
	                    String changeName = Template.saveFile(file, session, "/resources/uploadFile/");
	                    if (changeName != null) {
	                        BoardFile bf = new BoardFile();
	                        bf.setBoardNo(b.getBoardNo());
	                        bf.setUserNo(b.getUserNo());
	                        bf.setOriginName(file.getOriginalFilename());
	                        bf.setChangeName("/resources/uploadFile/" + changeName);
	                        bf.setFileSize(file.getSize());
	                        bf.setAllowDownload("Y");

	                        boardService.insertFile(bf); // 새 파일 추가
	                    }
	                }
	            }
	        }

	        return "redirect:/community/boardDetail?bno=" + b.getBoardNo();
	    } else {
	        m.addAttribute("errorMsg", "게시글 수정 실패");
	        return "common/errorPage";
	    }
	}


	@PostMapping("/deleteFile")
	public String deleteFile(@RequestBody Map<String, String> fileData) {
	    String fileNo = fileData.get("fileNo");
	    BoardFile file = boardService.getSingleFile(fileNo);

	    if (file == null) {
	        return "파일이 존재하지 않습니다.";
	    }

	    // 실제 파일 삭제
	    File targetFile = new File("파일 저장 경로/" + file.getChangeName());
	    if (targetFile.exists() && targetFile.delete()) {
	        boardService.deleteFile(fileNo); // 데이터베이스에서도 삭제
	        return "삭제 성공";
	    } else {
	        return "파일 삭제 실패";
	    }
	}
	
	//댓글을 DB에 저장
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxInsertReply(Reply r) {
		 
		 System.out.println("댓글 데이터: " + r); // 전달받은 댓글 데이터 확인
		//성공했을 때 success, 실패했을 때 fail
		return boardService.insertReply(r) > 0 ? "success" : "fail";
	}
	
	
	//특정 게시물의 댓글목록을 json형식으로 반환
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(String bno) {
		  System.out.println("댓글 목록 요청 - 게시글 번호: " + bno);
	
		  try {
		        ArrayList<Reply> list = boardService.selectReply(bno);
		        System.out.println("댓글 목록: " + list);
		        return new Gson().toJson(list);
		    } catch (Exception e) {
		        System.err.println("댓글 목록 조회 중 오류 발생: " + e.getMessage());
		        e.printStackTrace();
		        return null;
		    }
	}
	@PostMapping("updateLike.bo")
	@ResponseBody
	public String updateLikeCount(@RequestParam("commentNo") String commentNo) {
	    try {
	        // 좋아요 카운트를 증가시키는 서비스 호출
	        int result = boardService.updateLikeCount(commentNo);

	        if (result > 0) {
	            return "success";
	        } else {
	            return "fail";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	}


	
	
	@ResponseBody
	@RequestMapping(value="topList.bo", produces="application/json; charset-UTF-8")
	public String ajaxTopBoardList() {
		return new Gson().toJson(boardService.selectTopBoardList());
	}
	
	@ResponseBody
	@RequestMapping("rdelete.bo")
	public String deleteReply(String replyNo) {
	    int result = boardService.deleteReply(replyNo);

	    return result > 0 ? "success" : "fail";
	}


}