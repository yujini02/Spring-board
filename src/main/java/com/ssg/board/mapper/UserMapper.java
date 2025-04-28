package com.ssg.board.mapper;

import com.ssg.board.domain.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import java.util.List;


@Mapper
//자동으로 스프링컨테이너에 등록됨
//자바언어와 mtsql언어를 통역해주는 역할
public interface UserMapper {
    void insertUser(UserVO userVO);
    // 로그인용 조회
    UserVO findByEmail(String uemail);
    List<UserVO> selectAllUsers();// 이메일로 유저 찾기
}
