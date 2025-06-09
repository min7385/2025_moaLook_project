package com.future.my.board.web;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.future.my.board.service.BoardService;
import com.future.my.board.vo.BoardSearchVO;
import com.future.my.board.vo.BoardVO;
import com.future.my.member.vo.MemberVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/boardView")
	// 기존 boardView 메서드를 페이징 및 검색 기능을 포함하도록 변경
	public String boardView(Model model, HttpSession session, @ModelAttribute("searchVO") BoardSearchVO searchVO) {
		
		List<BoardVO> boardList = boardService.getBoardList(searchVO);
		model.addAttribute("boardList", boardList);
		
		// 디버깅 용도
//		System.out.println("--- BoardSearchVO Debug Info ---");
//		System.out.println("totalRowCount (전체 게시글 수): " + searchVO.getTotalRowCount());
//		System.out.println("BoardSearchVO.curPage (현재 페이지): " + searchVO.getCurPage());
//		System.out.println("BoardSearchVO.rowSizePerPage (페이지당 레코드 수): " + searchVO.getRowSizePerPage());
//		System.out.println("BoardSearchVO.pageSize (페이지 리스트 크기): " + searchVO.getPageSize());
//		System.out.println("BoardSearchVO.firstRow (시작 레코드): " + searchVO.getFirstRow());
//		System.out.println("BoardSearchVO.lastRow (마지막 레코드): " + searchVO.getLastRow());
//		System.out.println("BoardSearchVO.totalPageCount (총 페이지 수): " + searchVO.getTotalPageCount());
//		System.out.println("BoardSearchVO.firstPage (페이지네이션 시작): " + searchVO.getFirstPage());
//		System.out.println("BoardSearchVO.lastPage (페이지네이션 끝): " + searchVO.getLastPage());
//		System.out.println("BoardSearchVO.searchType: " + searchVO.getSearchType());
//		System.out.println("BoardSearchVO.searchWord: " + searchVO.getSearchWord());
//		System.out.println("BoardSearchVO.searchCategory: " + searchVO.getSearchCategory());
//		System.out.println("-------------------------");
		
		return "board/boardView";
	}
	
	@RequestMapping("/boardWriteView")
	public String boardWriteView(HttpSession session) {
		
		if(session.getAttribute("login") == null) {
			return "redirect:/registView";
		}
		
		return "board/boardWriteView";
	}
	
	@RequestMapping("/boardWriteDo")
	public String boardWriteDo(BoardVO board, HttpSession session, @RequestParam(value = "boardImg", required = false) MultipartFile boardImg) throws Exception {
		MemberVO login = (MemberVO) session.getAttribute("login");
		if(login == null) {
			return "redirect:/loginView";
		}
		board.setMemId(login.getMemId());
		
		System.out.println("boardtitle = " + board.getBoardTitle());
		System.out.println("styleType = " + board.getStyleType());
		
		// 파일 업로드 처리 로직 시작
		if(boardImg != null && !boardImg.isEmpty()) {
			// 1. 파일이 저장될 서버의 물리적 경로 설정
			// 실제 운영 환경에서는 이 경로를 외부 설정 파일(properties)에서 읽어오기를 권장.
			// 웹 서버(톰캣)가 접근 가능한 경로로 설정
			String uploadPath = "C:/dev/proj/moaLook_upload/";
			// 2. 업로드 디렉토리가 없으면 생성(필수)
			File uploadDir = new File(uploadPath);
			if(!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			
			// 3. 원본 파일명 가져오기
			String originalFileName = boardImg.getOriginalFilename();
			
			// 4. 고유 파일명 생성(UUID 사용)
			// 파일 확장자 추출
			String fileExtension = "";
			int dotIndex = originalFileName.lastIndexOf(".");
			if(dotIndex > 0 && dotIndex < originalFileName.length() -1) {
				fileExtension = originalFileName.substring(dotIndex);
			}
			// UUID와 현재 시간 조합
			String storedFileName = System.currentTimeMillis() + "_" + UUID.randomUUID().toString() + fileExtension;
			
			// 5. 서버에 저장할 파일 객체 생성
			File destFile = new File(uploadPath + storedFileName);
			

			try {
				// 6. 파일 저장 실행
				boardImg.transferTo(destFile);
				
				// 7. BoardVO에 저장된 파일 정보 설정
				board.setBoardImgPath(storedFileName);
				System.out.println("이미지 파일이 성공적으로 저장됨: " + destFile.getAbsolutePath());

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			// 파일이 업로드 되지 않았거나 비어있는 경우
			System.out.println("이미지 파일이 업로드 되지 않았거나 비어있습니다");
			board.setBoardImgPath(null);
		}
		// 파일 업로드 처리 로직 종료
		
		boardService.writeBoard(board);
		
		return "redirect:/boardView";
	}
	
	@RequestMapping("/boardDetailView")
	public String boardDetailView(int boardNo, Model model) throws Exception{
		
		BoardVO board = boardService.getBoard(boardNo);
		model.addAttribute("board", board);
		
		return "board/boardDetailView";
	}
}
