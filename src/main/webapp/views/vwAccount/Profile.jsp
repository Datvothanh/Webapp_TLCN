<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="userList" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<jsp:useBean id="bankList" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Bank>"/>
<t:main>
    <jsp:body>
        <c:set var="test" value="0"/>
        <c:forEach items="${userList}" var="u">
            <c:if test="${u.id == authUser.id}">
                <c:if test="${u.permission == 1}">
                    <c:forEach items="${bankList}" var="b">
                        <c:if test="${b.idUser == u.id}">
                            <c:set var="test" value="1"/>
                        </c:if>
                    </c:forEach>
                    <div class="card">
                        <h4 class="card-header">
                            Quản lý cá nhân
                        </h4>
                        <div class="card-body" >
                            <section style="background-color: #eee;">
                                <div class="container py-5">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="card mb-4">
                                                <div class="card-body text-center">
                                                    <img src="${pageContext.request.contextPath}/public/imgs/avatar/user.png" alt="avatar"
                                                         class="rounded-circle img-fluid" style="width: 150px;">

                                                    <h5 class="my-3">${u.name}</h5>
                                                </div>
                                            </div>
                                            <div class="list-group list-group-flush">
                                                <a href="${pageContext.request.contextPath}/Account/Profile"
                                                   class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                                     aria-hidden="true"></i>
                                                    Thông tin cá nhân</a>

                                                <a href="${pageContext.request.contextPath}/Account/UpdateInfo"
                                                   class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                                     aria-hidden="true"></i>
                                                    Cập nhật thông tin cá nhân</a>


                                                <a href="${pageContext.request.contextPath}/Account/UpdatePassword"
                                                   class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                                     aria-hidden="true"></i>
                                                    Thay đổi mật khẩu</a>


                                                <c:choose>
                                                    <c:when test="${test == 1}">
                                                        <a href="${pageContext.request.contextPath}/Admin/Product/AddOfSeller"
                                                           class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                                             aria-hidden="true"></i>
                                                            Tạo sản phẩm muốn bán </a>
                                                        <c:set var="test" value="1"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="list-group-item list-group-item-action" data-toggle="modal" data-target="#exampleModal">
                                                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                                                            Tạo sản phẩm muốn bán </a>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Cập nhật thêm thông tin ngân hàng!
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <c:set var="test" value="1"/>
                                                    </c:otherwise>
                                                </c:choose>

                                                <a href="${pageContext.request.contextPath}/Account/SellingList"
                                                   class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                                     aria-hidden="true"></i>
                                                    Sản phẩm đang bán </a>
                                                <a href="${pageContext.request.contextPath}/Account/EndingList"
                                                   class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                                     aria-hidden="true"></i>
                                                    Sản phẩm bán đã kết thúc </a>
                                                <a href="${pageContext.request.contextPath}/Account/WatchList"
                                                   class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                                     aria-hidden="true"></i>
                                                    Sản phầm yêu thích</a>
                                                <a href="${pageContext.request.contextPath}/Account/AuctionList"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i> Sản phẩm đang tham gia đấu giá </a>
                                                <a href="${pageContext.request.contextPath}/Account/SuccessList"
                                                   class="list-group-item list-group-item-action">
                                                    <i class="fa fa-caret-right" aria-hidden="true"></i>
                                                    Sản phẩm đấu giá kết thúc</a>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="card mb-4">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <strong class="mb-0">Tên</strong>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <p class="text-muted mb-0">${u.name}</p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <strong class="mb-0">Email</strong>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <p class="text-muted mb-0">${u.email}</p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <strong class="mb-0">Số điện thoại</strong>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <p class="text-muted mb-0">${u.phone}</p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <strong class="mb-0">Ngày tháng năm sinh</strong>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <p class="text-muted mb-0"><fmt:formatDate value="${u.dob}" pattern="dd/MM/yyyy"/></p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <strong class="mb-0">Địa chỉ</strong>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <p class="text-muted mb-0">${u.address}</p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <c:forEach items="${bankList}" var="b">
                                                        <c:if test="${b.idUser == u.id}">
                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <strong class="mb-0">Ngân hàng</strong>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                    <p class="text-muted mb-0">${b.bank}</p>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-4">
                                                                    <strong class="mb-0">Số tài khoản</strong>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                    <p class="text-muted mb-0">${b.idBank}</p>
                                                                </div>
                                                            </div>
                                                            <c:set var="test" value="1"/>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </c:if>

            </c:if>
        </c:forEach>
    </jsp:body>
</t:main>