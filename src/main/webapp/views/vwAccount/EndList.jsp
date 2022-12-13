<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="products" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="listAuction" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Auction>"/>
<jsp:useBean id="notices" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Notice>"/>

<t:main>
     <jsp:attribute name="css">
       <style>
           @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap');

           body {
               font-family: 'Open Sans', sans-serif;

           }

           .search {

               top: 6px;
               left: 10px;
           }

           .form-control {

               border: none;
               padding-left: 32px;
           }

           .form-control:focus {

               border: none;
               box-shadow: none;
           }

           .green {

               color: green;
           }
       </style>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script>
            function tai_lai_trang(){
                location.reload();
            }
        </script>

    </jsp:attribute>
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
            <c:set var="Test1" scope="session" value="${1}"/>
            <c:set var="test" scope="session" value="${0}"/>
            <div class="card-body">
                <div class="container  px-2">
                    <div class="table-responsive">
                        <table class="table table-responsive table-borderless">

                            <thead>
                            <tr class="bg-light">
                                <th scope="col" width="20%">Mã sản phẩm</th>
                                <th scope="col" width="20%">Thời gian kết thúc</th>
                                <th scope="col" width="20%">Tình trạng</th>
                                <th scope="col" width="20%">Số tiền được trả</th>
                                <th scope="col" class="text-end" width="20%"><span>Xem chi tiết</span></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="stt" scope="session" value="0"/>
                            <c:forEach items="${products}" var="p">
                                <c:if test="${p.userSellID == authUser.id}">
                                    <c:forEach items="${notices}" var="n">
                                        <c:if test="${n.idPro == p.proID}">
                                            <c:set var="test" scope="session" value="${1}"/>
                                            <c:set var="stt" scope="session" value="${n.stt}"/>
                                            <c:set var="price" scope="session" value="${n.price}"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:set var="Test1" scope="session" value="${0}"/>
                                    <tr>
                                        <form id="frmShipping${p.proID}" method="post"
                                              action="${pageContext.request.contextPath}/Admin/Product/End" hidden>
                                            <label>
                                                <input value="${p.proID}" name="idPro" hidden>
                                            </label>
                                            <label>
                                                <input value="1" name="ship" hidden>
                                            </label>
                                        </form>
                                        <td>${p.proID}</td>
                                        <td>${p.endDay}</td>
                                        <c:choose>
                                            <c:when test="${p.paid == 1}">
                                                <c:if test="${p.ship == -1}">
                                                    <td><i class="fa fa-dot-circle-o text-danger"></i><span
                                                            class="ms-1"> Bạn chưa giao hàng</span></td>
                                                </c:if>
                                                <c:if test="${p.ship == -2}">
                                                    <td><i class="fa fa-dot-circle-o text-danger"></i><span
                                                            class="ms-1"> Chúng tôi xem sẽ xem xét đơn hàng này</span></td>
                                                </c:if>
                                                <c:if test="${p.ship == 0}">
                                                    <td><i class="fa fa-check-circle-o green"></i><span class="ms-1"> Đã có người mua</span><br/>
                                                        <a href="javascript:$('#frmShipping${p.proID}').submit()">
                                                            Xác nhận là đã vận chuyển.
                                                        </a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${p.ship == 1}">
                                                    <td><i class="fa fa-check-circle-o green"></i><span class="ms-1"> Đã vận chuyển</span><br/>

                                                    </td>
                                                </c:if>
                                                <c:if test="${p.ship == 2}">
                                                    <td><i class="fa fa-check-circle-o green"></i><span class="ms-1"> Giao dịch thành công</span><br/>

                                                    </td>
                                                </c:if>
                                                <td class="text-end"><span
                                                        class="fw-bolder">${p.highestPaidPrice}</span></td>
                                            </c:when>
                                            <c:otherwise>
                                                <c:if test="${p.userID == -1}">
                                                    <td><i class="fa fa-dot-circle-o text-danger"></i><span
                                                            class="ms-1"> Không có người mua</span></td>
                                                    <td class="text-end"><span class="fw-bolder">0</span></td>
                                                </c:if>
                                                <c:if test="${test == 1}">
                                                    <c:if test="${stt == -1}">
                                                        <td><i class="fa fa-dot-circle-o text-danger"></i><span
                                                                class="ms-1"> Người mua không thanh toán</span></td>
                                                        <td class="text-end"><span class="fw-bolder">0</span></td>
                                                    </c:if>
                                                    <c:if test="${stt == 1}">
                                                        <td><i class="fa fa-dot-circle-o text-danger"></i><span
                                                                class="ms-1"> Đang chờ người mua thanh toán</span></td>
                                                        <td class="text-end"><span class="fw-bolder">0</span></td>
                                                    </c:if>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/Product/DetailProductEnd?id=${p.proID}">Xem</a>
                                        </td>
                                    </tr>
                                    <c:set var="test" scope="session" value="${0}"/>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>

                </div>
            </div>

            <c:if test="${Test1 == 1}">
                <p class="card-text">Không có dữ liệu.</p>
            </c:if>
        </div>
    </jsp:body>
</t:main>