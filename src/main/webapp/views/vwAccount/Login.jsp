<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Web App</title>
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/public/imgs/login/logo.svg"/>
    <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <style>
        <%@include file="../../css/login.css" %>
    </style>
</head>
<body>
<main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
        <div class="card login-card">
            <div class="row no-gutters">
                <div class="col-md-5">
                    <img src="${pageContext.request.contextPath}/public/imgs/login/login.jpg" alt="login"
                         class="login-card-img">
                </div>
                <div class="col-md-7">
                    <div class="card-body">
                        <a class="brand-wrapper" href="${pageContext.request.contextPath}/Home">
                            <img src="${pageContext.request.contextPath}/public/imgs/login/logo.svg" alt="logo"
                                 class="logo">
                        </a>
                        <p class="login-card-description">Đăng nhập tài khoản của bạn</p>
                        <c:if test="${hasError}">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <strong>Đăng nhập không thành công! </strong><br/> ${errorMessage}
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">x</span>
                                </button>
                            </div>
                        </c:if>
                        <form action="" method="post" id="frmLogin">
                            <div class="form-group">
                                <label for="txtUsername" class="sr-only">Tên đăng nhập</label>
                                <input type="text" name="username" id="txtUsername" class="form-control"
                                       placeholder="Tên đăng nhập">
                            </div>
                            <div class="form-group mb-4">
                                <label for="txtPassword" class="sr-only">Mật khẩu</label>
                                <input type="password" name="password" id="txtPassword" class="form-control"
                                       placeholder="***********">
                            </div>
                            <input name="login" id="login" class="btn btn-block login-btn mb-4" type="submit"
                                   value="Đăng nhập">
                        </form>
                        <a href="#" class="forgot-password-link" data-toggle="modal" data-target="#forgetPassword">Bạn
                            quên mật khẩu? </a>
                        <!-- Modal -->
                        <div class="modal fade" id="forgetPassword" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Quên mật khẩu</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Hãy nhập Email tài khoản để lấy lại mật khẩu</p>
                                        <form method="post" id="frmSendEmail">
                                            <div class="form-group ">
                                                <label for="inputEmail" class="sr-only">Email</label>
                                                <input type="email" class="form-control" name="email" id="inputEmail"
                                                       placeholder="Email">
                                            </div>
                                            <button type="submit" class="btn btn-primary mb-2">Tiếp theo</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="login-card-footer-text">Bạn chưa có tài khoản? <a
                                href="${pageContext.request.contextPath}/Account/Register" class="text-reset">Đăng ký ở
                            đây</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
    $('#frmSendEmail').on('submit', function (e) {
        e.preventDefault();
        const email = $('#inputEmail').val();

        if (email.length === 0) {
            alert('Email không hợp lệ.')
            return;
        }

        $.getJSON('${pageContext.request.contextPath}/Account/IsAvailableSendEmail?email=' + email, function (data1) {//Kiểm tra UserName có tồn tại không
            if (data1 === false) {
                $('#frmSendEmail').off('submit').submit();
            } else {
                alert('Không tồn tại tài khoản đã đăng ký Email này.');
            }
        });


    });
</script>
<script>
    $('#frmLogin').on('submit', function (e) {
        e.preventDefault();
        const username = $('#txtUsername').val(); //Gán vào biến username
        const password = $('#txtPassword').val();
        if (username.length === 0) {
            alert('Tên đăng nhập không hợp lệ.')//Nếu không có username thì sẽ hiện thông báo
            return;
        }
        if (password.length === 0) {
            alert('Mật khẩu không hợp lệ.')
            return;
        }

        $('#frmLogin').off('submit').submit();

    });
</script>
</body>
</html>
