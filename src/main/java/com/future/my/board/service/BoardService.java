package com.future.my.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.future.my.board.dao.IBoardDAO;
import com.future.my.board.vo.BoardSearchVO;
import com.future.my.board.vo.BoardVO;

@Service
public class BoardService {
	
	@Autowired
	IBoardDAO dao;
	
	// 게시판 조회
	public List<BoardVO> getBoardList(BoardSearchVO searchVO){
		
		// 전체 건 수 조회
		int totalRowCount = dao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return dao.getBoardList(searchVO);
	}
	// 게시글 작성
	public void writeBoard(BoardVO board) throws Exception{
		int result = dao.writeBoard(board);
		if(result == 0) {
			throw new Exception();
		}
	}
	// 게시글 상세보기
	public BoardVO getBoard(int boardNo) throws Exception{
		BoardVO result = dao.getBoard(boardNo);
		
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
	// 게시글 조회수
	public void increaseHit(int boardNo) throws Exception{
		int result = dao.increaseHit(boardNo);
		if(result == 0) {
			throw new Exception();
		}
	}
	
}
