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
import org.springframework.dao.DuplicateKeyException;
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
import com.project.trinity.community.board.model.vo.BoardCategory;
import com.project.trinity.community.board.model.vo.BoardFile;
import com.project.trinity.community.board.model.vo.Like;
import com.project.trinity.community.board.model.vo.Comment;
import com.project.trinity.community.board.service.BoardService;
import com.project.trinity.community.common.vo.Template;
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
	
	
	// 동적으로 커뮤니티 페이지 연결 및 게시글 목록 + 페이징 처리
	@RequestMapping("/main")
	public String getBoardPage(
	    @RequestParam(value = "categoryId", required = false) String categoryId,
	    @RequestParam(value = "cpage", defaultValue = "1") int currentPage,
	    Model m) {
	    

	    // 카테고리별 게시글 수 조회
	    int listCount = boardService.selectCountCategoryList(categoryId);

	    // 페이징 정보 설정
	    PageInfo pi = Template.getPageInfo(listCount, currentPage, 10, 20);

	    // 게시글 목록 조회
	    List<Board> boardList = boardService.selectListByCategory(categoryId, pi);
	    System.out.println("게시글 수: " + listCount);
	    System.out.println("게시글 목록: " + boardList);

	    // 모델에 데이터 추가
	    m.addAttribute("categoryId", categoryId);
	    m.addAttribute("boardList", boardList);
	    m.addAttribute("pi", pi);


	    return "community/board";
	}

	private String getCategoryNameById(String categoryId) {
	    switch (categoryId) {
	        case "CAT01": return "자유게시판";
	        case "CAT02": return "메디톡";
	        case "CAT03": return "이벤트";
	        default: return "실시간 인기글";
	    }
	}



//@RequestMapping("/board")
//	public String getBoardPage(
//	    @RequestParam(name = "type", required = false, defaultValue = "popular") String type,
//	    @RequestParam(value = "cpage", defaultValue = "1") int currentPage,
//	    Model model
//	) {
//	    String categoryId = null;
//	    String categoryName = null;
//
//	    // 'popular' 타입은 카테고리가 아니므로, 실시간 인기글로 고정
//	    if ("popular".equals(type)) {
//	        categoryName = "실시간 인기글";  // 인기글 이름
//	    } else {
//	        // 카테고리별 type에 맞춰 categoryId 설정
//	        categoryId = getCategoryIdByType(type);
//	        categoryName = boardService.getCategoryNameById(categoryId);  // 서비스에서 카테고리 이름 조회
//	    }
//
//	    model.addAttribute("categoryId", categoryId);
//	    model.addAttribute("categoryName", categoryName);
//
//	    // 'popular' 타입일 때는 조회수가 높은 게시글을 가져옴
//	    if ("popular".equals(type)) {
//	        int boardLimit = 20;
//	        int startRow = (currentPage - 1) * boardLimit + 1;
//	        int endRow = startRow + boardLimit - 1;
//
//	        Map<String, Object> params = new HashMap<>();
//	        params.put("startRow", startRow);
//	        params.put("endRow", endRow);
//
//	        // 조회수가 높은 게시글을 가져오는 서비스 호출
//	        List<Board> recentPopularList = boardService.selectRecentPopularList(params);
//	        model.addAttribute("recentPopularList", recentPopularList);
//	        System.out.println("최근 인기 게시글: " + recentPopularList);
//	    } else {
//	        // 다른 카테고리별 게시글 목록 처리
//	        int boardLimit = 20;
//	        int startRow = (currentPage - 1) * boardLimit + 1;
//	        int endRow = startRow + boardLimit - 1;
//
//	        Map<String, Object> params = new HashMap<>();
//	        params.put("startRow", startRow);
//	        params.put("endRow", endRow);
//	        params.put("categoryId", categoryId);
//
//	        List<Board> boardList = boardService.selectListByCategory(type, params);
//	        model.addAttribute("boardList", boardList);
//	    }
//
//	    return "community/community_main_popular";
//	}


	








	// 게시판에서 글쓰기 버튼 누를 때
	@GetMapping("/write")
	public String showSummernote(@RequestParam(name = "categoryId", required = false, defaultValue = "CAT01") String categoryId,
	                             Model m) {
	    
	    System.out.println("Received categoryId: " + categoryId); 
	    
	    // categoryId를 통해 categoryName을 조회
	    String categoryName = boardService.getCategoryNameById(categoryId);
	    System.out.println("Category Name: " + categoryName);
	    
	    // Model에 categoryName을 추가하여 JSP로 전달
	    m.addAttribute("categoryId", categoryId);
	    m.addAttribute("categoryName", categoryName);
	    
	    return "community/summernote";
	}




	// insertBoard하면서 동시에 작동해서 상세페이지를 바로 보여줌
	@GetMapping("/boardDetail")
	public String selectBoard(@RequestParam("bno") String bno, Model m) {
	    // bno 값이 제대로 전달되는지 확인
	    System.out.println("Received bno: " + bno); // bno 값 출력
	    
	    // Board 객체 조회
	    Board b = boardService.selectBoard(bno);
	    System.out.println("Board object retrieved: " + b); // Board 객체 출력
	    
	    if (b != null) {
	    	 // 조회수 증가
	        int countResult = boardService.increaseCount(bno);  // 조회수 증가 메서드 호출
	        System.out.println("Increase count result: " + countResult);  // 결과 확인

	        
	        // 첨부파일 리스트 가져오기
	        List<BoardFile> attachedFiles = boardService.getFilesList(bno);
	        System.out.println("Attached files: " + attachedFiles); // 첨부파일 정보 출력

	        // 카테고리 목록 조회
	        List<BoardCategory> categories = boardService.getCategories(); // DB에서 카테고리 목록 조회
	        // 카테고리 이름 조회
	        String categoryName = boardService.getCategoryNameById(b.getCategoryId());
	       

	        // 모델에 데이터 추가
	        m.addAttribute("b", b);
	        m.addAttribute("attachedFiles", attachedFiles);
	        m.addAttribute("categoryName", categoryName);
	        m.addAttribute("categories", categories); // 드롭다운에 사용할 카테고리 목록	        
	       
	        return "community/community_board_detail"; // 상세 페이지로 이동
	    } else {
	        // Board가 null인 경우 에러 메시지 출력
	        System.out.println("Board not found for bno: " + bno); // 게시글이 없는 경우 로그
	        m.addAttribute("errorMsg", "게시글을 찾을 수 없습니다.");
	        return "/common/errorPage"; // 에러 페이지로 이동
	    }
	}




	// showSummernote 후에 작성완료 버튼 클릭하면 작동
	@PostMapping("/write")
	public String insertBoard(Board b,
	        @RequestParam(value = "allowDownload", required = false) List<String> allowDownload, 
	        @RequestParam(value = "upfiles", required = false) ArrayList<MultipartFile> upfiles,
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

	    // 게시글에 categoryId가 설정되어 있는지 확인
	    if (b.getCategoryId() == null || b.getCategoryId().isEmpty()) {
	        m.addAttribute("errorMsg", "카테고리가 지정되지 않았습니다.");
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

	
	@GetMapping("/edit")
	public String editBoardPage(@RequestParam("bno") String boardNo, Model m) {
	    // 게시글 정보 조회
	    Board b = boardService.selectBoard(boardNo);
	    System.out.println("boardNo: " + boardNo);
	    
	    // 첨부파일 목록 조회
	    List<BoardFile> attachedFiles = boardService.getFilesList(boardNo);
	    System.out.println("첨부파일 결과: " + attachedFiles);
	    
	    // 게시글이 존재하는지 확인
	    if (b != null) {
	        m.addAttribute("b", b);
	        
	        // attachedFiles가 null이거나 비어있으면 빈 리스트로 처리
	        if (attachedFiles == null || attachedFiles.isEmpty()) {
	            attachedFiles = new ArrayList<>();
	        }
	        
	        m.addAttribute("attachedFiles", attachedFiles);
	        System.out.println("첨부파일 리스트: " + attachedFiles);

	        return "community/summernoteUpdateForm";
	    } else {
	        m.addAttribute("errorMsg", "게시글을 불러오는데 실패했습니다.");
	        return "common/errorPage";
	    }
	}


	// 수정 완료 처리
	@PostMapping("/update")
	public String updateBoard(Board b,
	                          @RequestParam(value = "allowDownload", required = false) List<String> allowDownload,
	                          @RequestParam(value = "existingFileNos", required = false) List<String> existingFileNos,
	                          @RequestParam(value = "upfiles", required = false) List<MultipartFile> newFiles,
	                          HttpSession session, Model m) {
	    try {
	        // 1. 게시글 수정
	        int boardResult = boardService.updateBoard(b);

	        if (boardResult <= 0) {
	            m.addAttribute("errorMsg", "게시글 수정에 실패했습니다.");
	            return "common/errorPage";
	        }

	        // 2. 기존 첨부파일 다운로드 허용 상태 업데이트
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

	        // 3. 새 파일 업로드 처리
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

	        // 수정 성공 시 상세 페이지로 리다이렉트
	        return "redirect:/community/boardDetail?bno=" + b.getBoardNo();

	    } catch (Exception e) {
	        e.printStackTrace();
	        m.addAttribute("errorMsg", "게시글 수정 중 오류가 발생했습니다.");
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
	public String ajaxInsertReply(Comment r) {
		 
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
		        ArrayList<Comment> list = boardService.selectReply(bno);
		        System.out.println("댓글 목록: " + list);
		        return new Gson().toJson(list);
		    } catch (Exception e) {
		        System.err.println("댓글 목록 조회 중 오류 발생: " + e.getMessage());
		        e.printStackTrace();
		        return null;
		    }
	}
	
	
	@ResponseBody
	@RequestMapping("toggleLike.bo")
	public Map<String, Object> toggleLike(
	    @RequestParam("commentNo") String commentNo,
	    @RequestParam("userNo") String userNo,
	    @RequestParam("isLike") int isLike) {
	    Map<String, Object> response = new HashMap<>();
	    try {
	        // 파라미터 유효성 검사
	        if (commentNo == null || userNo == null || (isLike != 0 && isLike != 1)) {
	            response.put("success", false);
	            response.put("message", "잘못된 요청 데이터입니다.");
	            return response;
	        }

	        // 좋아요/싫어요 로우데이터 가져오기
	        Like existingLike = boardService.getCurrentLikeState(commentNo, userNo);

	        if (existingLike == null) {
	            // 데이터가 없으면 새로 추가
	            boardService.insertLikeDislike(commentNo, userNo, isLike);

	            response.put("success", true);
	            response.put("likeCount", boardService.getLikeCount(commentNo));
	            response.put("dislikeCount", boardService.getDislikeCount(commentNo));
	            response.put("message", isLike == 1 ? "좋아요가 추가되었습니다." : "싫어요가 추가되었습니다.");
	            return response;
	        }

	        // 데이터가 있으면 현재 상태와 비교
	        if (existingLike.getIsLike() == isLike) {
	            response.put("success", false);
	            response.put("message", isLike == 1 ? "이미 좋아요를 누르셨습니다." : "이미 싫어요를 누르셨습니다.");
	            return response;
	        }

	        // 상태 업데이트
	        boardService.updateLikeDislike(commentNo, userNo, isLike);

	        response.put("success", true);
	        response.put("likeCount", boardService.getLikeCount(commentNo));
	        response.put("dislikeCount", boardService.getDislikeCount(commentNo));
	        response.put("message", isLike == 1 ? "좋아요로 변경되었습니다." : "싫어요로 변경되었습니다.");

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("success", false);
	        response.put("message", "서버 오류가 발생했습니다.");
	    }
	    return response;
	}






	
	@ResponseBody
	@RequestMapping("rdelete.bo")
	public String deleteReply(String commentNo) {
	    int result = boardService.deleteReply(commentNo);

	    return result > 0 ? "success" : "fail";
	}


}