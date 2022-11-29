<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="email" scope="request" type="java.lang.String"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Web App</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <style><%@include file="/css/otp.css"%></style>
</head>
<body>
<div class="container height-100 d-flex justify-content-center align-items-center">
    <c:if test="${hasError}">
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                ${errorMessage}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">x</span>
            </button>
        </div>
    </c:if>
    <div class="position-relative">
        <div class="card p-2 text-center">
            <a class="brand-wrapper" href="${pageContext.request.contextPath}/Account/Login">
                <img src="${pageContext.request.contextPath}/public/imgs/login/logo.svg" alt="logo" class="logo">
            </a>
            <h6>Vui lòng nhập mật mã OTP<br> để xác nhận tài khoản</h6>
            <div> <span>Một mã đã OTP được gửi đến</span> <small>${email}</small> </div>
            <form method="post">
            <div id="otp"  class="inputs d-flex flex-row justify-content-center mt-2">
                <input class="m-2 text-center form-control rounded" name="1" type="text" id="first" maxlength="1" />
                <input class="m-2 text-center form-control rounded" name="2" type="text" id="second" maxlength="1" />
                <input class="m-2 text-center form-control rounded" name="3" type="text" id="third" maxlength="1" />
                <input class="m-2 text-center form-control rounded" name="4" type="text" id="fourth" maxlength="1" />
                <input class="m-2 text-center form-control rounded" name="5" type="text" id="fifth" maxlength="1" />
                <input class="m-2 text-center form-control rounded" name="6" type="text " id="sixth" maxlength="1" />
            </div>
            <div class="mt-4"> <button type="submit" class="btn btn-danger px-4 validate">Xác nhận</button> </div>
            </form>
        </div>
    </div>
    <p id="demo">
</div>
<%--<div class="container-fluid h-100">--%>
<%--    <div class="row h-100 justify-content-center align-items-center">--%>
<%--        <div class="col-sm-4">--%>
<%--            <c:if test="${hasError}">--%>
<%--                <div class="alert alert-warning alert-dismissible fade show" role="alert">--%>
<%--                    ${errorMessage}--%>
<%--                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">--%>
<%--                        <span aria-hidden="true">x</span>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </c:if>--%>
<%--            <form action="" method="post">--%>
<%--                <div class="form-group">--%>
<%--                    <label class="sr-only" for="txtCode">Mã OTP</label>--%>
<%--                    <div class="input-group">--%>
<%--                        <input type="text" class="from-control form-control-lg " id="txtCode"--%>
<%--                               placeholder="Nhập mã OTP"--%>
<%--                               autofocus>--%>
<%--                        <div class="input-group-append">--%>
<%--                            <span class="input-group-text bg-white">--%>
<%--                                 <i class="bi bi-envelope"></i>--%>
<%--                            </span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div>--%>
<%--                    <button type="submit" class="btn btn-info btn-block">--%>
<%--                        <i class="fa fa-sign-in" aria-hidden="true"></i>--%>
<%--                        Nhập mã--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </form>--%>

<%--        </div>--%>
<%--    </div>--%>

<%--</div>--%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
        integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
        crossorigin="anonymous"></script>

</body>
</html>