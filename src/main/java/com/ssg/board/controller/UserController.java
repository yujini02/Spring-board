package com.ssg.board.controller;

import com.ssg.board.domain.UserVO;
import com.ssg.board.domain.UserDTO;
import com.ssg.board.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
@Log4j2
public class UserController {

    private final UserService userService;

    @GetMapping("/login")
    public String loginForm() {
        return "user/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("uemail") String email,
                        @RequestParam("upwd") String upwd,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {

        UserVO user = userService.login(email, upwd);

        log.info("입력한 이메일: {}", email);
        log.info("입력한 비밀번호: {}", upwd);
        log.info("로그인 성공 여부: {}", user != null ? "성공" : "실패");
        if (user != null) {
            log.info("user 정보: {}", user);

            // 로그인 성공하면 세션에 저장
            session.setAttribute("loginUser", user);

            // 역할(role)별로 다른 페이지로 이동
            if ("ADMIN".equalsIgnoreCase(user.getUrole())) {
                return "redirect:/user/userlist"; // 관리자면 userlist.jsp
            } else {
                return "redirect:/board/list"; // 일반 유저면 index.jsp
            }


        } else {
            redirectAttributes.addFlashAttribute("msg", "Invalid credentials");
            return "redirect:/user/login"; // 다시 로그인 페이지
        }
    }

    @GetMapping("/userlist")
    public String userList(Model model) {
        List<UserVO> users = userService.getAllUsers();     // 유저 전체 조회
        model.addAttribute("userList", users);  // JSP로 전달
        return "user/userlist";
    }

    //회원가입 화면 띄우기
    @GetMapping("/signup")
    public String signupForm(Model model) {
        return "user/signup";
    }

    //회원가입 처리
    @PostMapping("/signup")
    public String signup(@ModelAttribute UserDTO userDTO) {
        // 입력된 값은 userDTO 안에 담김
        // 그걸 서비스로 넘김
        userService.saveUserRequest(userDTO);
        return "redirect:/user/login";
    }
}
