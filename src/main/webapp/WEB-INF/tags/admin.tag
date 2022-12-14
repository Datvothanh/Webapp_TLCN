<%@ tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin</title>
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/public/imgs/login/logo.svg"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <style>
        <%@include file="/css/styleAdmin.css" %>
    </style>
    <jsp:invoke fragment="css"/>

</head>
<body id="body-pd">
<header class="header" id="header">
    <div class="header_toggle"><i class='bx bx-menu' id="header-toggle"></i></div>
</header>
<div class="l-navbar" id="nav-bar">
    <nav class="nav">
        <div>
            <a href="#" class="nav_logo"> <i class="bi bi-house-fill"></i> <span class="nav_logo-name">Admin</span></a>
            <div class="nav_list">
                <a href="${pageContext.request.contextPath}/Admin/Statistical" class="nav_link active">
                    <i class="bi bi-bar-chart"></i> <span class="nav_name">Thống kê</span> </a>
                <a href="${pageContext.request.contextPath}/Admin/Product/" class="nav_link active">
                    <i class="bi bi-box-seam"></i> <span class="nav_name">Sản phẩm</span> </a>
                <a href="${pageContext.request.contextPath}/Admin/Permission/" class="nav_link"> <i
                        class='bx bx-user nav_icon'></i> <span class="nav_name">Người dùng</span> </a>
                <a href="${pageContext.request.contextPath}/Admin/Category/" class="nav_link"> <i
                        class="bi bi-three-dots-vertical"></i> <span class="nav_name">Loại sản phẩm</span> </a>
                <a href="${pageContext.request.contextPath}/Admin/GroupCategory/" class="nav_link"> <i
                    class="bi bi-menu-button-wide"></i> <span class="nav_name">Nhóm loại sản phẩm</span> </a>
                <a href="${pageContext.request.contextPath}/Admin/Product/End" class="nav_link"> <i class="bi bi-alarm"></i> <span class="nav_name">Sản phẩm kết thúc</span> </a>
            </div>
        </div>
        <form id="frmLogout" method="post"
              action="${pageContext.request.contextPath}/Account/Logout">
        <a href="javascript:$('#frmLogout').submit()" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span
                class="nav_name">Đăng xuất</span> </a>
        </form>
    </nav>
</div>
<!--Container Main start-->
<div class="height-100 bg-light">
    <jsp:doBody/>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
        integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
        crossorigin="anonymous"></script>
<jsp:invoke fragment="js"/>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function (event) {

        const showNavbar = (toggleId, navId, bodyId, headerId) => {
            const toggle = document.getElementById(toggleId),
                nav = document.getElementById(navId),
                bodypd = document.getElementById(bodyId),
                headerpd = document.getElementById(headerId)

// Validate that all variables exist
            if (toggle && nav && bodypd && headerpd) {
                toggle.addEventListener('click', () => {
// show navbar
                    nav.classList.toggle('show')
// change icon
                    toggle.classList.toggle('bx-x')
// add padding to body
                    bodypd.classList.toggle('body-pd')
// add padding to header
                    headerpd.classList.toggle('body-pd')
                })
            }
        }

        showNavbar('header-toggle', 'nav-bar', 'body-pd', 'header')

        /*===== LINK ACTIVE =====*/
        const linkColor = document.querySelectorAll('.nav_link')

        function colorLink() {
            if (linkColor) {
                linkColor.forEach(l => l.classList.remove('active'))
                this.classList.add('active')
            }
        }

        linkColor.forEach(l => l.addEventListener('click', colorLink))


        // Your code to run since DOM is loaded and ready
    });
    setInterval(function () {
        $.getJSON('${pageContext.request.contextPath}/Account/Event');
    }, 5000)

</script>

</body>


<%--<!-- jQuery CDN - Slim version (=without AJAX) -->--%>
<%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>--%>
<%--<!-- Popper.JS -->--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>--%>
<%--<!-- Bootstrap JS -->--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>--%>
<%--<jsp:invoke fragment="js"/>--%>

</html>