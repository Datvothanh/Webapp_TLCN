<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Category>"/>
<jsp:useBean id="groupCategoriesWithDetails" scope="request"
             type="java.util.List<com.example.webapp_tlcn.beans.GroupCategory>"/>



<div class="container-fluid px-0">
    <nav class="navbar navbar-expand-md navbar-light bg-white p-0"><a class="navbar-brand mr-4"
                                                                      href="${pageContext.request.contextPath}/Home/Index">
        <img src="${pageContext.request.contextPath}/public/imgs/login/logo.svg" alt="logo" class="logo"></a>
        <button class="navbar-toggler mr-3" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <c:set var="test" value="0"/>
                <c:set var="stt" value="1"/>
                <c:forEach items="${groupCategoriesWithDetails}" var="g">
                    <li class="nav-item"><a class="nav-link" href="#" id="navbarDropdown${stt}" role="button"
                                            data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">${g.grCatName}<span
                            class="fa fa-angle-down"></span></a>
                        <div class="dropdown-menu" id="dropdown-menu${stt}" aria-labelledby="navbarDropdown${stt}">
                            <div class="container">
                                <div class="row">

                                    <c:forEach items="${categoriesWithDetails}" var="c">
                                        <c:if test="${c.grCatID == g.grCatID}">
                                            <div class="row d-flex tab">
                                                <a class="dropdown-item"
                                                   href="${pageContext.request.contextPath}/Product/ByCat?id=${c.catID}">
                                                    <c:if test="${c.catID == 27}">
                                                        <div class="fa-icon text-center"><span
                                                                class="fa fa-laptop" ></span></div>
                                                        <c:set var="test" value="1"/>
                                                    </c:if>
                                                    <c:if test="${c.catID == 28}">
                                                        <div class="fa-icon text-center"><span
                                                                class="fa fa-mobile"></span></div>
                                                        <c:set var="test" value="1"/>
                                                    </c:if>
                                                    <c:if test="${c.catID == 29}">
                                                        <div class="fa-icon text-center"><span
                                                                class="fa fa-television"></span></div>
                                                        <c:set var="test" value="1"/>
                                                    </c:if>
                                                    <c:if test="${c.catID == 30}">
                                                        <div class="fa-icon text-center"><span
                                                                class="bi bi-incognito" style="font-size: unset"></span></div>
                                                        <c:set var="test" value="1"/>
                                                    </c:if>
                                                    <c:if test="${c.catID == 31}">
                                                        <div class="fa-icon text-center" ><span
                                                                class="bi bi-watch " style="font-size: unset"></span></div>
                                                        <c:set var="test" value="1"/>
                                                    </c:if>
                                                    <c:if test="${c.catID == 33}">
                                                        <div class="fa-icon text-center"><span
                                                                class="bi bi-playstation" style="font-size: unset"></span></div>
                                                        <c:set var="test" value="1"/>
                                                    </c:if>
                                                    <c:if test="${c.catID == 34}">
                                                        <div class="fa-icon text-center"><span
                                                                class="bi bi-nintendo-switch" style="font-size: unset"></span></div>
                                                        <c:set var="test" value="1"/>
                                                    </c:if>
                                                    <c:if test="${c.catID == 35}">
                                                        <div class="fa-icon text-center"><span
                                                                class="bi bi-xbox" style="font-size: unset"></span></div>
                                                        <c:set var="test" value="1"/>
                                                    </c:if>
                                                    <c:if test="${test == 0}">
                                                        <div class="fa-icon text-center" style="font-size: unset"><span class="bi bi-bag"></span>
                                                        </div>
                                                        <c:set var="test" value="1"/>
                                                    </c:if>
                                                    <div class="d-flex flex-column ">
                                                        <h6 class="mb-0">${c.catName}</h6> <small class="text-muted" style="font-size: unset">Mua
                                                        sắm!</small>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </li>
                    <c:set var="stt" value="${stt + 1}"/>
                </c:forEach>
            </ul>
        </div>
        <div style="padding-bottom: 21px ; padding-right: 15px;">
            <form method="post" class="form-inline" style="padding-top: 20px"
                  action="${pageContext.request.contextPath}/Home/Index">
                <input class="form-control mr-sm-2" type="text" id="txtSr" name="txtSr" placeholder="Tìm kiếm.."
                       aria-label="Search">
                <button class="btn btn-outline-danger my-2 my-sm-0" type="submit"><i class="bi bi-search"></i></button>
            </form>
        </div>
        <div>
            <c:choose>
                <c:when test="${auth}">
                    <div class="collapse navbar-collapse">


                        <form id="frmLogout" method="post"
                              action="${pageContext.request.contextPath}/Account/Logout"></form>

                        <img src="${pageContext.request.contextPath}/public/imgs/avatar/user.png" alt="Avatar"
                             class="avatar">

                        <style>
                            .avatar {
                                vertical-align: middle;
                                width: 50px;
                                height: 50px;
                                border-radius: 50%;
                            }
                        </style>
                        <div class="dropdown" style="list-style: none">
                            <a class="nav-link dropdown-toggle" href="#" role="button"
                               data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                Xin chào, <b>${authUser.name}!</b>
                            </a>
                            <div class="dropdown-menu"
                                 style="background-color: #eeeeee ; padding-left: 12px; border-radius: 12px;">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/Account/Profile">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    Quản lý cá nhân
                                </a>
                                <div class="dropdown-divider" style="border-top:0.5px solid #e7d9d9;"></div>
                                <a class="dropdown-item" href="#">
                                    <i class="bi bi-piggy-bank" aria-hidden="true"></i>
                                    <span><fmt:formatNumber
                                            value="${authUser.money}" type="number"/></span>

                                </a>
                                <div class="dropdown-divider" style="border-top:0.5px solid #e7d9d9;"></div>
                                <a class="dropdown-item" href="#">
                                    <i class="bi bi-cart" aria-hidden="true"></i>
                                    <span><fmt:formatNumber
                                            value="${authUser.moneyAu}" type="number"/></span>

                                </a>
                                <div class="dropdown-divider" style="border-top:0.5px solid #e7d9d9;"></div>
                                <a class="dropdown-item" href="javascript:$('#frmLogout').submit()">
                                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                                    Đăng xuất
                                </a>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/Account/Register">Đăng ký</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/Account/Login">Đăng nhập</a>
                        </li>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
</div>







