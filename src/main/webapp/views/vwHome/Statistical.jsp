<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="listUser" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<jsp:useBean id="listPro0" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="listPro1" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="listGrCat" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.GroupCategory>"/>
<jsp:useBean id="listAuction" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Auction>"/>
<jsp:useBean id="productAll" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="listNotices" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Notice>"/>
<t:admin>
    <jsp:body>
        <c:set var="NoUser2" value="0"/>
        <c:set var="NoUser1" value="0"/>
        <c:set var="MoneyNoUser1" value="0"/>
        <c:set var="NoUser" value="0"/>
        <c:set var="MoneyNoUser" value="0"/>
        <c:set var="UserThanhCong" value="0"/>
        <c:set var="MoneyThanhCong" value="0"/>
        <c:forEach items="${productAll}" var="p">
            <c:forEach items="${listNotices}" var="n">
                <c:if test="${n.idPro == p.proID }">
                    <c:set var="stt" value="${n.stt}"/>
                </c:if>
            </c:forEach>

                <c:if test="${p.userID == -1}">
                    <c:set var="NoUser" value="${NoUser + 1}"/>
                    <c:set var="MoneyNoUser" value="${MoneyNoUser + p.startingPrice * 20/100 }"/>
                </c:if>
                <c:if test="${stt == -3}">
                    <c:set var="NoUser2" value="${NoUser2 + 1}"/>
                </c:if>
                <c:if test="${stt == -2 && NoUser == 0 }">
                    <c:set var="NoUser1" value="${NoUser1 + 1}"/>
                    <c:set var="MoneyNoUser1" value="${MoneyNoUser1 + p.startingPrice * 20/100 }"/>
                </c:if>
                <c:if test="${stt == -1}">
                    <c:set var="NoUser1" value="${NoUser1 + 1}"/>
                    <c:set var="MoneyNoUser1" value="${MoneyNoUser1 + p.startingPrice * 20/100 }"/>
                </c:if>
                <c:if test="${stt == 1}">
                    <c:set var="NoUser2" value="${NoUser2 + 1}"/>
                </c:if>
                <c:if test="${stt == 2}">
                    <c:set var="NoUser2" value="${NoUser2 + 1}"/>
                </c:if>
                <c:if test="${stt == 3}">
                    <c:set var="NoUser2" value="${NoUser2 + 1}"/>
                </c:if>
                <c:if test="${stt == 4}">
                    <c:set var="UserThanhCong" value="${UserThanhCong + 1}"/>
                    <c:set var="MoneyThanhCong" value="${MoneyThanhCong + p.highestPaidPrice  * 20/100}"/>
                </c:if>
        </c:forEach>
        <!-- End Navbar -->
        <div class="container-fluid py-4">
        <div class="row">
            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">Số lượng tài khoản</strong>
                            <h5 class="mb-0">${listUser.size()} Tài khoản</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">Số lượng sản phẩm</strong>
                            <h5 class="mb-0">${listPro0.size() + listPro1.size()} Sản phẩm</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">Số lượng sản phẩm đang bán</strong>
                            <h5 class="mb-0">${listPro0.size()} Sản phẩm</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">Số lượng nhóm loại sản phẩm</strong>
                            <h5 class="mb-0">${listGrCat.size()} Nhóm</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>
        <div class="row">
            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">Số lượng giao dịch thành công</strong>
                            <h5 class="mb-0">${UserThanhCong} Giao dịch</h5>
                        </div>
                    </div>
                    <hr class="dark horizontal my-0">
                    <div class="card-footer p-3">
                        <p class="mb-0"><span class="text-success text-sm font-weight-bolder">+<span><fmt:formatNumber
                                value="${MoneyThanhCong}" type="number"/> đ</span> </span></p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">Số lượng giao dịch vi phạm</strong>
                            <h5 class="mb-0">${NoUser1} Giao dịch</h5>
                        </div>
                    </div>
                    <hr class="dark horizontal my-0">
                    <div class="card-footer p-3">
                        <p class="mb-0"><span class="text-danger text-sm font-weight-bolder">+<span><fmt:formatNumber
                                value="${MoneyNoUser1}" type="number"/> đ</span></span></p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">Đấu giá không ai tham gia</strong>
                            <h5 class="mb-0">${NoUser} Giao dịch</h5>
                        </div>
                    </div>
                    <hr class="dark horizontal my-0">
                    <div class="card-footer p-3">
                        <p class="mb-0"><span class=" text-sm font-weight-bolder" style="color: #7a7a7a">+<span><fmt:formatNumber
                                value="${MoneyNoUser}" type="number"/> đ</span></span></p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">Số lượng giao dịch đang xử lý</strong>
                            <h5 class="mb-0">${NoUser2} Giao dịch</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>
        <h2>Những sản phẩm vừa kết thúc</h2>
        <br/>
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">STT</th>
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
            <c:set var="ST" value="${0}"/>
            <c:forEach items="${productAll}" var="p">
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
                <c:if test="${ST < 5}">
                    <tr>
                        <c:set var="ST" value="${ST + 1}"/>
                        <td>${ST}</td>
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
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </jsp:body>
</t:admin>