<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="userList" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"
              integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"
                integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw=="
                crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script>
            const validateEmail = (email) => {
                return String(email)
                    .toLowerCase()
                    .match(
                        /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                    );
            };
            $('#frmUpdate').on('submit', function (e) {
                e.preventDefault();
                const address = $('#txtAddress').val();
                const email = $('#txtEmail').val();
                const dob = $('#txtDOB').val();
                const name = $('#txtName').val();
                const phone = $('#txtPhone').val();


                if (name.length === 0) {
                    alert('Tên không hợp lệ.')
                    return;
                }
                if (dob.length === 0) {
                    alert('Ngày tháng năm sinh không hợp lệ.')
                    return;
                }
                if (!validateEmail(email)) {
                    alert('Email không hợp lệ.')
                    return;
                }
                if (address.length === 0) {
                    alert('Địa chỉ không hợp lệ.')
                    return;
                }
                if (phone.length === 0) {
                    alert('Số điện thoại không hợp lệ.')
                    return;
                }

                $.getJSON('${pageContext.request.contextPath}/Account/IsAvailableEmail?email=' + email, function (data) {//Kiểm tra UserName có tồn tại không
                    if (data === true) {
                        alert('Cập nhật thành công.');
                        $('#frmUpdate').off('submit').submit();
                    } else {
                        alert('Email đã tồn tại.');
                    }
                });


            });
            $('#txtDOB').datetimepicker({
                format: 'd/m/Y',
                timepicker: false,
                mask: false
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <c:forEach items="${userList}" var="u">
            <c:if test="${u.id == authUser.id}">
                <div class="card">
                    <h4 class="card-header d-flex justify-content-between">
                        Cập nhật thông tin cá nhân
                    </h4>
                    <div class="card-body">
                        <section style="background-color: #eee;">
                            <div class="container py-5">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="card mb-4">
                                            <div class="card-body text-center">
                                                <img src="${pageContext.request.contextPath}/public/imgs/avatar/user.png"
                                                     alt="avatar"
                                                     class="rounded-circle img-fluid" style="width: 150px;">
                                                <h5 class="my-3">${u.name}</h5>
                                                <p class="text-muted mb-1">Người mua</p>
                                            </div>
                                        </div>
                                        <c:if test="${u.permission == 3 || u.permission == 2}">
                                            <div class="list-group list-group-flush">
                                                <a href="${pageContext.request.contextPath}/Account/UpdateBidder"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i>
                                                    Cập nhật thông tin cá nhân</a>
                                                <a href="${pageContext.request.contextPath}/Account/UpdatePassword"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i>
                                                    Thay đổi mật khẩu</a>
                                                <a href="${pageContext.request.contextPath}/Account/WatchList"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i>
                                                    Danh sách sản phầm yêu thích</a>
                                                <c:choose>
                                                    <c:when test="${u.permission == 2}">
                                                        <a class="list-group-item list-group-item-action"><i
                                                                class="fa fa-caret-right"
                                                                aria-hidden="true"></i>
                                                            Đang chờ duyệt yêu cầu...</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="javascript:$('#frmAccountPermission').submit()"
                                                           class="list-group-item list-group-item-action"><i
                                                                class="fa fa-caret-right"
                                                                aria-hidden="true"></i> Yêu cầu
                                                            nâng
                                                            cấp thành người bán</a>
                                                    </c:otherwise>
                                                </c:choose>
                                                <a href="${pageContext.request.contextPath}/Account/AuctionList"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i> Sản phẩm đang
                                                    đấu giá </a>
                                                <a href="${pageContext.request.contextPath}/Account/SuccessList"
                                                   class="list-group-item list-group-item-action">
                                                    <i class="fa fa-caret-right" aria-hidden="true"></i> Sản phẩm
                                                    đấu giá thành công</a>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <form action="" method="post" id="frmUpdate">
                                                    <div class="col-sm-3" hidden>
                                                        <label for="txtIdUser">IdUser</label>
                                                    </div>
                                                    <div class="col-sm-9" hidden>
                                                        <input type="number" class="form-control" id="txtIdUser"
                                                               name="id" value="${u.id}">
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <label for="txtName"><strong>Tên</strong></label>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control" id="txtName"
                                                                   name="name" value="${u.name}">
                                                        </div>

                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <label for="txtEmail"><strong>Email</strong></label>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control" id="txtEmail"
                                                                   name="email" value="${u.email}">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <label for="txtPhone"><strong>Số điện thoại</strong></label>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control" id="txtPhone"
                                                                   name="phone" value="${u.phone}">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <label for="txtDOB"><strong>Ngày tháng năm
                                                                sinh</strong></label>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <input type="text"
                                                                   value="<fmt:formatDate value="${u.dob}" pattern="dd/MM/yyyy"/>"
                                                                   class="form-control" id="txtDOB" name="dob">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <label for="txtAddress"><strong>Địa chỉ</strong></label>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control" id="txtAddress"
                                                                   name="address" value="${u.address}">
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <button type="submit" class="btn btn-primary">
                                                        <i class="fa fa-check" aria-hidden="true"></i>
                                                        Cập nhật
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </jsp:body>
</t:main>