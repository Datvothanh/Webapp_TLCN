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

            $('#frmUpdatePassword').on('submit', function (e) {
                e.preventDefault();
                const newPassword= $('#txtNewPassword').val();
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

                $.getJSON('${pageContext.request.contextPath}/Account/IsAvailablePassword?password=' + newPassword + '&idUser=' + idUser , function (data) {//Kiểm tra UserName có tồn tại không
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
        <c:forEach items="${userList}" var="u">
            <c:if test="${u.id == authUser.id}">
                <div class="card">
                    <h4 class="card-header d-flex justify-content-between">
                        Cập nhật thông tin cá nhân
                        <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Account/Profile"
                           role="button">
                            <i class="bi bi-backspace-fill" aria-hidden="true"></i>
                            Trở về
                        </a>
                    </h4>
                    <div class="card-body">
                        <section style="background-color: #eee;">
                            <div class="container py-5">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="card mb-4">
                                            <div class="card-body text-center">
                                                <img src="${pageContext.request.contextPath}/public/imgs/avatar/${u.id}/main.jpg" alt="avatar"
                                                     class="rounded-circle img-fluid" style="width: 150px;">
                                                <h5 class="my-3">${u.name}</h5>
                                            <c:choose>
                                                <c:when test="${u.permission == 3 || u.permission == 2}">
                                                    <p class="text-muted mb-1">Người mua</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="text-muted mb-1">Người bán</p>
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <form action="" method="post" id="frmUpdatePassword">
                                                    <div class="col-sm-3">
                                                        <label  for="txtIdUser" hidden>IdUser</label>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <input type="number" class="form-control" id="txtIdUser" name="id" value="${u.id}" hidden>
                                                        <input type="text" class="form-control" id="txtOldPassword"  value="${u.password}" hidden>
                                                    </div>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <label  for="txtNewPassword">Mật khẩu mới</label>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <input type="password" class="form-control" id="txtNewPassword" name="newPassword">
                                                    </div>

                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <label  for="txtConfirmPassword">Xác nhận mật khẩu</label>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <input type="password" class="form-control" id="txtConfirmPassword" name="confirmPassword" >
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