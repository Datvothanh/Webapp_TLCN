<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="listTop5HighestPrice" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="listTop5HighestCountAuction" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="favourite" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Favourite>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<jsp:useBean id="auction" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Auction>"/>
<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                Index
            </h4>
            <div class="card-body">
                <ul class="list-group">
                    <li class="list-group-item active" aria-current="true">Top 5 sản phẩm có lượt đấu giá cao nhất</li>
                    <c:choose>
                        <c:when test="${listTop5HighestCountAuction.size() == 0}">
                            <div class="card-body">
                                <p class="card-text">Không có dữ liệu.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="card-body">
                                <div class="row">
                                    <c:forEach items="${listTop5HighestCountAuction}" var="p">
                                        <div class="col-sm-4 mb-3">
                                            <div class="card h-100">
                                                <form id="frmFavourite${p.proID}" method="post"
                                                      action="${pageContext.request.contextPath}/Product/Favourite">
                                                    <label>
                                                        <input value="${authUser.id}" name="idUser" hidden>
                                                    </label>
                                                    <label>
                                                        <input value="${p.proID}" name="idPro" hidden>
                                                    </label>
                                                    <label>
                                                        <input value="1" name="favourite" hidden>
                                                    </label>
                                                </form>
                                                <c:forEach items="${favourite}" var="f">
                                                    <c:if test="${f.userID == authUser.id && f.proID == p.proID}">
                                                        <form id="frmFavourite-Add${p.proID}" method="post"
                                                              action="${pageContext.request.contextPath}/Product/FavouriteEdit">
                                                            <label>
                                                                <input value="${authUser.id}" name="idUser"
                                                                       hidden>
                                                            </label>
                                                            <label>
                                                                <input value="${p.proID}" name="idPro" hidden>
                                                            </label>
                                                            <label>
                                                                <input value="1" name="favourite" hidden>
                                                            </label>
                                                            <label>
                                                                <input value="${f.faID}" name="idFa" hidden>
                                                            </label>
                                                        </form>
                                                        <form id="frmFavourite-Delete${p.proID}" method="post"
                                                              action="${pageContext.request.contextPath}/Product/FavouriteEdit">
                                                            <label>
                                                                <input value="${authUser.id}" name="idUser"
                                                                       hidden>
                                                            </label>
                                                            <label>
                                                                <input value="${p.proID}" name="idPro" hidden>
                                                            </label>
                                                            <label>
                                                                <input value="0" name="favourite" hidden>
                                                            </label>
                                                            <label>
                                                                <input value="${f.faID}" name="idFa" hidden>
                                                            </label>
                                                        </form>
                                                    </c:if>
                                                </c:forEach>

                                                <img src="${pageContext.request.contextPath}/public/imgs/sp/${p.proID}/main.jpg"
                                                     alt="${p.proName}" title="${p.proName}" class="card-img-top">
                                                <div class="card-body">
                                                    <h6 class="card-title">${p.proName}</h6>
                                                    <c:choose>
                                                        <c:when test="${p.highestPaidPrice == 0}">
                                                            <h5 class="card-title text-danger">
                                                                Giá khởi điểm:
                                                                <span class="text-danger font-weight-bold"><fmt:formatNumber
                                                                        value="${p.startingPrice}" type="number"/></span>
                                                            </h5>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <h5 class="card-title text-danger">
                                                                Giá trả cao nhất:
                                                                <span class="text-danger font-weight-bold"><fmt:formatNumber
                                                                        value="${p.highestPaidPrice}" type="number"/></span>
                                                            </h5>
                                                            <h6 class="card-title text-danger">
                                                                <c:forEach items="${user}" var="u">
                                                                    <c:if test="${u.id == p.userID}">
                                                                        Người đặt giá: ${u.name}
                                                                    </c:if>
                                                                </c:forEach>
                                                            </h6>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <h6 class="card-title text-dark">
                                                        Ngày kết thúc : ${p.endDay}
                                                    </h6>
                                                    <h6 class="card-title text-dark">
                                                        Số lượt ra giá hiện tại:
                                                            ${p.countAuction}
                                                    </h6>
                                                    <p class="card-text">${p.tinyDes}</p>
                                                </div>
                                                <div class="card-footer text-muted">
                                                    <a class="btn btn-sm btn-outline-primary"
                                                       href="${pageContext.request.contextPath}/Product/Detail?id=${p.proID}"
                                                       role="button">
                                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                                        Details
                                                    </a>
                                                    <c:if test="${auth}">
                                                        <c:choose>
                                                            <c:when test="${p.userSellID != authUser.id}">
                                                                <c:set var="Test" scope="session" value="${1}"/>
                                                                <c:forEach items="${favourite}" var="f">
                                                                    <c:if test="${f.userID == authUser.id && f.proID == p.proID && f.favourite == 0}">
                                                                        <a class="btn btn-sm btn-outline-danger"
                                                                           href="javascript:$('#frmFavourite-Add${p.proID}').submit()">
                                                                            <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                                            Thêm vào danh sách yêu thích
                                                                            <c:set var="Test" scope="session" value="${0}"/>
                                                                        </a>
                                                                    </c:if>
                                                                    <c:if test="${f.userID == authUser.id && f.proID == p.proID && f.favourite == 1 }">
                                                                        <a class="btn btn-sm btn-outline-danger"
                                                                           href="javascript:$('#frmFavourite-Delete${p.proID}').submit()">
                                                                            <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                                            Xóa khỏi danh sách yêu thích
                                                                            <c:set var="Test" scope="session" value="${0}"/>
                                                                        </a>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${Test == 1 }">
                                                                    <a class="btn btn-sm btn-outline-danger"
                                                                       href="javascript:$('#frmFavourite${p.proID}').submit()">
                                                                        <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                                        Thêm vào danh sách yêu thích
                                                                    </a>
                                                                </c:if>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="btn btn-sm bg-warning">
                                                                    <i class="bi bi-box-seam" aria-hidden="true"></i>
                                                                    Sản phẩm đang bán
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <ul class="list-group">
                    <li class="list-group-item active" aria-current="true">Top 5 sản phẩm có giá cao nhất</li>
                    <c:choose>
                        <c:when test="${listTop5HighestPrice.size() == 0}">
                            <div class="card-body">
                                <p class="card-text">Không có dữ liệu.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="card-body">
                                <div class="row">
                                    <c:forEach items="${listTop5HighestPrice}" var="p">
                                        <div class="col-sm-4 mb-3">
                                            <div class="card h-100">
                                                <form id="frmFavourite${p.proID}" method="post"
                                                      action="${pageContext.request.contextPath}/Product/Favourite">
                                                    <label>
                                                        <input value="${authUser.id}" name="idUser" hidden>
                                                    </label>
                                                    <label>
                                                        <input value="${p.proID}" name="idPro" hidden>
                                                    </label>
                                                    <label>
                                                        <input value="1" name="favourite" hidden>
                                                    </label>
                                                </form>
                                                <c:forEach items="${favourite}" var="f">
                                                    <c:if test="${f.userID == authUser.id && f.proID == p.proID}">
                                                        <form id="frmFavourite-Add${p.proID}" method="post"
                                                              action="${pageContext.request.contextPath}/Product/FavouriteEdit">
                                                            <label>
                                                                <input value="${authUser.id}" name="idUser"
                                                                       hidden>
                                                            </label>
                                                            <label>
                                                                <input value="${p.proID}" name="idPro" hidden>
                                                            </label>
                                                            <label>
                                                                <input value="1" name="favourite" hidden>
                                                            </label>
                                                            <label>
                                                                <input value="${f.faID}" name="idFa" hidden>
                                                            </label>
                                                        </form>
                                                        <form id="frmFavourite-Delete${p.proID}" method="post"
                                                              action="${pageContext.request.contextPath}/Product/FavouriteEdit">
                                                            <label>
                                                                <input value="${authUser.id}" name="idUser"
                                                                       hidden>
                                                            </label>
                                                            <label>
                                                                <input value="${p.proID}" name="idPro" hidden>
                                                            </label>
                                                            <label>
                                                                <input value="0" name="favourite" hidden>
                                                            </label>
                                                            <label>
                                                                <input value="${f.faID}" name="idFa" hidden>
                                                            </label>
                                                        </form>
                                                    </c:if>
                                                </c:forEach>

                                                <img src="${pageContext.request.contextPath}/public/imgs/sp/${p.proID}/main.jpg"
                                                     alt="${p.proName}" title="${p.proName}" class="card-img-top">
                                                <div class="card-body">
                                                    <h6 class="card-title">${p.proName}</h6>
                                                    <c:choose>
                                                        <c:when test="${p.highestPaidPrice == 0}">
                                                            <h5 class="card-title text-danger">
                                                                Giá khởi điểm:
                                                                <span class="text-danger font-weight-bold"><fmt:formatNumber
                                                                        value="${p.startingPrice}" type="number"/></span>
                                                            </h5>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <h5 class="card-title text-danger">
                                                                Giá trả cao nhất:
                                                                <span class="text-danger font-weight-bold"><fmt:formatNumber
                                                                        value="${p.highestPaidPrice}" type="number"/></span>
                                                            </h5>
                                                            <h6 class="card-title text-danger">
                                                                <c:forEach items="${user}" var="u">
                                                                    <c:if test="${u.id == p.userID}">
                                                                        Người đặt giá: ${u.name}
                                                                    </c:if>
                                                                </c:forEach>
                                                            </h6>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <h6 class="card-title text-dark">
                                                        Ngày kết thúc: ${p.endDay}
                                                    </h6>
                                                    <h6 class="card-title text-dark">
                                                        Số lượt ra giá hiện tại:
                                                            ${p.countAuction}
                                                    </h6>
                                                    <p class="card-text">${p.tinyDes}</p>
                                                </div>
                                                <div class="card-footer text-muted">
                                                    <a class="btn btn-sm btn-outline-primary"
                                                       href="${pageContext.request.contextPath}/Product/Detail?id=${p.proID}"
                                                       role="button">
                                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                                        Details
                                                    </a>
                                                    <c:if test="${auth}">
                                                        <c:choose>
                                                            <c:when test="${p.userSellID != authUser.id}">
                                                                <c:set var="Test" scope="session" value="${1}"/>
                                                                <c:forEach items="${favourite}" var="f">
                                                                    <c:if test="${f.userID == authUser.id && f.proID == p.proID && f.favourite == 0}">
                                                                        <a class="btn btn-sm btn-outline-danger"
                                                                           href="javascript:$('#frmFavourite-Add${p.proID}').submit()">
                                                                            <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                                            Thêm vào danh sách yêu thích
                                                                            <c:set var="Test" scope="session" value="${0}"/>
                                                                        </a>
                                                                    </c:if>
                                                                    <c:if test="${f.userID == authUser.id && f.proID == p.proID && f.favourite == 1 }">
                                                                        <a class="btn btn-sm btn-outline-danger"
                                                                           href="javascript:$('#frmFavourite-Delete${p.proID}').submit()">
                                                                            <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                                            Xóa khỏi danh sách yêu thích
                                                                            <c:set var="Test" scope="session" value="${0}"/>
                                                                        </a>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:if test="${Test == 1 }">
                                                                    <a class="btn btn-sm btn-outline-danger"
                                                                       href="javascript:$('#frmFavourite${p.proID}').submit()">
                                                                        <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                                        Thêm vào danh sách yêu thích
                                                                    </a>
                                                                </c:if>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="btn btn-sm bg-warning">
                                                                    <i class="bi bi-box-seam" aria-hidden="true"></i>
                                                                    Sản phẩm đang bán
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </jsp:body>
</t:main>