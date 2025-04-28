<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${empty loginUser}">
    <c:redirect url="/user/login"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>

    <!-- CSS -->
    <link href="${pageContext.request.contextPath}/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body id="page-top">

<!-- 전체 Wrapper -->
<div id="wrapper">

    <!-- ✅ 사이드바 -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/user/userlist">
            <div class="sidebar-brand-icon">
                😃
            </div>
            <div class="sidebar-brand-text mx-3">ADMIN</div>
        </a>

        <hr class="sidebar-divider my-0">

        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/user/userlist">
                <i class="fas fa-user"></i>
                <span>User</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/board/list">
                <i class="fas fa-clipboard"></i>
                <span>Board</span>
            </a>
        </li>

        <hr class="sidebar-divider d-none d-md-block">

        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
    </ul>
    <!-- ✅ 사이드바 끝 -->

    <!-- ✅ Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- ✅ Main Content -->
        <div id="content">

            <!-- ✅ Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown">
                            <i class="fas fa-bell fa-fw"></i>
                            <span class="badge badge-danger badge-counter">3+</span>
                        </a>
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">ALERTS CENTER</h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-primary">
                                        <i class="fas fa-file-alt text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    <div class="small text-gray-500">December 12, 2019</div>
                                </div>
                            </a>
                        </div>
                    </li>

                    <!-- Messages -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown">
                            <i class="fas fa-envelope fa-fw"></i>
                            <span class="badge badge-danger badge-counter">7</span>
                        </a>
                        <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                            <h6 class="dropdown-header">MESSAGE CENTER</h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img class="rounded-circle" src="https://source.unsplash.com/random/50x50">
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div class="font-weight-bold">
                                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                                </div>
                            </a>
                        </div>
                    </li>

                    <!-- User Info -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginUser.uname}</span>
                            <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/static/img/man.png">
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile</a>
                            <a class="dropdown-item" href="#"><i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings</a>
                            <a class="dropdown-item" href="#"><i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity Log</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/user/logout"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout</a>
                        </div>
                    </li>

                </ul>

            </nav>

            <!-- ✅ 페이지 내용 -->
            <div class="container-fluid mt-4">
                <h1 class="h3 mb-2 text-gray-800">User Management</h1>
                <p class="mb-4">Registered user list</p>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">User List Table</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Email</th>
                                    <th>Name</th>
                                    <th>Registered Date</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${userList}">
                                    <tr>
                                        <td>${user.useq}</td>
                                        <td>${user.uemail}</td>
                                        <td>${user.uname}</td>
                                        <td>${user.regdate}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

<!-- ✅ JS 스크립트 -->
<script src="${pageContext.request.contextPath}/static/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/sb-admin-2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/static/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTable').DataTable();
    });
</script>
</body>
</html>
