<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="listAuction" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Auction>"/>
<jsp:useBean id="productAll" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="feedBackAll" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.FeedBack>"/>
<jsp:useBean id="listNotices" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Notice>"/>
<t:main>
    <jsp:attribute name="js">
        <script>
            function tai_lai_trang(){
                location.reload();
            }
        </script>

    </jsp:attribute>
    <jsp:body>
        <div class="card">
        <h4 class="card-header d-flex">
            <a href="${pageContext.request.contextPath}/Account/Profile"
               role="button" style=" margin-right: 27px;">
                <i class="bi bi-backspace-fill" aria-hidden="true"></i>
            </a>
            <p>Sản phẩm đấu giá kết thúc</p>
        </h4>
        <div class="card-body">
            <c:set var="Test" scope="session" value="${1}"/>
            <c:set var="test" scope="session" value="${0}"/>
            <c:set var="stt" scope="session" value="${0}"/>
            <div class="container  px-2">
                <div class="table-responsive">
                    <table class="table table-responsive table-borderless">

                        <thead>
                        <tr class="bg-light">
                            <th scope="col" width="20%">Mã sản phẩm</th>
                            <th scope="col" width="20%">Thời gian kết thúc</th>
                            <th scope="col" width="20%">Tình trạng</th>
                            <th scope="col" width="20%">Số tiền đấu giá</th>
                            <th scope="col" class="text-end" width="20%"><span>Xem lại đấu giá</span></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${productAll}" var="p">
                            <c:forEach items="${listAuction}" var="a">
                                <c:if test="${a.userID == authUser.id && a.proID == p.proID}">
                                    <c:if test="${p.userID == authUser.id}">
                                        <c:forEach items="${listNotices}" var="n">
                                            <c:if test="${ n.idUser == authUser.id && n.idPro == p.proID || n.idUser == p.userSellID && n.idPro == p.proID }">
                                                <c:set var="test" scope="session" value="${1}"/>
                                                <c:set var="stt" scope="session" value="${n.stt}"/>
                                                <c:set var="price" scope="session" value="${n.price}"/>
                                            </c:if>
                                        </c:forEach>
                                        <c:set var="Test" scope="session" value="${0}"/>
                                        <tr>
                                            <form id="frmShipping${p.proID}" method="post"
                                                  action="${pageContext.request.contextPath}/Admin/Product/End" hidden>
                                                <label>
                                                    <input value="${p.proID}" name="idPro" hidden>
                                                </label>
                                                <label>
                                                    <input value="2" name="ship" hidden>
                                                </label>
                                            </form>
                                            <td>${p.proID}</td>
                                            <td>${p.strDate}</td>
                                            <c:if test="${test == 1}">
                                                <c:if test="${stt == 0 || stt == 2}">
                                                    <c:choose>
                                                        <c:when test="${p.ship == 0}">
                                                            <td><i class="fa fa-check-circle-o green"></i><span class="ms-1"> Sản phẩm đang được giao</span></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><i class="fa fa-check-circle-o green"></i><span class="ms-1"> Sản phẩm đã giao tới</span><br/>
                                                                <a href="javascript:$('#frmShipping${p.proID}').submit()" onclick="tai_lai_trang()">
                                                                    Xác nhận là đã nhận sản phẩm.
                                                                </a>
                                                            </td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                                <c:if test="${stt == 1}">
                                                    <td>
                                                        <i class="fa fa-dot-circle-o text-danger"></i><span class="ms-1"> Bạn cần nạp tiền để thanh toán số tiền: <span><fmt:formatNumber
                                                            value="${price}" type="number"/></span> </span> đ
                                                    </td>
                                                </c:if>
                                                <c:if test="${stt == 3}">
                                                    <td><i class="fa fa-check-circle-o green"></i><span class="ms-1"> Sản phẩm đã giao tới</span><br/>
                                                        <a href="javascript:$('#frmShipping${p.proID}').submit()" onclick="tai_lai_trang()">

                                                            Xác nhận là đã nhận sản phẩm.
                                                        </a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${stt == -1}">
                                                    <td>
                                                        <i class="fa fa-dot-circle-o text-danger"></i><span class="ms-1"> Bạn đã mất số tiền cộc là: <span><fmt:formatNumber
                                                            value="${p.startingPrice * 20/100}" type="number"/></span></span> đ
                                                    </td>
                                                </c:if>
                                                <c:if test="${stt == -3}">
                                                    <td>
                                                        <i class="fa fa-dot-circle-o text-danger"></i><span class="ms-1"> Chúng tôi xem sẽ xem xét đơn hàng này</span>
                                                    </td>
                                                </c:if>
                                                <c:if test="${stt == -2}">
                                                    <td>
                                                        <i class="fa fa-dot-circle-o text-danger"></i><span class="ms-1"> Người bán đã không giao hàng</span>
                                                    </td>
                                                </c:if>
                                                <c:if test="${stt == 4}">
                                                    <c:set var="TestFeedBack" scope="session" value="${0}"/>
                                                    <c:forEach items="${feedBackAll}" var="f">
                                                        <c:if test="${p.proID == f.proID }">
                                                            <c:set var="TestFeedBack" scope="session" value="${1}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${TestFeedBack ==1 }">
                                                        <td><i class="fa fa-check-circle-o green"></i><span class="ms-1"> Phản hồi cho người bán thành công!</span></td>
                                                    </c:if>
                                                    <c:if test="${TestFeedBack !=1 }">
                                                        <td><i class="fa fa-check-circle-o green"></i><span class="ms-1"> <a href="${pageContext.request.contextPath}/Account/FeedBack?idPro=${p.proID}&idUser=${authUser.id}">
                                                                Bạn có thể phản hồi cho người bán
                                                            </a></span></td>
                                                    </c:if>
                                                </c:if>
                                            </c:if>

                                            <td class="text-end"><span class="fw-bolder"><span><fmt:formatNumber
                                                    value="${p.highestPaidPrice}" type="number"/></span></span> đ</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/Product/DetailProductEnd?id=${p.proID}"><p style="color: blue">Xem</p></a>
                                            </td>
                                        </tr>
                                        <c:set var="test" scope="session" value="${0}"/>
                                    </c:if>
                                    <c:if test="${p.userID != authUser.id}">
                                        <c:set var="Test" scope="session" value="${0}"/>
                                        <tr>
                                            <td>${p.proID}</td>
                                            <td>${p.strDate}</td>
                                            <td>
                                                <i class="fa fa-dot-circle-o text-danger"></i><span class="ms-1"> Đấu giá thất bại!</span>
                                            </td>

                                            <td class="text-end"><span class="fw-bolder"><span><fmt:formatNumber
                                                    value="${a.price}" type="number"/></span></span> đ</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/Product/DetailProductEnd?id=${p.proID}"><p style="color: blue">Xem</p></a>
                                            </td>
                                        </tr>
                                        <c:set var="test" scope="session" value="${0}"/>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>

            </div>
            <c:if test="${Test == 1}">
                <div class="card-body">
                    <p class="card-text">Không có dữ liệu.</p>
                </div>
            </c:if>
        </div>
    </jsp:body>
</t:main>