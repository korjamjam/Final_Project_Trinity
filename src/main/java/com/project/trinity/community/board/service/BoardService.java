package com.project.trinity.community.board.service;

import java.util.ArrayList;
import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.Reply;
import com.project.trinity.community.common.vo.PageInfo;


public interface BoardService {

    int insertBoard(Board board);
    Board selectBoard(int boardNo);
    int updateBoard(Board board);
    int deleteBoard(int boardNo);
    int selectListCount();
    int increaseCount(int bno);
    ArrayList<Reply> selectReply(int bno);
    int insertReply(Reply r);
    ArrayList<Board> selectTopBoardList();
	ArrayList<Board> selectList(PageInfo pi, String sortType);
}

