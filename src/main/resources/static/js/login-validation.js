document.addEventListener("DOMContentLoaded", () => {
    const email = document.getElementById("email");
    const emailError = document.getElementById("emailError");

    const password = document.getElementById("password");
    const passwordError = document.getElementById("passwordError");

    const form = document.getElementById("loginForm");

    // 이메일 유효성 검사
    const validateEmail = () => {
        const emailValue = email.value.trim();
        const pattern = /^[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/i;

        if (emailValue === "") {
            emailError.textContent = "Please enter your email address.";
            emailError.style.display = "block";
            return false;
        } else if (!pattern.test(emailValue)) {
            emailError.textContent = "Please enter your valid email address.";
            emailError.style.display = "block";
            return false;
        } else {
            emailError.style.display = "none";
            return true;
        }
    };

    // 비밀번호 유효성 검사
    const validatePassword = () => {
        const passwordValue = password.value.trim();
        if (passwordValue === "") {
            passwordError.textContent = "Please enter your password.";
            passwordError.style.display = "block";
            return false;
        } else {
            passwordError.style.display = "none";
            return true;
        }
    };

    // 입력 중이면 에러 숨기기
    email.addEventListener("input", () => {
        emailError.style.display = "none";
    });

    password.addEventListener("input", () => {
        passwordError.style.display = "none";
    });

    // 제출 시 검증: 이메일 먼저 → 통과하면 비밀번호
    form.addEventListener("submit", (e) => {
        const emailValid = validateEmail();

        if (!emailValid) {
            e.preventDefault(); // 이메일 유효하지 않으면 즉시 막기
            return;
        }

        const passwordValid = validatePassword();
        if (!passwordValid) {
            e.preventDefault(); // 비밀번호도 유효해야 넘어감
        }
    });

});