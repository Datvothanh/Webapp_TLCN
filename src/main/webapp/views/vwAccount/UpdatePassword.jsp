<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="userList" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<jsp:useBean id="bankList" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Bank>"/>
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

            $('#frmUpdatePassword').on('submit', function (e) {
                e.preventDefault();
                const newPassword = $('#txtNewPassword').val();
                const confirmPassword = $('#txtConfirmPassword').val();
                const oldPassword = $('#txtOldPassword').val();
                const idUser = $('#txtIdUser').val();
                if (newPassword.length === 0) {
                    alert('Mật khẩu mới không hợp lệ.')
                    return;
                }
                if (confirmPassword.length === 0) {
                    alert('Xác nhận mật khẩu không hợp lệ.')
                    return;
                }
                if (newPassword !== confirmPassword) {
                    alert('Xác nhận mật khẩu chưa đúng.')
                    return;
                }

                <%--    //Thêm các điều kiện khi đăng ký tài khoản--%>

                $.getJSON('${pageContext.request.contextPath}/Account/IsAvailablePassword?password=' + newPassword + '&idUser=' + idUser, function (data) {//Kiểm tra UserName có tồn tại không
                    if (data === true) {
                        alert('Cập nhật thành công.');
                        $('#frmUpdatePassword').off('submit').submit();
                    } else {
                        alert('Mật khẩu phải khác với mật khẩu củ.');
                    }
                });


            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <c:set var="test" value="0"/>
        <c:forEach items="${userList}" var="u">
            <c:if test="${u.id == authUser.id}">
                <c:forEach items="${bankList}" var="b">
                    <c:if test="${b.idUser == u.id}">
                        <c:set var="test" value="1"/>
                    </c:if>
                </c:forEach>
                <div class="card">
                    <h4 class="card-header d-flex justify-content-between">
                        Cập nhật mật khẩu
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
                                            </div>
                                        </div>
                                        <c:if test="${u.permission == 1}">
                                            <div class="list-group list-group-flush">
                                                <a href="${pageContext.request.contextPath}/Account/Profile"
                                                   class="list-group-item list-group-item-action"><i class="fa fa-caret-right"
                                                                                                     aria-hidden="true"></i>
                                                    Thông tin cá nhân</a>
                                                <a href="${pageContext.request.contextPath}/Account/UpdateInfo"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i>
                                                    Cập nhật thông tin cá nhân</a>

                                                <a href="${pageContext.request.contextPath}/Account/UpdatePassword"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i>
                                                    Thay đổi mật khẩu</a>


                                                <c:choose>
                                                    <c:when test="${test == 1}">
                                                        <a href="${pageContext.request.contextPath}/Admin/Product/AddOfSeller"
                                                           class="list-group-item list-group-item-action"><i
                                                                class="fa fa-caret-right"
                                                                aria-hidden="true"></i>
                                                            Tạo sản phẩm muốn bán </a>
                                                        <c:set var="test" value="1"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="list-group-item list-group-item-action"
                                                           data-toggle="modal" data-target="#exampleModal">
                                                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                                                            Tạo sản phẩm muốn bán </a>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="exampleModal" tabindex="-1"
                                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">
                                                                            Thông báo</h5>
                                                                        <button type="button" class="close"
                                                                                data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Cập nhật thêm thông tin ngân hàng!
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-dismiss="modal">Đóng
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <c:set var="test" value="1"/>
                                                    </c:otherwise>
                                                </c:choose>

                                                <a href="${pageContext.request.contextPath}/Account/SellingList"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i>
                                                    Sản phẩm đang bán </a>
                                                <a href="${pageContext.request.contextPath}/Account/EndingList"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i>
                                                    Sản phẩm bán đã kết thúc </a>
                                                <a href="${pageContext.request.contextPath}/Account/WatchList"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i>
                                                    Sản phầm yêu thích</a>
                                                <a href="${pageContext.request.contextPath}/Account/AuctionList"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i> Sản phẩm đang tham gia đấu giá </a>
                                                <a href="${pageContext.request.contextPath}/Account/SuccessList"
                                                   class="list-group-item list-group-item-action">
                                                    <i class="fa fa-caret-right" aria-hidden="true"></i> Sản phẩm đấu giá kết thúc</a>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <form action="" method="post" id="frmUpdatePassword">
                                                    <div class="col-sm-3">
                                                        <label for="txtIdUser" hidden>IdUser</label>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <input type="number" class="form-control" id="txtIdUser"
                                                               name="id" value="${u.id}" hidden>
                                                        <input type="text" class="form-control" id="txtOldPassword"
                                                               value="${u.password}" hidden>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <label for="txtNewPassword">Mật khẩu mới</label>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <input type="password" class="form-control"
                                                                   id="txtNewPassword" name="newPassword">
                                                        </div>

                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <label for="txtConfirmPassword">Xác nhận mật khẩu</label>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <input type="password" class="form-control"
                                                                   id="txtConfirmPassword" name="confirmPassword">
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