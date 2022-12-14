<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="listAuction" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Auction>"/>
<jsp:useBean id="productAll" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="feedBackAll" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.FeedBack>"/>
<jsp:useBean id="listNotices" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Notice>"/>
<jsp:useBean id="listUsers" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<t:admin>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                Sản phẩm kết thúc
            </h4>
            <div class="card-body">
                 <c:set var="Test" scope="session" value="${1}"/>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">Mã sản phẩm</th>
                        <th scope="col">Tên</th>
                        <th scope="col">Thời gian kết thúc</th>
                        <th scope="col">Người bán</th>
                        <th scope="col">Người mua</th>
                        <th scope="col">Tiền đấu giá thắng</th>
                        <th scope="col">Tình trạng</th>
                        <th scope="col">Phí thu</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${productAll}" var="p">
                        <c:set var="Test" scope="session" value="${0}"/>
                        <c:forEach items="${listUsers}" var="u">
                            <c:if test="${p.userSellID == u.id}">
                                <c:set var="userSell" value="${u.name}"/>
                            </c:if>
                            <c:if test="${p.userID == u.id}">
                                <c:set var="userBuy" value="${u.name}"/>
                            </c:if>
                            <c:if test="${p.userID == -1}">
                                <c:set var="userBuy" value="Không có"/>
                            </c:if>
                        </c:forEach>
                        <c:forEach items="${listNotices}" var="n">
                            <c:if test="${n.idPro == p.proID }">
                                <c:set var="stt" value="${n.stt}"/>
                            </c:if>
                        </c:forEach>
                        <tr>
                            <td>${p.proID}</td>
                            <td>${p.proName}</td>
                            <td>${p.strDate}</td>
                            <td>${userSell}</td>
                            <td>${userBuy}</td>
                            <td><span><fmt:formatNumber
                                    value="${p.highestPaidPrice}" type="number"/> đ</span></td>
                            <c:set value="0" var="NoUser"/>
                            <c:if test="${p.userID == -1}">
                                <td>Không có ai tham gia đấu giá</td>
                                <td><span style="color: #7a7a7a;">+<fmt:formatNumber
                                        value="${p.startingPrice * 20/100}" type="number"/> đ</span></td>
                                <c:set value="1" var="NoUser"/>
                            </c:if>
                            <c:if test="${stt == -3}">
                                <td>Người mua chưa nhận được hàng<br/>
                                    <p>Admin cần xem xét </p></td>
                                <td style="color: #E6ED0DFE">+0 đ</td>
                            </c:if>
                            <c:if test="${stt == -2 && NoUser == 0 }">
                                <td>Người bán không giao hàng</td>
                                <td><span style="color: red">+<fmt:formatNumber
                                        value="${p.startingPrice * 20/100}" type="number"/> đ</span></td>
                            </c:if>
                            <c:if test="${stt == -1}">
                                <td>Người mua không thanh toán</td>
                                <td><span style="color: red">+<fmt:formatNumber
                                        value="${p.startingPrice * 20/100}" type="number"/> đ</span></td>
                            </c:if>
                            <c:if test="${stt == 1}">
                                <td>Đang chờ người mua than toán</td>
                                <td style="color: #E6ED0DFE">+0 đ</td>
                            </c:if>
                            <c:if test="${stt == 2}">
                                <td>Đang chờ người bán giao hàng</td>
                                <td style="color: #E6ED0DFE">+0 đ</td>
                            </c:if>
                            <c:if test="${stt == 3}">
                                <td>Đang chờ người mua xác nhận</td>
                                <td style="color: rgba(230,237,13,1)">+0 đ</td>
                            </c:if>
                            <c:if test="${stt == 4}">
                                <td>Đơn hàng đã giao dịch thành công<br/>
                                    <a>Admin cần chuyển tiền </a></td>

                                <td><span style="color: #0cf10e">+<fmt:formatNumber
                                        value="${p.highestPaidPrice  * 20/100}" type="number"/> đ</span></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <c:if test="${Test == 1}">
                <div class="card-body">
                    <p class="card-text">Không có dữ liệu.</p>
                </div>
            </c:if>
        </div>
    </jsp:body>
</t:admin>