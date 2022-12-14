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
                            <strong class="text-sm mb-0 text-capitalize">S??? l?????ng t??i kho???n</strong>
                            <h5 class="mb-0">${listUser.size()} T??i kho???n</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">S??? l?????ng s???n ph???m</strong>
                            <h5 class="mb-0">${listPro0.size() + listPro1.size()} S???n ph???m</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">S??? l?????ng s???n ph???m ??ang b??n</strong>
                            <h5 class="mb-0">${listPro0.size()} S???n ph???m</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">S??? l?????ng nh??m lo???i s???n ph???m</strong>
                            <h5 class="mb-0">${listGrCat.size()} Nh??m</h5>
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
                            <strong class="text-sm mb-0 text-capitalize">S??? l?????ng giao d???ch th??nh c??ng</strong>
                            <h5 class="mb-0">${UserThanhCong} Giao d???ch</h5>
                        </div>
                    </div>
                    <hr class="dark horizontal my-0">
                    <div class="card-footer p-3">
                        <p class="mb-0"><span class="text-success text-sm font-weight-bolder">+<span><fmt:formatNumber
                                value="${MoneyThanhCong}" type="number"/> ??</span> </span></p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">S??? l?????ng giao d???ch vi ph???m</strong>
                            <h5 class="mb-0">${NoUser1} Giao d???ch</h5>
                        </div>
                    </div>
                    <hr class="dark horizontal my-0">
                    <div class="card-footer p-3">
                        <p class="mb-0"><span class="text-danger text-sm font-weight-bolder">+<span><fmt:formatNumber
                                value="${MoneyNoUser1}" type="number"/> ??</span></span></p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">?????u gi?? kh??ng ai tham gia</strong>
                            <h5 class="mb-0">${NoUser} Giao d???ch</h5>
                        </div>
                    </div>
                    <hr class="dark horizontal my-0">
                    <div class="card-footer p-3">
                        <p class="mb-0"><span class=" text-sm font-weight-bolder" style="color: #7a7a7a">+<span><fmt:formatNumber
                                value="${MoneyNoUser}" type="number"/> ??</span></span></p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6">
                <div class="card">
                    <div class="card-header p-3 pt-2">
                        <div class="text-end pt-1">
                            <strong class="text-sm mb-0 text-capitalize">S??? l?????ng giao d???ch ??ang x??? l??</strong>
                            <h5 class="mb-0">${NoUser2} Giao d???ch</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>
        <h2>Nh???ng s???n ph???m v???a k???t th??c</h2>
        <br/>
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">M?? s???n ph???m</th>
                <th scope="col">T??n</th>
                <th scope="col">Th???i gian k???t th??c</th>
                <th scope="col">Ng?????i b??n</th>
                <th scope="col">Ng?????i mua</th>
                <th scope="col">Ti???n ?????u gi?? th???ng</th>
                <th scope="col">T??nh tr???ng</th>
                <th scope="col">Ph?? thu</th>
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
                        <c:set var="userBuy" value="Kh??ng c??"/>
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
                                value="${p.highestPaidPrice}" type="number"/> ??</span></td>
                        <c:set value="0" var="NoUser"/>
                        <c:if test="${p.userID == -1}">
                            <td>Kh??ng c?? ai tham gia ?????u gi??</td>
                            <td><span style="color: #7a7a7a;">+<fmt:formatNumber
                                    value="${p.startingPrice * 20/100}" type="number"/> ??</span></td>
                            <c:set value="1" var="NoUser"/>
                        </c:if>
                        <c:if test="${stt == -3}">
                            <td>Ng?????i mua ch??a nh???n ???????c h??ng<br/>
                                <p>Admin c???n xem x??t </p></td>
                            <td style="color: #E6ED0DFE">+0 ??</td>
                        </c:if>
                        <c:if test="${stt == -2 && NoUser == 0 }">
                            <td>Ng?????i b??n kh??ng giao h??ng</td>
                            <td><span style="color: red">+<fmt:formatNumber
                                    value="${p.startingPrice * 20/100}" type="number"/> ??</span></td>
                        </c:if>
                        <c:if test="${stt == -1}">
                            <td>Ng?????i mua kh??ng thanh to??n</td>
                            <td><span style="color: red">+<fmt:formatNumber
                                    value="${p.startingPrice * 20/100}" type="number"/> ??</span></td>
                        </c:if>
                        <c:if test="${stt == 1}">
                            <td>??ang ch??? ng?????i mua than to??n</td>
                            <td style="color: #E6ED0DFE">+0 ??</td>
                        </c:if>
                        <c:if test="${stt == 2}">
                            <td>??ang ch??? ng?????i b??n giao h??ng</td>
                            <td style="color: #E6ED0DFE">+0 ??</td>
                        </c:if>
                        <c:if test="${stt == 3}">
                            <td>??ang ch??? ng?????i mua x??c nh???n</td>
                            <td style="color: rgba(230,237,13,1)">+0 ??</td>
                        </c:if>
                        <c:if test="${stt == 4}">
                            <td>????n h??ng ???? giao d???ch th??nh c??ng<br/>
                                <a>Admin c???n chuy???n ti???n </a></td>

                            <td><span style="color: #0cf10e">+<fmt:formatNumber
                                    value="${p.highestPaidPrice  * 20/100}" type="number"/> ??</span></td>
                        </c:if>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </jsp:body>
</t:admin>