<%-- Created by IntelliJ IDEA. User: yj --%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Login</title>

  <!-- Custom fonts for this template-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/vendor/fontawesome-free/css/all.min.css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,600,700,800,900" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/sb-admin-2.min.css">
</head>

<body class="bg-gradient-primary">

<div class="container d-flex align-items-center justify-content-center min-vh-100">
  <div class="row w-100 justify-content-center">
    <div class="col-lg-6">
      <div class="card o-hidden border-0 shadow-lg">
        <div class="card-body p-0">
          <div class="p-5">
            <div class="text-center">
              <h1 class="h4 text-gray-900 mb-4">Login</h1>
            </div>
            <form id="loginForm" class="user" method="post" action="/user/login" novalidate>
              <div class="form-group">
                <input type="email" id="email" name="uemail" class="form-control form-control-user"
                       placeholder="Enter Email Address..." autocomplete="off" required>
                <div id="emailError" class="error_text" style="display: none; color: red;">Please enter your email address.</div>
              </div>
              <div class="form-group">
                <input type="password" id="password" name="upwd" class="form-control form-control-user" placeholder="Password" autocomplete="off" required>
                <div id="passwordError" class="error_text" style="color: red; display: none;">Please enter your password.</div>
              </div>
              <div class="form-group">
                <div class="custom-control custom-checkbox small">
                  <input type="checkbox" class="custom-control-input" id="customCheck">
                  <label class="custom-control-label" for="customCheck">Remember Me</label>
                </div>
              </div>
              <button type="submit" class="btn btn-primary btn-user btn-block">Login</button>
              <hr>
              <a href="index.html" class="btn btn-google btn-user btn-block">
                <i class="fab fa-google fa-fw"></i> Login with Google
              </a>
            </form>
            <hr>
            <div class="text-center">
              <a class="small" href="forgot-password.html">Forgot Password?</a>
            </div>
            <div class="text-center">
              <a class="small" href="${pageContext.request.contextPath}/user/signup">Create an Account!</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/jquery-easing/jquery.easing.js"></script>
<script src="${pageContext.request.contextPath}/static/js/sb-admin-2.js"></script>
<script src="${pageContext.request.contextPath}/static/js/login-validation.js"></script>

</body>
</html>