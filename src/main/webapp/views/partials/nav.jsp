<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<script>
    function SearchFunction(){
        let txtSr = document.getElementById("txtSr").value;
        if(txtSr !== "")
        window.location.href="${pageContext.request.contextPath}/Product/ProSearch?txtSr="+txtSr;
    }



</script>
<style>
    .topbar-123{
        position: sticky;
        top: 0;
        z-index: 100;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light shadow topbar-123">

    <a class="navbar-brand" href="${pageContext.request.contextPath}/Home/Index">
        <i class="fa fa-home fa-2x" aria-hidden="true"></i>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/Home/Index">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" id="txtSr" name="txtSr" aria-label="Search">
            <button onclick="SearchFunction()" class="btn btn-outline-success my-2 my-sm-0" type="button"><i
                    class="fa fa-search" aria-hidden="true"></i>&nbsp;Search</button>
        </form>
    </div>

    <ul class="navbar-nav mr-auto">
        <c:choose>
            <c:when test="${auth}">
                <c:if test="${authUser.permission != 0}">
                    Money:${authUser.money} - MoneyAu:${authUser.moneyAu}
    
                </c:if>
                <form id="frmLogout" method="post" action="${pageContext.request.contextPath}/Account/Logout"></form>

                <img src="${pageContext.request.contextPath}/public/imgs/avatar/user.png" alt="Avatar" class="avatar">

                <style>
                    .avatar {
                        vertical-align: middle;
                        width: 50px;
                        height: 50px;
                        border-radius: 50%;
                    }
                </style>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownR" role="button"
                       data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        Hi, <b>${authUser.name}!</b>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/Account/Profile">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            Profile
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:$('#frmLogout').submit()">
                            <i class="fa fa-sign-out" aria-hidden="true"></i>
                            Sign Out
                        </a>
                    </div>
                </li>
            </c:when>
            <c:otherwise>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Account/Register">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Account/Login">Login</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>

