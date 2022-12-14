<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="email" scope="request" type="java.lang.String"/>
<html>
<head>
    <style>
        <%@include file="/css/forgetPassword.css" %>
    </style>
    <title>Web App</title>
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/public/imgs/login/logo.svg"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class=java.lang.String"container">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card my-5">
                <form class="card-body cardbody-color p-lg-5" method="post">

                    <div class="text-center">
                        <img src="https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295397__340.png"
                             class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
                             width="200px" alt="profile">
                    </div>
                    <div class="mb-3">
                        <input type="text" class="form-control" id="Email" name="Email" value="${email}" hidden>
                    </div>
                    <div class="mb-3">
                        <input type="password" class="form-control" id="NewPassword" name="NewPassword"
                               aria-describedby="emailHelp"
                               placeholder="Mật khẩu mới">
                    </div>
                    <div class="mb-3">
                        <input type="password" class="form-control" id="ConfirmPassword" name=""
                               placeholder="Xác nhận mật khẩu">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-color px-5 mb-5 w-100">Xác nhận</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
</body>
</html>