package com.future.my.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.future.my.board.vo.BoardSearchVO;
import com.future.my.board.vo.BoardVO;

@Mapper
public interface IBoardDAO {
	
	// 전체 건 수 조회
	public int getTotalRowCount(BoardSearchVO searchVO);
	// 게시판 조회
	public List<BoardVO> getBoardList(BoardSearchVO searchVO);
	// 게시글 작성
	public int writeBoard(BoardVO board);
	// 게시글 상세보기
	public BoardVO getBoard(int boardNo);
	// 게시글 조회수
	public int increaseHit(int boardNo);
	
}
