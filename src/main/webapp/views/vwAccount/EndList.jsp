<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="products" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="listAuction" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Auction>"/>
<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                End List
                <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Account/Profile"
                   role="button">
                    <i class="bi bi-backspace-fill" aria-hidden="true"></i>
                    Trở về
                </a>
            </h4>
            <div class="card-body">
                <div class="row">
                    <c:forEach items="${products}" var="p">
                        <c:if test="${p.userSellID == authUser.id}">
                            <div class="col-sm-4 mb-3">
                                <div class="card h-100">
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
                                        <c:choose>
                                            <c:when test="${p.userID != -1}">
                                                <div class="btn btn-sm bg-success">
                                                    <i class="bi bi-box-seam" aria-hidden="true"></i>
                                                    Sản phẩm có người mua
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="btn btn-sm bg-primary">
                                                    <i class="bi bi-box-seam" aria-hidden="true"></i>
                                                    Sản phẩm không có người mua
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>