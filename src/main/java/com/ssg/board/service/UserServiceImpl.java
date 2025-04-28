package com.ssg.board.service;

import com.ssg.board.domain.UserVO;
import com.ssg.board.domain.UserDTO;
import com.ssg.board.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
    private final UserMapper userMapper;
    private final ModelMapper modelMapper;


    @Override
    public void saveUserRequest(UserDTO userDTO) {
        // DTO → VO 변환
        UserVO user = modelMapper.map(userDTO, UserVO.class);
        // DB에 저장
        userMapper.insertUser(user);
    }

    @Override
    public UserVO login(String uemail, String upwd) {
        UserVO user = userMapper.findByEmail(uemail);
        if (user != null && user.getUpwd().trim().equals(upwd)) {
            return user;
        }
        return null;
    }

    @Override
    public List<UserVO> getAllUsers() {
        return userMapper.selectAllUsers();
    }
}
