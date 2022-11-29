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

            $('#frmUpdateBank').on('submit', function (e) {
                e.preventDefault();
                const inputBank = $('#inputBank').val();
                const idBank = $('#idBank').val();

                if (idBank.length === 0) {
                    alert('Số tài khoản không hợp lệ.')
                    return;
                }
                if (inputBank.length === 0) {
                    alert('Ngân hàng không hợp lệ.')
                    return;
                }

            <%--    //Thêm các điều kiện khi đăng ký tài khoản--%>

                alert('Cập nhật thành công.');
                $('#frmUpdateBank').off('submit').submit();
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <c:forEach items="${userList}" var="u">
            <c:if test="${u.id == authUser.id}">
                <div class="card">
                    <h4 class="card-header d-flex justify-content-between">
                        Cập nhật thông tin ngân hàng
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
                                                <form action="" method="post" id="frmUpdateBank">
                                                    <div class="col-sm-3">
                                                        <label  for="txtIdUser" hidden>IdUser</label>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <input type="number" class="form-control" id="txtIdUser" name="id" value="${u.id}" hidden>
                                                    </div>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <label for="inputBank">Ngân hàng</label>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <select id="inputBank" class="form-control" name="inputBank">
                                                            <option selected>Chọn ngân hàng</option>
                                                            <option>Agribank</option>
                                                            <option>VietcomBank</option>
                                                            <option>BIDV</option>
                                                            <option>Vietinbank</option>
                                                            <option>Techcombank</option>
                                                            <option>HD Bank</option>
                                                            <option>OCB</option>
                                                            <option>SCB</option>
                                                            <option>Sacombank</option>
                                                            <option>Dong A bank</option>
                                                            <option>ACB</option>
                                                            <option>SaigonBank</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <label  for="idBank">Số tài khoản</label>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" id="idBank" name="idBank" >
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