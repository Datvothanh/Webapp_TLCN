<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="com.example.webapp_tlcn.beans.Product"/>
<jsp:useBean id="favourite" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Favourite>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<jsp:useBean id="TopAuctionHighestPrice" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Auction>"/>
<jsp:useBean id="proCat5" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>

<t:main>
    <jsp:attribute name="js">
        <script>
            $('#frmAuction${product.proID}').on('submit', function (e) {
                e.preventDefault();
                const result = confirm("Bạn hãy xác nhận đấu giá !");
                let price = Number($('#numPrice').val());
                let presentPrice = Number($('#presentPrice').val());
                let authUserMoney = Number($('#authUserMoney').val());
                let start = Number($('#start').val());
                let step = Number($('#step').val());
                let highest = Number($('#highest').val());
                if (result) {
                    if (price <= 0) {
                        alert('Đấu giá không hợp lệ.');
                    } else {
                        if (highest === 0) {
                            if (price < (start + step)) {
                                alert('Số tiền đấu giá ít nhất phải bằng: ' + (start + step));
                            } else if (authUserMoney < (price - presentPrice) || authUserMoney < price ) {
                                alert('Tài khoản bạn không đủ tiền');
                            }else {
                                $('#frmAuction${product.proID}').off('submit').submit();
                            }
                        } else {
                            if (price < (highest + step)) {
                                alert('Số tiền đấu giá ít nhất phải bằng: ' + (highest + step));
                            } else if (authUserMoney < (price - presentPrice) || authUserMoney < price ) {
                                alert('Tài khoản bạn không đủ tiền');
                            } else {

                                $('#frmAuction${product.proID}').off('submit').submit();
                            }
                        }
                    }
                } else {
                    alert("Đã hủy đấu giá.");
                }
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <form id="frmFavourite${product.proID}" method="post"
              action="${pageContext.request.contextPath}/Product/Favourite" hidden>
            <label>
                <input value="${authUser.id}" name="idUser" hidden>
            </label>
            <label>
                <input value="${product.proID}" name="idPro" hidden>
            </label>
            <label>
                <input value="1" name="favourite" hidden>
            </label>
        </form>
        <c:forEach items="${favourite}" var="f">
            <c:if test="${f.userID == authUser.id && f.proID == product.proID}">
                <form id="frmFavourite-Add${product.proID}" method="post"
                      action="${pageContext.request.contextPath}/Product/FavouriteEdit" hidden>
                    <label>
                        <input value="${authUser.id}" name="idUser"
                               hidden>
                    </label>
                    <label>
                        <input value="${product.proID}" name="idPro" hidden>
                    </label>
                    <label>
                        <input value="1" name="favourite" hidden>
                    </label>
                    <label>
                        <input value="${f.faID}" name="idFa" hidden>
                    </label>
                </form>
                <form id="frmFavourite-Delete${product.proID}" method="post"
                      action="${pageContext.request.contextPath}/Product/FavouriteEdit" hidden>
                    <label>
                        <input value="${authUser.id}" name="idUser"
                               hidden>
                    </label>
                    <label>
                        <input value="${product.proID}" name="idPro" hidden>
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
        <jsp:include page="../../views/partials/ad.jsp"/>
        <div class="card">
            <input value="${authUser.money}" id="authUserMoney" hidden>
            <h4 class="card-header d-flex justify-content-between">
                    ${product.proName}
            </h4>
            <div class="card-body">
                <div class="col-sm-4 mb-3">
                    <div class="card h-100">
                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/main.jpg"
                             alt="${product.proName}" title="${product.proName}"/>
                        <h6 class="card-title">${product.proName}</h6>
                        <p class="card-text mt-3">
                            Bước giá:
                            <span class="text-danger font-weight-bold"><fmt:formatNumber
                                    value="${product.stepPrice}" type="number"/></span>
                        </p>
                        <c:choose>
                            <c:when test="${product.highestPaidPrice == 0}">
                                <p class="card-text mt-3">
                                    Giá khởi điểm:
                                    <span class="text-danger font-weight-bold"><fmt:formatNumber
                                            value="${product.startingPrice}" type="number"/></span>
                                </p>
                            </c:when>
                            <c:otherwise>
                                <h5 class="card-title text-danger">
                                    <p class="card-text mt-3">
                                        Giá trả cao nhất:
                                        <span class="text-danger font-weight-bold"><fmt:formatNumber
                                                value="${product.highestPaidPrice}" type="number"/></span>
                                    </p>
                                </h5>
                                <h6 class="card-title text-danger">
                                    <c:forEach items="${user}" var="u">
                                        <c:if test="${u.id == product.userID}">
                                            Người đặt giá: ${u.name}
                                        </c:if>
                                    </c:forEach>
                                </h6>
                            </c:otherwise>
                        </c:choose>
                        <h6 class="card-title text-dark">
                            Ngày đăng sản phẩm: ${product.endDay}
                        </h6>
                        <h6 class="card-title text-dark">
                            <c:forEach items="${user}" var="u">
                                <c:if test="${u.id == product.userSellID}">
                                    Người bán sản phẩm: ${u.name}
                                    <a class="btn btn-sm btn-outline-primary"
                                       href="${pageContext.request.contextPath}/Account/FeedBackSeller?id=${u.id}"
                                       role="button">
                                        <i class="fa fa-eye" aria-hidden="true"></i>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </h6>
                        <p class="card-text">${product.fullDes}</p>
                        <c:choose>
                            <c:when test="${auth == true && product.userSellID != authUser.id}">
                                        <form id="frmAuction${product.proID}" method="post"
                                              action="${pageContext.request.contextPath}/Product/Auction">
                                            <label>
                                                <input value="${authUser.id}" name="idUser" hidden>
                                            </label>
                                            <label>
                                                <input value="${product.proID}" name="idPro" hidden>
                                            </label>
                                            <label>
                                                <input value="${product.countAuction}" name="countAuction" hidden>
                                            </label>
                                            <label>
                                                <input value="${product.highestPaidPrice}" id="highest" hidden>
                                            </label>
                                            <label>
                                                <input value="${product.stepPrice}" id="step" hidden>
                                            </label>
                                            <label>
                                                <input value="${product.startingPrice}" id="start" hidden>
                                            </label>
                                            <label>
                                                <input name="price" id="numPrice">
                                            </label>
                                        </form>
                                        <a class="btn btn-sm btn-outline-danger"
                                           href="javascript:$('#frmAuction${product.proID}').submit()">
                                            <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                            Đấu giá
                                        </a>
                                <c:set var="Test" scope="session" value="${1}"/>
                                <c:forEach items="${favourite}" var="f">
                                    <c:if test="${f.userID == authUser.id && f.proID == product.proID && f.favourite == 0}">
                                        <a class="btn btn-sm btn-outline-danger"
                                           href="javascript:$('#frmFavourite-Add${product.proID}').submit()">
                                            <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                            Thêm vào danh sách yêu thích
                                            <c:set var="Test" scope="session" value="${0}"/>
                                        </a>
                                    </c:if>
                                    <c:if test="${f.userID == authUser.id && f.proID == product.proID && f.favourite == 1 }">
                                        <a class="btn btn-sm btn-outline-danger"
                                           href="javascript:$('#frmFavourite-Delete${product.proID}').submit()">
                                            <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                            Xóa khỏi danh sách yêu thích
                                            <c:set var="Test" scope="session" value="${0}"/>
                                        </a>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${Test == 1 }">
                                    <a class="btn btn-sm btn-outline-danger"
                                       href="javascript:$('#frmFavourite${product.proID}').submit()">
                                        <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                        Thêm vào danh sách yêu thích
                                    </a>
                                </c:if>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Date</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:set var="STT" scope="session" value="${1}"/>
                    <c:forEach items="${TopAuctionHighestPrice}" var="a">
                    <c:forEach items="${user}" var="u">
                    <c:choose>
                    <c:when test="${product.proID == a.proID && a.userID == u.id}">
                    <tr>
                        <th scope="row">${STT}</th>
                        <td>Mark</td>
                        <td>${u.name}</td>
                        <td>${a.price}</td>

                        <c:set var="STT" scope="session" value="${STT + 1}"/>
                    </tr>
                        <c:if test="${a.userID == authUser.id}">
                        <input value="${a.price}" id="presentPrice" hidden>
                        </c:if>
                    </c:when>
                    </c:choose>
                    </c:forEach>
                    </c:forEach>
                </table>
            </div>
            <h4 class="card-header">
                5 sản phẩm khác cùng loại
            </h4>
            <ul class="list-group">
                <c:choose>
                    <c:when test="${proCat5.size() == 0}">
                        <div class="card-body">
                            <p class="card-text">Không có dữ liệu.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="card-body">
                            <div class="row">
                                <c:forEach items="${proCat5}" var="p">
                                    <div class="col-sm-4 mb-3">
                                        <div class="card h-100">
                                            <form id="frmFavourite${p.proID}" method="post"
                                                  action="${pageContext.request.contextPath}/Product/Favourite" hidden>
                                                <label>
                                                    <input value="${authUser.id}" name="idUser" >
                                                </label>
                                                <label>
                                                    <input value="${p.proID}" name="idPro" >
                                                </label>
                                                <label>
                                                    <input value="1" name="favourite">
                                                </label>
                                            </form>
                                            <c:forEach items="${favourite}" var="f">
                                                <c:if test="${f.userID == authUser.id && f.proID == p.proID}">
                                                    <form id="frmFavourite-Add${p.proID}" method="post"
                                                          action="${pageContext.request.contextPath}/Product/FavouriteEdit" hidden>
                                                        <label>
                                                            <input value="${authUser.id}" name="idUser"
                                                                   hidden>
                                                        </label>
                                                        <label>
                                                            <input value="${p.proID}" name="idPro">
                                                        </label>
                                                        <label>
                                                            <input value="1" name="favourite" >
                                                        </label>
                                                        <label>
                                                            <input value="${f.faID}" name="idFa" >
                                                        </label>
                                                    </form>
                                                    <form id="frmFavourite-Delete${p.proID}" method="post"
                                                          action="${pageContext.request.contextPath}/Product/FavouriteEdit" hidden>
                                                        <label>
                                                            <input value="${authUser.id}" name="idUser"
                                                                   >
                                                        </label>
                                                        <label>
                                                            <input value="${p.proID}" name="idPro">
                                                        </label>
                                                        <label>
                                                            <input value="0" name="favourite" >
                                                        </label>
                                                        <label>
                                                            <input value="${f.faID}" name="idFa">
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
                                                    Ngày đăng sản phẩm: ${p.endDay}
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
                                                                        <i class="fa fa-cart-plus"
                                                                           aria-hidden="true"></i>
                                                                        Thêm vào danh sách yêu thích
                                                                        <c:set var="Test" scope="session" value="${0}"/>
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${f.userID == authUser.id && f.proID == p.proID && f.favourite == 1 }">
                                                                    <a class="btn btn-sm btn-outline-danger"
                                                                       href="javascript:$('#frmFavourite-Delete${p.proID}').submit()">
                                                                        <i class="fa fa-cart-plus"
                                                                           aria-hidden="true"></i>
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
        <div class="card-footer text-muted">
        </div>
    </jsp:body>
</t:main>