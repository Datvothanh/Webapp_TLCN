<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng Ký </title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"
          integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <style><%@include file="../../css/login.css"%></style>
</head>
<body>
<main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
        <div class="card login-card">
            <div class="row no-gutters">
                <div class="col-md-5">
                    <img src="${pageContext.request.contextPath}/public/imgs/register/register.jpg" alt="login" class="login-card-img">
                </div>
                <div class="col-md-7">
                    <div class="card-body">
                        <a class="brand-wrapper" href="${pageContext.request.contextPath}/Home">
                            <img src="${pageContext.request.contextPath}/public/imgs/login/logo.svg" alt="logo" class="logo">
                        </a>
                        <p class="login-card-description">Đăng ký tài khoản mới</p>
                        <form action="" method="post" id="frmRegister">
                                    <div class="form-group ">
                                        <label for="txtName">Tên</label>
                                        <input type="text" class="form-control" id="txtName" name="name">
                                    </div>

                                   <div class="form-group mb-4">
                                   <label for="txtUsername">Tên đăng nhập</label>
                                    <input type="text" class="form-control" id="txtUsername" name="username">
                                  </div>
                                   <div class="form-group mb-4">
                                <label for="txtPassword">Mật khẩu</label>
                                <input type="password" class="form-control" id="txtPassword" name="rawpwd">
                            </div>
                                   <div class="form-group mb-4">
                                <label for="txtConfirm">Xác nhận mật khẩu</label>
                                <input type="password" class="form-control" id="txtConfirm">
                            </div>
                                    <div class="form-group mb-4">
                                        <label for="txtAddress">Địa chỉ</label>
                                        <input type="text" class="form-control" id="txtAddress" name="address">
                                    </div>
                                    <div class="form-group mb-4">
                                        <label for="txtPhone">Số điện thoại</label>
                                        <input type="text" class="form-control" id="txtPhone" name="phone">
                                    </div>
                                    <div class="form-group mb-4">
                                        <label for="txtEmail">Email</label>
                                        <input type="text" class="form-control" id="txtEmail" name="email">
                                    </div>
                                    <div class="form-group mb-4">
                                        <label for="txtDOB">Ngày tháng năm sinh</label>
                                        <input type="text" class="form-control" id="txtDOB" name="dob">
                                    </div>
                                    <p style="color:red;">${errorString}</p>
                                    <!-- reCAPTCHA -->
                                    <div class="g-recaptcha mb-4"
                                         data-sitekey="6LeFJUohAAAAAJ10jCCry_R9zXg4s97vx3N8u1xD">

                                    </div>
                            <input class="btn btn-block login-btn mb-4" name="register" id="register" type="submit" value="Đăng ký">
                        </form>
                        <p class="login-card-footer-text">Bạn đã sẵn sàng đăng nhập ? <a href="${pageContext.request.contextPath}/Account/Login" class="text-reset">Đăng nhập ở đây</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- <div class="card login-card">
          <img src="assets/images/login.jpg" alt="login" class="login-card-img">
          <div class="card-body">
            <h2 class="login-card-title">Login</h2>
            <p class="login-card-description">Sign in to your account to continue.</p>
            <form action="#!">
              <div class="form-group">
                <label for="email" class="sr-only">Email</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="Email">
              </div>
              <div class="form-group">
                <label for="password" class="sr-only">Password</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Password">
              </div>
              <div class="form-prompt-wrapper">
                <div class="custom-control custom-checkbox login-card-check-box">
                  <input type="checkbox" class="custom-control-input" id="customCheck1">
                  <label class="custom-control-label" for="customCheck1">Remember me</label>
                </div>
                <a href="#!" class="text-reset">Forgot password?</a>
              </div>
              <input name="login" id="login" class="btn btn-block login-btn mb-4" type="button" value="Login">
            </form>
            <p class="login-card-footer-text">Don't have an account? <a href="#!" class="text-reset">Register here</a></p>
          </div>
        </div> -->
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"
        integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
<script>
    $('#frmRegister').on('submit', function (e) {
        e.preventDefault();
        const username = $('#txtUsername').val(); //Gán vào biến username
        const password = $('#txtPassword').val();
        const passwordConfirm = $('#txtConfirm').val();
        const address = $('#txtAddress').val();
        const email = $('#txtEmail').val();
        const dob = $('#txtDOB').val();
        const name = $('#txtName').val();
        const phone = $('#txtPhone').val();
        if (username.length === 0) {
            alert('Tên đăng nhập không hợp lệ.')//Nếu không có username thì sẽ hiện thông báo
            return;
        }
        if (password.length === 0) {
            alert('Mật khẩu không hợp lệ.')
            return;
        }
        if (passwordConfirm.length === 0) {
            alert('Xác nhận mật khẩu không hợp lệ.')
            return;
        }
        if (name.length === 0) {
            alert('Tên không hợp lệ.')
            return;
        }
        if (dob.length === 0) {
            alert('Ngày tháng năm sinh không hợp lệ.')
            return;
        }
        if (email.length === 0) {
            alert('Email không hợp lệ.')
            return;
        }
        if (address.length === 0) {
            alert('Địa chỉ không hợp lệ.')
            return;
        }
        if (phone.length === 0) {
            alert('Số điện thoại không hợp lệ.')
            return;
        }
        if (password !== passwordConfirm) {
            alert('Xác nhận mật khẩu chưa đúng.')
            return;
        }

        //Thêm các điều kiện khi đăng ký tài khoản


        $.getJSON('${pageContext.request.contextPath}/Account/IsAvailableUserName?user=' + username, function (data1) {//Kiểm tra UserName có tồn tại không
            if (data1 === true) {
                $.getJSON('${pageContext.request.contextPath}/Account/IsAvailableEmail?email=' + email, function (data) {//Kiểm tra UserName có tồn tại không
                    if (data === true) {
                        $('#frmRegister').off('submit').submit();
                    } else {
                        alert('Email đã tồn tại.');
                    }
                });
            } else {
                alert('Tên đăng nhập đã tồn tại.');
            }
        });


    });
    $('#txtDOB').datetimepicker({
        format: 'd/m/Y',
        timepicker: false,
        mask: true
    });

    $('#txtUsername').select(); // Mạnh hơn autofocus
</script>
</body>
</html>
