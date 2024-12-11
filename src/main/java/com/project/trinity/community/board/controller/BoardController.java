package com.project.trinity.community.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.project.trinity.community.board.model.vo.MedAnswer;
import com.project.trinity.community.board.model.vo.Comment;
import com.project.trinity.community.board.service.BoardService;
import com.project.trinity.community.common.vo.Template;
import com.project.trinity.community.common.vo.PageInfo;
import com.project.trinity.member.model.vo.MedicalField;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.service.MemberService;

@Controller
@RequestMapping("/community")
public class BoardController {
    private final BoardService boardService;
    private final MemberService memberService;

    @Autowired
    public BoardController(BoardService boardService, MemberService memberService) {
        this.boardService = boardService;
        this.memberService = memberService; // 초기화
    }

	@RequestMapping("/main")
	public String getBoardList(@RequestParam(value = "categoryId", required = false) String categoryId, // 필수 파라미터로 설정
	    @RequestParam(value = "cpage", defaultValue = "1") int currentPage, // 현재 페이지
	    @RequestParam(value = "sortType", defaultValue = "작성일") String sortType,
	    HttpServletRequest request,
	    Model m
	) {
	
	    if(categoryId != null && categoryId.equals("")) {
 	    	categoryId = null;
 	    }

	    // 카테고리 이름 설정
	    String categoryName = boardService.getCategoryNameById(categoryId);

	    // 페이징 정보 설정
	    int listCount = boardService.selectCountCategoryList(categoryId); // 총 게시글 수 조회
	    PageInfo pi = Template.getPageInfo(listCount, currentPage, 10, 20); // 페이징 계산

	 // 게시글 목록 조회, 실시간 인기글 동시 구현, 셀렉트박스 정렬
	 		List<Board> boardList = boardService.selectListByCategory(categoryId, pi, sortType);
	    // 모델에 데이터 추가
	    m.addAttribute("categoryId", categoryId);
	    m.addAttribute("categoryName", categoryName);
	    m.addAttribute("sortType", sortType);
	    m.addAttribute("boardList", boardList);
	    m.addAttribute("pi", pi);

	    return "community/board";
	}



	// 게시판에서 글쓰기 버튼 누를 때
	@GetMapping("/write")
	public String showSummernote(
			@RequestParam(name = "categoryId", required = false, defaultValue = "CAT01") String categoryId, Model m) {

		System.out.println("Received categoryId: " + categoryId);

		// categoryId를 통해 categoryName을 조회
		String categoryName = boardService.getCategoryNameById(categoryId);
		System.out.println("Category Name: " + categoryName);

		// Model에 categoryName을 추가하여 JSP로 전달
		m.addAttribute("categoryId", categoryId);
		m.addAttribute("categoryName", categoryName);

		return "community/board_Write_Form";
	}
	

	


	// insertBoard하면서 동시에 작동해서 상세페이지를 바로 보여줌
	@GetMapping("/boardDetail")
	public String viewDetailPage(@RequestParam("bno") String bno, Model m, HttpSession session) {
	    // 현재 게시글 번호 확인
	    System.out.println("Received bno: " + bno);

	    // 현재 게시글 조회
	    Board b = boardService.viewDetailPage(bno);
	    List<MedAnswer> ans = boardService.getAnswersByBoardNo(bno);
	    
	    System.out.println("상세페이지 ans Debug: " + ans);
	    if (b == null) {
	        m.addAttribute("errorMsg", "게시글을 찾을 수 없습니다.");
	        return "/common/errorPage";
	    }

	    // 조회수 증가
	    int countResult = boardService.increaseCount(bno);
	   
	    // 첨부파일 리스트 가져오기
	    List<BoardFile> fileList = boardService.getFileList(bno);   

	    // 카테고리 이름 조회
	    String categoryName = boardService.getCategoryNameById(b.getCategoryId());

	    // 로그인 사용자 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    if (loginUser != null) {
	        m.addAttribute("doctorName", loginUser.getUserName()); // 의사 이름을 doctorName으로 전달
	    }
	    // 이전 글 번호 조회 후 상세 정보 조회
	    String prevBno = boardService.getPreviousBoard(bno);
	    Board prevBoard = (prevBno != null) ? boardService.viewDetailPage(prevBno) : null;

	    // 다음 글 번호 조회 후 상세 정보 조회
	    String nextBno = boardService.getNextBoard(bno);
	    Board nextBoard = (nextBno != null) ? boardService.viewDetailPage(nextBno) : null;

	    // 카테고리 목록 조회 (드롭다운 메뉴용)
	    List<BoardCategory> categories = boardService.getCategories();

	    // 모델에 데이터 추가
	    m.addAttribute("b", b); // 현재 게시글
	    m.addAttribute("fileList", fileList); // 첨부파일
	    m.addAttribute("categoryName", categoryName); // 카테고리 이름
	    m.addAttribute("categories", categories); // 카테고리 목록
	    m.addAttribute("prevBoard", prevBoard); // 이전 게시글
	    m.addAttribute("nextBoard", nextBoard); // 다음 게시글
	    m.addAttribute("ans", ans); // 답변 리스트 추가
	  
	    return "community/community_board_detail"; // 상세 페이지로 이동
	}
	

	// showSummernote 후에 작성완료 버튼 클릭하면 작동
	@PostMapping("/write")
	public String insertBoard(Board b,
	        @RequestParam(value = "allowDownload", required = false) List<String> allowDownload,
	        @RequestParam(value = "upfiles", required = false) ArrayList<MultipartFile> successUpfiles, HttpSession session,
	        Model m) {

	    System.out.println("successUpfiles : " + successUpfiles); // 변수명 일치
	    System.out.println("-------------------------");
	    System.out.println("allowDownload : " + allowDownload);
	    System.out.println("-------------------------");
	    System.out.println("insert b : " + b);
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
	        if (successUpfiles != null && !successUpfiles.isEmpty()) {
	            for (int i = 0; i < successUpfiles.size(); i++) {
	                MultipartFile upfile = successUpfiles.get(i);
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
	                        bf.setAllowDownload((allowDownload != null && allowDownload.size() > i) ? allowDownload.get(i) : "Y");

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
	@GetMapping("/medAnswer")
	public String showMedAnswer(@RequestParam("bno") String bno, Model m) {
	    // boardNo를 받아서 해당 게시글에 대한 답변 페이지를 보여주는 로직
	    System.out.println("의료진 답글 Board No: " + bno);
	    
	    // 게시글 정보 가져오기
	    Board b = boardService.viewDetailPage(bno);
	    
	    // 첨부파일 리스트 가져오기
	    List<BoardFile> fileList = boardService.getFileList(bno);
	    System.out.println("Attached files: " + fileList);

	    // 카테고리 이름 조회
	    String categoryName = boardService.getCategoryNameById(b.getCategoryId());
	    
	    // 모델에 데이터 추가
	    m.addAttribute("b", b); // 게시글 정보
	    m.addAttribute("fileList", fileList); // 첨부파일 리스트
	    m.addAttribute("categoryName", categoryName); // 카테고리 이름
	  
	    
	    // AnswerForm 페이지로 이동
	    return "community/AnswerForm";
	}
	
	@PostMapping("/submitAnswer")
	public String submitAnswer(@ModelAttribute MedAnswer ans, HttpSession session) {
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        throw new RuntimeException("로그인 정보가 없습니다.");
	    }

	    // 로그인 사용자 정보 설정
	    ans.setMedNo(loginUser.getMedKey());
	    ans.setStatus("Y");
	    ans.setIsMedicalField("Y");

	    // MedicalField 정보 설정
	    MedicalField mf = memberService.getMedicalFieldByMedNo(loginUser.getMedKey());
	    if (mf != null) {
	        ans.setMedicalFieldId(mf.getMedicalFieldId());
	    }
	    System.out.println("답글 제출 전 ANS Debug: " + ans);
	    // 답글 저장 로직
	    boardService.saveAnswer(ans);
	    System.out.println("답글 제출 후 ANS Debug: " + ans);
	    // 답글 저장 후 게시글 상세보기로 리다이렉트
	    return "redirect:/community/boardDetail?bno=" + ans.getBoardNo();
	}


	@ResponseBody
	@PostMapping("/imgUpload")
	public String uploadImages(@RequestParam("imgList") List<MultipartFile> imgList, HttpSession session) {
	    List<String> changeNameList = new ArrayList<>();
	    String finalPath = "/resources/img/BoardUploadFile/"; // 최종 저장 경로

	    for (MultipartFile file : imgList) {
	        String changeName = saveFile(file, session, finalPath);  // 파일 저장
	        changeNameList.add(changeName);  // 저장된 이미지 경로 (URL 포함)
	    }

	    System.out.println(changeNameList);
	    return new Gson().toJson(changeNameList);  // 클라이언트에게 이미지 URL 반환
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
	public String editBoardPage(@RequestParam("bno") String bno, Model m) {
		// 게시글 정보 조회
		Board b = boardService.viewDetailPage(bno);
		System.out.println("boardNo: " + bno);

		// 첨부파일 목록 조회
		List<BoardFile> fileList = boardService.getFileList(bno);
		System.out.println("첨부파일 결과: " + fileList);

		// 게시글이 존재하는지 확인
		if (b != null) {
			m.addAttribute("b", b);

			// fiLeist가 null이거나 비어있으면 빈 리스트로 처리
			if (fileList == null || fileList.isEmpty()) {
				fileList = new ArrayList<>();
			}

			m.addAttribute("fileList", fileList);
			System.out.println("수정하려는 첨부파일 리스트: " + fileList);

			return "community/board_Update_Form";
		} else {
			m.addAttribute("errorMsg", "게시글을 불러오는데 실패했습니다.");
			return "common/errorPage";
		}
	}

	@GetMapping("/getFileList")
	@ResponseBody
	public List<BoardFile> getAttachedFiles(@RequestParam("bno") String bno) {
		System.out.println("수정첨부파일Received bno: " + bno); // 서버에서 bno 값 출력
	    return boardService.getFileList(bno);
	}

	
	// 수정 완료 처리
	@PostMapping("/update")
	public String updateBoard(Board b,
			@RequestParam(value = "allowDownload", required = false) List<String> allowDownload,
			@RequestParam(value = "upfiles", required = false) List<MultipartFile> newFiles, HttpSession session,
			Model m) {
		
		 
		//게시글 수정
		// -> 새로운 파일로 변경
		// -> 새로운파일로 변경x
		
		
		System.out.println("수정완료 newFiles : " + newFiles);
		try {
			
			ArrayList<BoardFile> fileList = new ArrayList<>();
			System.out.println("수정완료 후 userNo : " + b);
			// 3. 새 파일 업로드 처리
			if (newFiles != null && !newFiles.isEmpty()) {
				for (int i=0; i < newFiles.size(); i++) {
					if (!newFiles.get(i).isEmpty()) {
						String changeName = Template.saveFile(newFiles.get(i), session, "/resources/uploadFile/");
						if (changeName != null) {
							BoardFile bf = new BoardFile();
							bf.setBoardNo(b.getBoardNo());
							bf.setUserNo(b.getUserNo());
							bf.setOriginName(newFiles.get(i).getOriginalFilename());
							bf.setChangeName("/resources/uploadFile/" + changeName);
							bf.setFileSize(newFiles.get(i).getSize());
							bf.setAllowDownload(allowDownload.get(i));
							fileList.add(bf);
						}
					}
				}
			}
			
			// 1. 게시글 수정 -> 게시글 수정, 기존파일목록 삭제, 새로운 파일등록
			
			
			
			int boardResult = boardService.updateBoard(b, fileList);
			
			// 수정 성공 시 상세 페이지로 리다이렉트
			return "redirect:/community/boardDetail?bno=" + b.getBoardNo();
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("errorMsg", "게시글 수정 중 오류가 발생했습니다.");
			return "common/errorPage";
		}
	} 

	@RequestMapping("/deleteBoard")
	@ResponseBody
	public String deleteBoard(HttpSession session, @RequestParam String bno, @RequestParam String categoryId) {
	    System.out.println("삭제하려는 게시글 번호: " + bno);  // bno 값 확인
	    System.out.println("카테고리 ID: " + categoryId);  // categoryId 값 확인   

	    // 파라미터 유효성 검사
	    if (bno == null || categoryId == null) {
	        return "잘못된 요청입니다. 파라미터가 없습니다.";
	    }
	 // 세션에서 로그인된 사용자 정보 가져오기 (인터셉터로 인증되었음을 전제)
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    boolean isAdmin = "Y".equals(loginUser.getIsAdmin());

	    // 게시글에 첨부된 파일 목록 가져오기
	    List<BoardFile> fileList = boardService.getFileList(bno);	 

	    int boardDeleteResult;

	    if (isAdmin) {
	        // 관리자인 경우 물리적 삭제
	        boardDeleteResult = boardService.adminDeleteBoard(bno);
	        System.out.println("관리자에 의해 게시글이 완전 삭제되었습니다.");

	        // 첨부 파일 삭제
	        if (fileList != null && !fileList.isEmpty()) {
	            for (BoardFile file : fileList) {
	                String filePath = session.getServletContext().getRealPath(file.getChangeName());
	                File targetFile = new File(filePath);
	                if (targetFile.exists()) {
	                    targetFile.delete();
	                    System.out.println("파일이 삭제되었습니다: " + filePath);
	                } else {
	                    System.out.println("파일이 존재하지 않습니다: " + filePath);
	                }
	            }
	        }
	    } else {
	        // 일반 사용자인 경우 논리적 삭제
	        boardDeleteResult = boardService.deleteBoard(bno);
	        System.out.println("사용자에 의해 게시글이 논리 삭제되었습니다.");
	    }

	    // 삭제 실패 처리
	    if (boardDeleteResult <= 0) {
	        return "게시글 삭제에 실패했습니다.";
	    }

	    return "ok"; // 삭제 성공 메시지
	}

	@RequestMapping("/restoreBoard")
	@ResponseBody
	public String restoreBoard(HttpSession session, @RequestParam String bno) {
	    System.out.println("복구하려는 게시글 번호: " + bno);

	    // 파라미터 유효성 검사
	    if (bno == null) {
	        return "잘못된 요청입니다. 게시글 번호가 없습니다.";
	    }

	    // 세션에서 로그인된 사용자 정보 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    if (loginUser == null || !"Y".equals(loginUser.getIsAdmin())) {
	        return "권한이 없습니다. 관리자만 복구할 수 있습니다.";
	    }

	    // 복구 작업 수행
	    int restoreResult = boardService.restoreBoard(bno);

	    if (restoreResult > 0) {
	        System.out.println("게시글 복구 성공: " + bno);
	        return "ok"; // 성공 메시지
	    } else {
	        System.out.println("게시글 복구 실패: " + bno);
	        return "게시글 복구에 실패했습니다.";
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

	// 댓글을 DB에 저장
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxInsertReply(Comment r) {

		System.out.println("댓글 데이터: " + r); // 전달받은 댓글 데이터 확인
		// 성공했을 때 success, 실패했을 때 fail
		return boardService.insertComment(r) > 0 ? "success" : "fail";
	}

	
	// 특정 게시물의 댓글목록을 json형식으로 반환
		@ResponseBody
		@RequestMapping(value = "rlist.bo", produces = "application/json; charset=UTF-8")
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
	public Map<String, Object> toggleLike(@RequestParam("commentNo") String commentNo,
			@RequestParam("userNo") String userNo, @RequestParam("isLike") int isLike) {
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
		int result = boardService.deleteComment(commentNo); 

		return result > 0 ? "success" : "fail";
	}
	
	

}