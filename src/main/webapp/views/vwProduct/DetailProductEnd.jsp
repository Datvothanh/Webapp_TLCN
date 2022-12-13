<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="com.example.webapp_tlcn.beans.Product"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<jsp:useBean id="TopAuctionHighestPrice" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Auction>"/>
<t:main>
    <jsp:body>
        <div class="card">
            <input value="${authUser.money}" id="authUserMoney" hidden>
            <h4 class="card-header d-flex justify-content-between">
                    ${product.proName}
            </h4>
            <div class="cardProduct">
                    <div class="container-fliud">
                        <div class="wrapper row">
                            <div class="preview col-md-6">

                                <div class="preview-pic tab-content">
                                    <div class="tab-pane active" id="pic-1"><img src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/main.jpg" style="width:696px;height:533px;"/></div>
                                </div>

                            </div>
                            <div class="details col-md-6">
                                <h3 class="product-title">${product.proName}</h3>
                                <p class="product-description">${product.fullDes}</p>

                                <c:choose>
                                    <c:when test="${product.highestPaidPrice == 0}">
                                        <h4 class="price">Giá khởi điểm: <span><fmt:formatNumber
                                                value="${product.startingPrice}" type="number"/></span></h4>
                                    </c:when>
                                    <c:otherwise>
                                        <h4 class="price">Giá trả cao nhất: <span><fmt:formatNumber
                                                value="${product.highestPaidPrice}" type="number"/></span></h4>
                                        <h5 class="card-title text-danger">
                                            <c:forEach items="${user}" var="u">
                                                <c:if test="${u.id == product.userID}">
                                                    Người đặt giá: ${u.name}
                                                </c:if>
                                            </c:forEach>
                                        </h5>
                                    </c:otherwise>
                                </c:choose>
                                <div style="padding-top: 45px;">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Thời gian</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Giá</th>
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
                                            <td>${a.date}</td>
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
                            </div>
                        </div>
                    </div>

            </div>
        </div>
    </jsp:body>
</t:main>