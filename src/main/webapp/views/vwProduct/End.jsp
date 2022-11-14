<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="products" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<t:admin>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                Danh sách sản phẩm kết thúc
            </h4>
            <div class="card-body">
                <div class="row">
                    <c:forEach items="${products}" var="p">
                        <c:if test="${p.sell == 1}">
                            <div class="col-sm-4 mb-3">
                                <div class="card h-100">
                                    <form id="frmShipping${p.proID}" method="post"
                                          action="${pageContext.request.contextPath}/Admin/Product/End">
                                        <label>
                                            <input value="${p.proID}" name="idPro" hidden>
                                        </label>
                                        <label>
                                            <input value="1" name="ship" hidden>
                                        </label>
                                    </form>
                                    <form id="frmShipped${p.proID}" method="post"
                                          action="${pageContext.request.contextPath}/Admin/Product/End">
                                        <label>
                                            <input value="${p.proID}" name="idPro" hidden>
                                        </label>
                                        <label>
                                            <input value="0" name="ship" hidden>
                                        </label>
                                    </form>
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
                                        <c:choose>
                                            <c:when test="${p.ship == 0}">
                                                <a class="btn btn-sm btn-outline-danger"
                                                   href="javascript:$('#frmShipping${p.proID}').submit()">
                                                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                    Sản phẩm đang được vận chuyển
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="btn btn-sm btn-outline-danger"
                                                   href="javascript:$('#frmShipped${p.proID}').submit()">
                                                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                    Người mua đã nhận được sản phẩm
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
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
</t:admin>