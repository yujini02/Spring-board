package com.ssg.board.service;

import com.ssg.board.domain.BoardDTO;
import com.ssg.board.domain.BoardVO;
import com.ssg.board.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class BoardServicelmpl implements BoardService {

    private final BoardMapper boardMapper;

    @Override
    public Long register(BoardVO boardVO) {
        log.info("register: {}", boardVO);
        boardMapper.insert(boardVO);
        return boardVO.getBno();
    }

    @Override
    public List<BoardVO> getListAll() {
        return boardMapper.getList();
    }

    @Override
    public BoardVO getOne(Long bno) {
        return boardMapper.selectOne(bno);
    }

    @Override
    public boolean modify(BoardVO boardVO) {
        log.info("modify: {}", boardVO);
        return boardMapper.update(boardVO) == 1;  // 수정된 row 수가 1이면 true
    }

    @Override
    public boolean remove(Long bno) {
        log.info("remove: {}", bno);
        return boardMapper.delete(bno) == 1;  // 삭제된 row 수가 1이면 true
    }
}
