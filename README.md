# 📋 Spring Board Project

Spring Framework 기반의 로그인 + 게시판 구현 프로젝트입니다.  
회원가입, 로그인, 게시글 CRUD 기능을 포함하며 MVC 패턴과 MyBatis를 사용해 구성했습니다.

---

## 🧱 Tech Stack

- **Java 11**
- **Spring Framework (MVC)**
- **MyBatis**
- **Gradle**
- **JSP / JSTL**
- **H2 / MySQL** (선택)

---

## ✨ Features

- [x] 회원가입 및 로그인 (세션 기반 인증)
- [x] 게시글 목록 조회 (페이징)
- [x] 게시글 등록, 수정, 삭제 (CRUD)
- [x] 게시글 상세 조회
- [x] 게시글 작성자 권한 확인
- [ ] 댓글 기능 (추가 예정)

---

## 📁 프로젝트 구조
src/
├── main/
│ ├── java/
│ │ └── com.example.board/
│ │ ├── controller/
│ │ ├── service/
│ │ ├── dao/
│ │ ├── mapper/
│ │ └── vo/
│ ├── resources/
│ │ └── mapper/BoardMapper.xml
│ └── webapp/
│ └── WEB-INF/views/
