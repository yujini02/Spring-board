package com.ssg.board.mapper;

import com.ssg.board.domain.BoardVO;
import com.ssg.board.domain.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;



public interface BoardMapper {
    void insert(BoardVO boardVO);
    List<BoardVO> getList();
    BoardVO selectOne(Long bno);
    int update(BoardVO boardVO);
    int delete(Long bno);

}
