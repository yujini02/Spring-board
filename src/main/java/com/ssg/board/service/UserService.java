package com.ssg.board.service;

import com.ssg.board.domain.UserVO;
import com.ssg.board.domain.UserDTO;

import java.util.List;


public interface UserService {
    void saveUserRequest(UserDTO userDTO);
    UserVO login(String uemail, String upwd);
    List<UserVO> getAllUsers();
}
