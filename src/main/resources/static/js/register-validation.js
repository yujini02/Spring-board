// 문서 로드 완료 시 실행
document.addEventListener("DOMContentLoaded", () => {
    // 입력 요소 및 에러 메시지 요소 선택
    const uname = document.getElementById("uname");
    const unameError = document.getElementById("unameError");

    const password = document.getElementById("password");
    const passwordError = document.getElementById("passwordError");

    const confirmPassword = document.getElementById("confirmPassword");
    const confirmError = document.getElementById("confirmError");

    const email = document.getElementById('email');
    const emailError = document.getElementById("emailError");

    const form = document.getElementById("registerForm");

    // 에러 메시지를 표시하는 함수
    const showError = (element, message) => {
        element.style.display = "block";
        element.textContent = message;
    };

    // 에러 메시지를 숨기는 함수
    const hideError = (element) => {
        element.style.display = "none";
    };

    // 이름 유효성 검사
    const validateName = () => {
        const nameValue = uname.value.trim();
        if (nameValue === "") {
            unameError.textContent = "Please enter your name.";
            unameError.style.display = "block";
            return false;
        } else {
            unameError.style.display = "none";
            return true;
        }
    };

    // 이메일 형식 유효성 검사 (정규표현식으로 형식 확인)
    const validateEmailFormat = () => {
        const pattern = /^[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/i;
        if (pattern.test(email.value.trim())) {
            hideError(emailError);
            return true;
        } else {
            showError(emailError, "Please enter a valid email address.");
            return false;
        }
    };

    // 비밀번호 강도 체크 (영문+숫자+특수문자 포함, 8~15자)
    const checkPasswordStrength = () => {
        const pattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
        if (pattern.test(password.value)) {
            hideError(passwordError);
            return true;
        } else {
            showError(passwordError, "Password must be 8-15 characters, include letters, numbers, and special characters.");
            return false;
        }
    };

    // 비밀번호 일치 여부 확인
    const validatePasswordMatch = () => {
        if (password.value !== confirmPassword.value) {
            showError(confirmError, "Passwords do not match.");
            return false;
        } else {
            hideError(confirmError);
            return true;
        }
    };

    // 실시간 유효성 검사 이벤트 등록
    email.addEventListener("input", validateEmailFormat);
    password.addEventListener("input", () => {
        checkPasswordStrength();
        if (confirmPassword.value) validatePasswordMatch();
    });
    confirmPassword.addEventListener("input", validatePasswordMatch);

    // 폼 제출 시 전체 유효성 검사 후 하나라도 실패 시 제출 차단
    form.addEventListener("submit", (e) => {
        e.preventDefault(); // 기본 제출 동작 막기

        // 순차적으로 검사해서 하나라도 실패하면 중단
        if (!validateName()) return;
        if (!validateEmailFormat()) return;
        if (!checkPasswordStrength()) return;
        if (!validatePasswordMatch()) return;

        // 모든 조건을 통과하면 실제로 form 전송
        form.submit();
    });

});