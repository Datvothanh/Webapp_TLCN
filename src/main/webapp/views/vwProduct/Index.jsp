<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="products" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="listUsers" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<t:admin>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                Sản phẩm
                <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Product/Add"
                   role="button">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                    Thêm sản phẩm
                </a>

            </h4>
            <c:choose>
                <c:when test="${products.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">

                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Giá khởi điểm</th>
                                <th scope="col">Chú thích ngắn</th>
                                <th scope="col">Bước giá</th>
                                <th scope="col">Lúc kết thúc</th>
                                <th scope="col">Người đăng sản phẩm</th>
                                <th scope="col">Chỉnh sửa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${products}" var="p">
                                <c:forEach items="${listUsers}" var="u">
                                    <c:if test="${p.userSellID == u.id}">
                                        <c:set var="userSell" value="${u.name}"/>
                                    </c:if>
                                </c:forEach>
                                <tr>
                                    <th scope="row">${p.proID}</th>
                                    <td>${p.proName}</td>
                                    <td>
                                        <fmt:formatNumber value="${p.startingPrice}" type="number"/> đ
                                    </td>
                                    <td>${p.tinyDes}</td>
                                    <td><fmt:formatNumber value="${p.stepPrice}" type="number"/> đ</td>
                                    <td>${p.strDate}</td>
                                    <td>${userSell}</td>
                                    <td class="text-right">
                                        <a class="btn btn-outline-primary"
                                           href="${pageContext.request.contextPath}/Admin/Product/Edit?id=${p.proID}"
                                           role="button">
                                            <i class="bi bi-pencil"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:admin>