package com.ssg.board.controller;

import com.ssg.board.domain.BoardDTO;
import com.ssg.board.domain.BoardVO;
import com.ssg.board.domain.UserVO;
import com.ssg.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
@Log4j2
public class BoardController {
    private final BoardService boardService;
    private final ModelMapper modelMapper;

    @GetMapping("list")
    public String listGet(Model model) {
        log.info("listGet");
        List<BoardVO> voList = boardService.getListAll();
        model.addAttribute("boardDTOList", voList);
        return "board/list";
    }

    @GetMapping("/register")
    public String registerGET(Model model, HttpSession session) {
        log.info("registerGET");
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        String writerName = (loginUser != null) ? loginUser.getUname() : "알 수 없음";
        model.addAttribute("writerName", writerName);
        return "board/register";
    }

    @PostMapping("/register")
    public String registerPOST(
            @Valid BoardDTO boardDTO,               // 1. 클라이언트로부터 입력받은 게시글 데이터 + 유효성 검사 진행
            BindingResult bindingResult,             // 2. @Valid 검증 결과를 담는 객체 (오류 발생 시 여기 저장됨)
            RedirectAttributes redirectAttributes,   // 3. 리다이렉트할 때 데이터를 임시 저장하는 객체
            HttpSession session) {                   // 4. 로그인한 사용자 정보를 꺼내기 위해 세션 사용

        log.info("registerPOST 호출: {}", boardDTO);

        // 1단계: 입력 검증
        if (bindingResult.hasErrors()) { // 유효성 검사 실패하면
            log.warn("검증 오류 발생: {}", bindingResult.getAllErrors());

            // 검증 실패 정보를 flash 영역에 저장
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            // 다시 등록폼으로 이동
            return "redirect:/board/register";
        }

        // 2단계: 작성자 정보 세팅
        UserVO loginUser = (UserVO) session.getAttribute("loginUser"); // 세션에서 로그인한 사용자 가져오기
        if (loginUser != null) {
            boardDTO.setWriter(loginUser.getUname()); // 작성자(writer) 필드에 로그인 사용자 이름 넣기
        }

        // 3단계: 정상 등록 처리
        BoardVO boardVO = modelMapper.map(boardDTO, BoardVO.class);
        boardService.register(boardVO);

        // 4단계: 등록 성공 메시지 전달
        redirectAttributes.addFlashAttribute("msg", "등록이 완료되었습니다.");

        // 5단계: 게시판 목록으로 리다이렉트
        return "redirect:/board/list";
    }

    @GetMapping("/modify")
    public String modifyGet(@RequestParam("bno") Long bno, Model model, RedirectAttributes redirectAttributes) {
        log.info("modify GET 요청 수신 - bno: {}", bno);

        // 1. 글 번호로 게시글 데이터 조회
        BoardVO boardVO = boardService.getOne(bno);

        // 2. 조회 결과가 없는 경우 예외 처리
        if (boardVO == null) {
            log.warn("수정할 게시글을 찾을 수 없음. bno: {}", bno);
            redirectAttributes.addFlashAttribute("msg", "존재하지 않는 게시글입니다.");
            return "redirect:/board/list";  // 목록으로 이동
        }

        // 3. 조회 결과가 있을 때
        BoardDTO boardDTO = modelMapper.map(boardVO, BoardDTO.class);
        model.addAttribute("boardDTO", boardDTO);


        return "board/modify";  // 수정 폼 페이지로 이동
    }

    @PostMapping("/modify")
    public String modifyPOST(
            @Valid BoardDTO boardDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            HttpSession session) {

        log.info("modifyPOST");
        log.info("수정할 데이터: {}", boardDTO);

        if (bindingResult.hasErrors()) {
            log.info("검증 오류 발생: {}", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addAttribute("bno", boardDTO.getBno());
            return "redirect:/board/modify";
        }

        // 1. DTO → VO 변환
        BoardVO boardVO = modelMapper.map(boardDTO, BoardVO.class);

        // 2. Service 호출 + 결과 받기
        boolean result = boardService.modify(boardVO);

        // 3. 결과에 따라 메시지 처리
        if (result) {
            redirectAttributes.addFlashAttribute("msg", "수정이 완료되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("msg", "수정에 실패했습니다.");
        }

        return "redirect:/board/list";
    }

    @PostMapping("/delete")
    public String deletePost(@RequestParam("bno") Long bno,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) {

        log.info("삭제 요청 bno: {}", bno);

        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
        BoardVO boardVO = boardService.getOne(bno);

        if (loginUser == null || !loginUser.getUname().equals(boardVO.getWriter())) {
            redirectAttributes.addFlashAttribute("msg", "작성자만 삭제할 수 있습니다.");
            return "redirect:/board/list";
        }

        // Service 호출 + 결과 받기
        boolean result = boardService.remove(bno);

        if (result) {
            redirectAttributes.addFlashAttribute("msg", "삭제가 완료되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("msg", "삭제에 실패했습니다.");
        }

        return "redirect:/board/list";
    }
}
