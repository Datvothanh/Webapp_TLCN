<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="userList" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<t:main>
    <jsp:body>
        <c:forEach items="${userList}" var="u">
            <c:if test="${u.id == authUser.id}">

                <c:if test="${u.permission == 1}">
                    <div class="card">
                        <h4 class="card-header">
                            Profile
                        </h4>
                        <div class="card-body">
                            <section style="background-color: #eee;">
                                <div class="container py-5">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="card mb-4">
                                                <div class="card-body text-center">
                                                    <img src="${pageContext.request.contextPath}/public/imgs/avatar/user.png" alt="avatar"
                                                         class="rounded-circle img-fluid" style="width: 150px;">

                                                    <h5 class="my-3">${u.name}</h5>
                                                    <p class="text-muted mb-1">Người bán</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="card mb-4">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Tên</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">${u.name}</p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Email</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">${u.email}</p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Phone</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">${u.phone}</p>
                                                        </div>
                                                    </div>
                                                    <hr>,
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Ngày tháng năm sinh</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0"><fmt:formatDate value="${u.dob}" pattern="dd/MM/yyyy"/></p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Địa chỉ</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">${u.address}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </section>
                            <div class="card mt-3">
                                <h4 class="card-header">
                                    <i class="bi bi-list"></i>
                                    Danh mục người dùng
                                </h4>
                                <div class="list-group list-group-flush">
                                    <a href="${pageContext.request.contextPath}/Account/Recharge"
                                       class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                         aria-hidden="true"></i>
                                        Hướng dẫn nạp tiền vào tài khoản</a>
                                    <a href="${pageContext.request.contextPath}/Account/Update"
                                       class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                         aria-hidden="true"></i>
                                        Cập nhật thông tin cá nhân</a>
                                    <a href="${pageContext.request.contextPath}/Account/UpdatePassword"
                                       class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                         aria-hidden="true"></i>
                                        Thay đổi mật khẩu</a>
                                    <a href="${pageContext.request.contextPath}/Admin/Product/Add"
                                       class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                         aria-hidden="true"></i>
                                        Tạo sản phẩm muốn bán </a>
                                    <a href="${pageContext.request.contextPath}/Account/SellingList"
                                       class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                         aria-hidden="true"></i>
                                        Danh sách sản phẩm đang bán </a>
                                    <a href="${pageContext.request.contextPath}/Account/EndingList"
                                       class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                         aria-hidden="true"></i>
                                        Danh sách sản phẩm đã kết thúc </a>
                                    <a href="${pageContext.request.contextPath}/Account/WatchList"
                                       class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                         aria-hidden="true"></i>
                                        Danh sách sản phầm yêu thích</a>
                                        <%--                                <a href="${pageContext.request.contextPath}/Admin/Product/Add"--%>
                                        <%--                                   class="list-group-item list-group-item-action"><i class="fa fa-caret-right"--%>
                                        <%--                                                                                     aria-hidden="true"></i>--%>
                                        <%--                                    Danh sách sản phẩm đã được đấu giá </a>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${u.permission == 3 || u.permission == 2}">
                    <div class="card">
                        <h4 class="card-header">
                            Profile
                        </h4>
                        <div class="card-body">
                            <section style="background-color: #eee;">
                                <div class="container py-5">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="card mb-4">
                                                <div class="card-body text-center">
                                                    <img src="${pageContext.request.contextPath}/public/imgs/avatar/user.png" alt="avatar"
                                                         class="rounded-circle img-fluid" style="width: 150px;">
                                                    <h5 class="my-3">${u.name}</h5>
                                                    <p class="text-muted mb-1">Người mua</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="card mb-4">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Tên</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">${u.name}</p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Email</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">${u.email}</p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Số điện thoại</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">${u.phone}</p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Ngày tháng năm sinh</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0"><fmt:formatDate value="${u.dob}" pattern="dd/MM/yyyy"/></p>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Địa chỉ</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">${u.address}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </section>
                            <div class="card mt-3">
                                <h4 class="card-header">
                                    <i class="bi bi-list"></i>
                                    Danh mục người dùng
                                </h4>
                                <form id="frmAccountPermission" method="post"
                                      action="${pageContext.request.contextPath}/Account/UpdatePermission">
                                    <label>
                                        <input value="${u.id}" name="idUser"
                                               hidden>
                                    </label>
                                    <label>
                                        <input value="2" name="permission" hidden>
                                    </label>
                                </form>
                                <div class="list-group list-group-flush">
                                    <a href="${pageContext.request.contextPath}/Account/Recharge"
                                       class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                         aria-hidden="true"></i>
                                        Hướng dẫn nạp tiền vào tài khoản</a>
                                    <a href="${pageContext.request.contextPath}/Account/Update"
                                       class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                         aria-hidden="true"></i>
                                        Cập nhật thông tin cá nhân</a>
                                    <a href="${pageContext.request.contextPath}/Account/UpdatePassword"
                                       class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                         aria-hidden="true"></i>
                                        Thay đổi mật khẩu</a>
                                    <a href="${pageContext.request.contextPath}/Account/WatchList"
                                       class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                         aria-hidden="true"></i>
                                        Danh sách sản phầm yêu thích</a>
                                    <c:choose>
                                        <c:when test="${u.permission == 2}">
                                            <a class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                                 aria-hidden="true"></i>
                                                Đang chờ duyệt yêu cầu nâng
                                                cấp thành người bán</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="javascript:$('#frmAccountPermission').submit()"
                                               class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                                 aria-hidden="true"></i> Yêu cầu
                                                nâng
                                                cấp thành người bán</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="${pageContext.request.contextPath}/Account/AuctionList" class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                                  aria-hidden="true"></i> Sản phẩm đang
                                    đấu giá </a>
                                    <a href="${pageContext.request.contextPath}/Account/SuccessList" class="list-group-item list-group-item-action">
                                       <i class="fa fa-caret-right" aria-hidden="true"></i> Sản phẩm
                                            đấu giá thành công</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:if>
        </c:forEach>
    </jsp:body>
</t:main>