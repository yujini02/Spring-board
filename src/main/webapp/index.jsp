<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>DramaFilm Community</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/sb-admin-2.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="/static/css/custom.css">
</head>

<body>
<!-- ✅ Header -->
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container-fluid">
        <!-- 로고 -->
        <a class="navbar-brand font-weight-bold text-primary" href="#">
            🎬 TVnFilm
        </a>

        <!-- 검색창 + 버튼 영역 전체 -->
        <div class="d-flex align-items-center ml-auto">
            <!-- 검색창 -->
            <form class="form-inline mr-3" action="${pageContext.request.contextPath}/search" method="get">
                <input class="form-control mr-2" type="search" name="keyword" placeholder="드라마/영화 검색">
                <button class="btn btn-outline-primary">검색</button>
            </form>

            <!-- ✅ 로그인 & 회원가입 버튼 -->
            <a href="${pageContext.request.contextPath}/user/login" class="btn btn-outline-dark btn-sm mr-2">로그인</a>
            <a href="${pageContext.request.contextPath}/user/signup" class="btn btn-primary btn-sm">회원가입</a>
        </div>
    </div>
</nav>

<!-- ✅ Main Section -->
<div class="container mt-5">

    <!-- 🎞️ Carousel -->
    <div class="carousel-wrapper">
        <div id="mainCarousel" class="carousel slide mb-5" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="static/img/PokssakSogassuda.png" class="main-banner-img" alt="폭싹 속았수다">
                </div>
                <div class="carousel-item">
                    <img src="static/img/DaehwanjangGianjang.png" class="main-banner-img" alt="기안장">
                </div>
            </div>

            <!-- 좌우 컨트롤 -->
            <a class="carousel-control-prev" href="#mainCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            </a>
            <a class="carousel-control-next" href="#mainCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
            </a>
        </div>
    </div>

    <!-- 📌 최신 리뷰 섹션 -->
    <h4 class="text-dark mb-3">📢 최신 리뷰</h4>
    <div class="row">
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">[폭싹 속았수다] 눈물샘 폭발...</h5>
                    <p class="card-text">배우들 연기력에 소름... 시즌2 기대!</p>
                    <p class="text-muted small">by 민윤기</p>
                </div>
            </div>
        </div>
        <!-- 반복 -->
    </div>

    <!-- 💡 인기 게시글 -->
    <h4 class="mt-5 text-dark">🔥 인기 게시글</h4>
    <ul class="list-group">
        <li class="list-group-item d-flex justify-content-between align-items-center">
            예능 <b>대환장 기안장</b> 재미짐!
            <span class="badge badge-primary badge-pill">125</span>
        </li>
    </ul>
</div>

<!-- ✅ Footer -->
<footer class="bg-light text-center text-muted py-3 mt-5">
    © 2025 DramaFilm Community | 이용약관 | 개인정보처리방침
</footer>

<script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>