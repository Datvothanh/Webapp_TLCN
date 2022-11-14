<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="listAuction" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Auction>"/>
<jsp:useBean id="productAll" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="feedBackAll" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.FeedBack>"/>
<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                Sản phẩm đấu giá thành công
                <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Account/Profile"
                   role="button">
                    <i class="bi bi-backspace-fill" aria-hidden="true"></i>
                    Trở về
                </a>
            </h4>
            <div class="card-body">
                <div class="row">
                    <c:set var="Test" scope="session" value="${1}"/>
                    <c:set var="test" scope="session" value="${0}"/>
                    <c:forEach items="${productAll}" var="p">
                        <c:forEach items="${listAuction}" var="a">
                            <c:if test="${a.userID == authUser.id && a.proID == p.proID && p.userID == authUser.id}">
                                <c:set var="Test" scope="session" value="${0}"/>
                                <div class="col-sm-4 mb-3">
                                    <div class="card h-100">
                                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${p.proID}/main.jpg"
                                             alt="${p.proName}" title="${p.proName}" class="card-img-top">
                                        <div class="card-body">
                                            <h6 class="card-title">${p.proName}</h6>
                                            <h5 class="card-title text-danger">
                                                <fmt:formatNumber value="${p.startingPrice}" type="number"/>
                                            </h5>
                                            <p class="card-text">${p.tinyDes}</p>
                                        </div>
                                        <div class="card-footer text-muted">
                                            <a class="btn btn-sm btn-outline-primary"
                                               href="${pageContext.request.contextPath}/Product/Detail?id=${p.proID}"
                                               role="button">
                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                Xem chi tiết
                                            </a>
                                            <c:choose>
                                                <c:when test="${p.ship == 0}">
                                                    <div class="btn btn-sm bg-info">
                                                        <i class="bi bi-box-seam" aria-hidden="true"></i>
                                                        Sản phẩm đang được giao
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="TestFeedBack" scope="session" value="${0}"/>
                                                    <c:forEach items="${feedBackAll}" var="f">
                                                        <c:if test="${p.proID == f.proID }">
                                                            <c:set var="TestFeedBack" scope="session" value="${1}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                        <c:if test="${TestFeedBack ==1 }">
                                                            <div class="btn btn-sm bg-info">
                                                                <i class="bi bi-box-seam" aria-hidden="true"></i>
                                                                Cảm ơn bạn đã phản hồi!
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${TestFeedBack !=1 }">
                                                            <a href="${pageContext.request.contextPath}/Account/FeedBack?idPro=${p.proID}&idUser=${authUser.id}">
                                                                Bạn có thể phản hồi cho người bán
                                                            </a>
                                                        </c:if>

                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                    <c:if test="${Test == 1}">
                        <div class="card-body">
                            <p class="card-text">Không có dữ liệu.</p>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>