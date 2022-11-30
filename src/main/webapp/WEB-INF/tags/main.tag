<%@ tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Web App</title>
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/public/imgs/login/logo.svg"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <!-- Latest compiled and minified JavaScript -->

    <link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,400italic,700italic,300italic,300' rel='stylesheet' type='text/css'>
    <style><%@include file="/css/styleMain.css"%></style>
    <style><%@include file="/css/footer.css"%></style>

    <jsp:invoke fragment="css"/>

</head>
<body>
<jsp:include page="../../views/partials/menu.jsp"/>
<jsp:doBody/>

<footer class="footer-16371" style="background-color: #f0cbc7">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9 text-center">
                <div class="footer-site-logo mb-4">
                   <a href="${pageContext.request.contextPath}/Home/Index"> <img src="${pageContext.request.contextPath}/public/imgs/login/logo.svg" alt="logo" class="logo"></a>
                </div>
                <ul class="list-unstyled nav-links mb-5">
                    <li><a href="#">Giới thiệu về chúng tôi</a></li>
                    <li><a href="#">Dịch vụ</a></li>
                    <li><a href="${pageContext.request.contextPath}/Account/Recharge">Hướng dẫn nạp tiền</a></li>
                    <li><a href="#">Hỏi đáp</a></li>
                    <li><a href="#">Liên hệ</a></li>
                </ul>

                <div class="social mb-4">
                    <h3>Liên lạc với chúng tôi qua</h3>
                    <ul class="list-unstyled">
                        <li class="in"><a href="#"><i class="bi bi-instagram"></i></a></li>
                        <li class="fb"><a href="#"><i class="bi bi-facebook"></i></a></li>
                        <li class="tw"><a href="#"><i class="bi bi-twitter"></i></a></li>
                        <li class="pin"><a href=""><i class="bi bi-pinterest"></i></a></li>
                    </ul>
                </div>

                <div class="copyright">
                    <p class="mb-0"><small>&copy; Colorlib. Đã đăng ký bản quyền.</small></p>
                </div>
            </div>
        </div>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
        integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
        crossorigin="anonymous"></script>
<jsp:invoke fragment="js"/>
</body>

</html>