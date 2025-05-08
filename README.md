# 📋 Spring Board Project

Spring Framework 기반의 로그인 + 게시판 구현 프로젝트입니다.  
회원가입, 로그인, 게시글 CRUD 기능을 포함하며 MVC 패턴과 MyBatis를 사용해 구성했습니다.

---

## 🧱 Tech Stack

- **Java 11**
- **Spring Framework (MVC)**
- **MyBatis**
- **Gradle**
- **JSP** 
- **MySQL**

---

## ✨ Features

- 회원가입 및 로그인 (세션 기반 인증)
- 게시글 목록 조회 (페이징)
- 게시글 등록, 수정, 삭제 (CRUD)
- 게시글 상세 조회
- 게시글 작성자 권한 확인
- [ ] 댓글 기능 (추가 예정)

---

## 📁 프로젝트 구조
src/
├── main/
│   ├── java/
│   │   └── com/example/board/
│   │       ├── controller/       # 요청을 받아서 처리하는 컨트롤러
│   │       ├── service/          # 비즈니스 로직 처리
│   │       ├── dao/              # DB 접근 객체 (인터페이스)
│   │       ├── mapper/           # MyBatis 매퍼 인터페이스
│   │       └── vo/               # Value Object (게시글, 회원 등)
│   │
│   ├── resources/
│   │   ├── mapper/BoardMapper.xml  # 게시판 관련 SQL 정의
│   │   └── application.properties  # DB 연결 설정 등 환경 설정
│   │
│   └── webapp/
│       └── WEB-INF/
│           └── views/            # JSP 파일들 (list.jsp, read.jsp 등)
│
├── build.gradle                  # Gradle 빌드 설정
└── settings.gradle               # 프로젝트 세팅
