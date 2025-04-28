package com.ssg.board.service;

import com.ssg.board.domain.BoardDTO;
import com.ssg.board.domain.BoardVO;

import java.util.List;

public interface BoardService {
    Long register(BoardVO boardVO);
    List<BoardVO> getListAll();
    BoardVO getOne(Long bno);
    boolean modify(BoardVO boardVO);
    boolean remove(Long bno);
}
