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
    <jsp:attribute name="js">
        <script>
            $('#frmLike').on('submit', function (e) {
                e.preventDefault();
                alert('Bạn cần đăng nhập để thêm vào danh sách yêu thích.');
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="card" style="background: #FEFBF6">
            <jsp:include page="../../views/partials/ad.jsp"/>
            <div class="card-body">
                <ul class="list-group">
                    <div class="jumbotron jumbotron-fluid" style="background: #E0D8B0 ; border-radius: 20px">
                        <div class="container" >
                            <h1 class="display-4">5 Sản phẩm có lượt đấu giá cao nhất</h1>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${listTop5HighestCountAuction.size() == 0}">
                            <div class="card-body">
                                <p class="card-text">Không có dữ liệu.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="container" style="margin-top:50px; margin-bottom: 50px">
                                <div class="row">
                                    <c:forEach items="${listTop5HighestCountAuction}" var="p">
                                        <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proID}">
                                        <div class="col-md-3">
                                            <div class="card-sl">
                                                <form id="frmFavourite${p.proID}" method="post"
                                                      action="${pageContext.request.contextPath}/Product/Favourite" hidden>
                                                    <label>
                                                        <input value="${authUser.id}" name="idUser" >
                                                    </label>
                                                    <label>
                                                        <input value="${p.proID}" name="idPro" >
                                                    </label>
                                                    <label>
                                                        <input value="1" name="favourite" >
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
                                                                <input value="${p.proID}" name="idPro" >
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
                                                                <input value="${p.proID}" name="idPro" >
                                                            </label>
                                                            <label>
                                                                <input value="0" name="favourite" >
                                                            </label>
                                                            <label>
                                                                <input value="${f.faID}" name="idFa" >
                                                            </label>
                                                        </form>
                                                    </c:if>
                                                </c:forEach>
                                                <div class="card-image">
                                                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${p.proID}/main.jpg"
                                                                        alt="${p.proName}" title="${p.proName}" />
                                                </div>

                                                <c:if test="${auth}">
                                                    <c:set var="Test" scope="session" value="${1}"/>
                                                    <c:forEach items="${favourite}" var="f">
                                                                <c:if test="${f.userID == authUser.id && f.proID == p.proID && f.favourite == 0}">
                                                                    <a class="card-action"
                                                                       href="javascript:$('#frmFavourite-Add${p.proID}').submit()">
                                                                        <i class="fa fa-heart"></i>
                                                                        <c:set var="Test" scope="session" value="${0}"/>
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${f.userID == authUser.id && f.proID == p.proID && f.favourite == 1 }">
                                                                    <a class="card-action-off"
                                                                       href="javascript:$('#frmFavourite-Delete${p.proID}').submit()">
                                                                        <i class="fa fa-heart"></i>
                                                                        <c:set var="Test" scope="session" value="${0}"/>
                                                                    </a>
                                                                </c:if>
                                                            </c:forEach>
                                                    <c:if test="${Test == 1 }">
                                                                <a class="card-action"
                                                                   href="javascript:$('#frmFavourite${p.proID}').submit()">
                                                                    <i class="fa fa-heart"></i>
                                                                </a>
                                                            </c:if>
                                                </c:if>
                                                <c:if test="${!auth}">
                                                    <a class="card-action"
                                                       data-toggle="modal" data-target="#exampleModal">
                                                        <i class="fa fa-heart"></i>
                                                    </a>
                                                </c:if>
                                                <!-- Modal -->
                                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel1">Thông báo</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Hãy đăng nhập để có thể thêm vào danh sách yêu thích!
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-heading">
                                                        ${p.proName}
                                                </div>
                                                <div class="card-text" style="border-bottom-left-radius: 20px ; border-bottom-right-radius: 20px">
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
                                                    <p style="color:#4723D9">
                                                        Ngày kết thúc: ${p.endDay}<br/>
                                                        Số lượt ra giá hiện tại:${p.countAuction}
                                                    </p>
                                                        ${p.tinyDes}
                                                </div>
                                            </div>
                                        </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <ul class="list-group">
                    <div class="jumbotron jumbotron-fluid" style="background:  #DEA057  ; border-radius: 20px" >
                        <div class="container" >
                            <h1 class="display-4">5 Sản phẩm đang có giá cao nhất</h1>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${listTop5HighestPrice.size() == 0}">
                            <div class="card-body">
                                <p class="card-text">Không có dữ liệu.</p>
                            </div>
                        </c:when>
                        <c:otherwise>

                            <div class="container" style="margin-top:50px; margin-bottom: 50px">
                                <div class="row">
                                    <c:forEach items="${listTop5HighestPrice}" var="p">
                                        <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proID}">
                                        <div class="col-md-3">
                                            <div class="card-sl">
                                                <form id="frmFavourite${p.proID}" method="post"
                                                      action="${pageContext.request.contextPath}/Product/Favourite" hidden>
                                                    <label>
                                                        <input value="${authUser.id}" name="idUser" >
                                                    </label>
                                                    <label>
                                                        <input value="${p.proID}" name="idPro" >
                                                    </label>
                                                    <label>
                                                        <input value="1" name="favourite" >
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
                                                                <input value="${p.proID}" name="idPro" >
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
                                                                <input value="${p.proID}" name="idPro" >
                                                            </label>
                                                            <label>
                                                                <input value="0" name="favourite" >
                                                            </label>
                                                            <label>
                                                                <input value="${f.faID}" name="idFa" >
                                                            </label>
                                                        </form>
                                                    </c:if>
                                                </c:forEach>
                                                <div class="card-image">
                                                    <img src="${pageContext.request.contextPath}/public/imgs/sp/${p.proID}/main.jpg"
                                                         alt="${p.proName}" title="${p.proName}" />
                                                </div>

                                                <c:if test="${auth}">
                                                    <c:set var="Test" scope="session" value="${1}"/>
                                                    <c:forEach items="${favourite}" var="f">
                                                                <c:if test="${f.userID == authUser.id && f.proID == p.proID && f.favourite == 0}">
                                                                    <a class="card-action"
                                                                       href="javascript:$('#frmFavourite-Add${p.proID}').submit()">
                                                                        <i class="fa fa-heart"></i>
                                                                        <c:set var="Test" scope="session" value="${0}"/>
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${f.userID == authUser.id && f.proID == p.proID && f.favourite == 1 }">
                                                                    <a class="card-action-off"
                                                                       href="javascript:$('#frmFavourite-Delete${p.proID}').submit()">
                                                                        <i class="fa fa-heart"></i>
                                                                        <c:set var="Test" scope="session" value="${0}"/>
                                                                    </a>
                                                                </c:if>
                                                            </c:forEach>
                                                    <c:if test="${Test == 1 }">
                                                                <a class="card-action"
                                                                   href="javascript:$('#frmFavourite${p.proID}').submit()">
                                                                    <i class="fa fa-heart"></i>
                                                                </a>
                                                            </c:if>
                                                </c:if>
                                                <c:if test="${!auth}">
                                                    <a class="card-action"
                                                       data-toggle="modal" data-target="#exampleModal">
                                                        <i class="fa fa-heart"></i>
                                                    </a>
                                                </c:if>
                                                <!-- Modal -->
                                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Hãy đăng nhập để có thể thêm vào danh sách yêu thích!
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-heading">
                                                        ${p.proName}
                                                </div>
                                                <div class="card-text" style="border-bottom-left-radius: 20px ; border-bottom-right-radius: 20px">
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
                                                    <p style="color:#4723D9">
                                                        Ngày kết thúc: ${p.endDay}<br/>
                                                        Số lượt ra giá hiện tại:${p.countAuction}
                                                    </p>
                                                        ${p.tinyDes}
                                                </div>
                                            </div>
                                        </div>
                                        </a>
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