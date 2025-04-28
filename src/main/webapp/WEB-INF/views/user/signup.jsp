<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/vendor/fontawesome-free/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,600,700,800,900" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/static/css/sb-admin-2.min.css" rel="stylesheet" />

</head>
<!-- 전체 페이지 배경과 중앙 정렬을 위한 클래스 설정 -->
<body class="bg-gradient-primary min-vh-100 d-flex align-items-center justify-content-center">
<!-- 전체 컨테이너: 화면 중앙에 카드 박스 정렬 -->
<div class="container min-vh-100 d-flex align-items-center justify-content-center">
    <!-- 카드 UI 박스 (회원가입 폼이 들어갈 영역) -->
    <div class="card shadow-lg border-0 w-100" style="max-width: 850px;">
        <div class="card-body d-flex justify-content-center">
            <!-- 폼 콘텐츠를 감싸는 내부 div -->
            <div class="p-5" style="max-width: 700px; width: 100%;">
                <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Create an Account</h1>
                </div>
                <!-- 회원가입 폼 시작 -->
                <form id="registerForm" class="user" method="post" action="/user/signup" novalidate>
                    <!-- 이름 입력 필드 -->
                    <div class="form-group">
                        <input type="text" class="form-control form-control-user" id="uname" name="uname" required
                               placeholder="Your Name">
                        <div id="unameError" class="error_text" style="display: none; color: red;">Please enter your name.</div>
                    </div>
                    <!-- 이메일 입력 필드 -->
                    <div class="form-group">
                        <input type="email" class="form-control form-control-user" id="email" name="uemail"
                               placeholder="Email Address" autocomplete="off">
                        <div id="emailError" class="error_text" style="display: none; color: red;">Please enter your email address.</div>
                    </div>
                    <!-- 비밀번호 입력 필드 -->
                    <div class="form-group">
                        <input type="password" id="password" name="upwd" class="form-control form-control-user" required placeholder="Please enter your password">
                        <div id="passwordError" class="error_text" style="display: none; color: red;">Password error</div>
                    </div>
                    <!-- 비밀번호 확인 입력 필드 -->
                    <div class="form-group">
                        <input type="password" id="confirmPassword" name="confirmPwd" class="form-control form-control-user" required placeholder="Please enter your confirmpassword">
                        <div id="confirmError" class="error_text" style="display: none; color: red;">Password confirmation error</div>
                    </div>
                    <!-- 제출 버튼 -->
                    <button type="submit" class="btn btn-primary btn-user btn-block mb-4">Register Account</button>
                    <!-- 회원가입 폼 끝 -->
                </form>
                <hr>
                <div class="text-center">
                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                </div>
                <div class="text-center">
                    <a class="small" href="${pageContext.request.contextPath}/user/login">Already have an account? Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery (필수 라이브러리) -->
<script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.js"></script>
<!-- 부트스트랩 JS (버튼, 모달 등 인터랙션용) -->
<script src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jQuery easing 플러그인 (애니메이션 효과) -->
<script src="${pageContext.request.contextPath}/static/vendor/jquery-easing/jquery.easing.js"></script>

<!-- SB Admin2 템플릿 전용 JS -->
<script src="${pageContext.request.contextPath}/static/js/sb-admin-2.js"></script>
<!-- 사용자 정의 유효성 검사 스크립트 -->
<script src="${pageContext.request.contextPath}/static/js/register-validation.js"></script>

</body>

</html>
