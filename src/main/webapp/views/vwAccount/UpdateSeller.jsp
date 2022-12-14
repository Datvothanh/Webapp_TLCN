<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="userList" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<jsp:useBean id="bankList" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Bank>"/>
<jsp:useBean id="listBanks" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.ListBank>"/>
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
                const inputBank = $('#inputBank').val();
                const idBank = $('#idBank').val();
                if (inputBank.length !== 0 && idBank.length === 0 || inputBank.length === 0 && idBank.length !== 0) {
                    alert('Th??ng tin t??i kho???n ng??n h??ng c???n nh???p ?????y ?????.')
                    return;
                }
                if (name.length === 0) {
                    alert('T??n kh??ng h???p l???.')
                    return;
                }
                if (dob.length === 0) {
                    alert('Ng??y th??ng n??m sinh kh??ng h???p l???.')
                    return;
                }
                if (!validateEmail(email)) {
                    alert('Email kh??ng h???p l???.')
                    return;
                }
                if (address.length === 0) {
                    alert('?????a ch??? kh??ng h???p l???.')
                    return;
                }
                if (phone.length === 0) {
                    alert('S??? ??i???n tho???i kh??ng h???p l???.')
                    return;
                }

                $.getJSON('${pageContext.request.contextPath}/Account/IsAvailableEmail?email=' + email, function (data) {//Ki???m tra UserName c?? t???n t???i kh??ng
                    if (data === true) {
                        alert('C???p nh???t th??nh c??ng.');
                        $('#frmUpdate').off('submit').submit();
                    } else {
                        alert('Email ???? t???n t???i.');
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
                        C???p nh???t th??ng tin c?? nh??n
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
                                                    Th??ng tin c?? nh??n</a>
                                                <a href="${pageContext.request.contextPath}/Account/UpdateInfo"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i>
                                                    C???p nh???t th??ng tin c?? nh??n</a>

                                                <a href="${pageContext.request.contextPath}/Account/UpdatePassword"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i>
                                                    Thay ?????i m???t kh???u</a>


                                                <c:choose>
                                                    <c:when test="${test == 1}">
                                                        <a href="${pageContext.request.contextPath}/Admin/Product/AddOfSeller"
                                                           class="list-group-item list-group-item-action"><i
                                                                class="fa fa-caret-right"
                                                                aria-hidden="true"></i>
                                                            T???o s???n ph???m mu???n b??n </a>
                                                        <c:set var="test" value="1"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a class="list-group-item list-group-item-action"
                                                           data-toggle="modal" data-target="#exampleModal">
                                                            <i class="fa fa-caret-right" aria-hidden="true"></i>
                                                            T???o s???n ph???m mu???n b??n </a>

                                                        <!-- Modal -->
                                                        <div class="modal fade" id="exampleModal" tabindex="-1"
                                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">
                                                                            Th??ng b??o</h5>
                                                                        <button type="button" class="close"
                                                                                data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        C???p nh???t th??m th??ng tin ng??n h??ng!
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-dismiss="modal">????ng
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
                                                    S???n ph???m ??ang b??n </a>
                                                <a href="${pageContext.request.contextPath}/Account/EndingList"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i>
                                                    S???n ph???m b??n ???? k???t th??c </a>
                                                <a href="${pageContext.request.contextPath}/Account/WatchList"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i>
                                                    S???n ph???m y??u th??ch</a>
                                                <a href="${pageContext.request.contextPath}/Account/AuctionList"
                                                   class="list-group-item list-group-item-action"><i
                                                        class="fa fa-caret-right"
                                                        aria-hidden="true"></i> S???n ph???m ??ang tham gia ?????u gi?? </a>
                                                <a href="${pageContext.request.contextPath}/Account/SuccessList"
                                                   class="list-group-item list-group-item-action">
                                                    <i class="fa fa-caret-right" aria-hidden="true"></i> S???n ph???m ?????u gi?? k???t th??c</a>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <c:forEach items="${bankList}" var="b">
                                                    <c:if test="${b.idUser == u.id}">
                                                        <c:set var="Bank" value="${b.bank}"/>
                                                        <c:set var="idBank" value="${b.idBank}"/>
                                                        <c:set var="idB" value="${b.id}"/>
                                                    </c:if>
                                                </c:forEach>
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
                                                            <label for="txtName"><strong>T??n</strong></label>
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
                                                            <label for="txtPhone"><strong>S??? ??i???n tho???i</strong></label>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control" id="txtPhone"
                                                                   name="phone" value="${u.phone}">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <label for="txtDOB"><strong>Ng??y th??ng n??m
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
                                                            <label for="txtAddress"><strong>?????a ch???</strong></label>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control" id="txtAddress"
                                                                   name="address" value="${u.address}">
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <label for="inputBank"><strong>Ng??n h??ng</strong></label>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <select id="inputBank" class="form-control"
                                                                    name="inputBank">
                                                                <option selected>${Bank}</option>
                                                                <c:forEach items="${listBanks}" var="l">
                                                                    <c:if test="${Bank != l.name}">
                                                                        <option>${l.name}</option>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <label for="idBank"><strong>S??? t??i kho???n</strong></label>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control" id="idBank"
                                                                   name="idBank" value="${idBank}">
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" id="idB" name="idB"
                                                                   value="${idB}" hidden>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <button type="submit" class="btn btn-primary">
                                                        <i class="fa fa-check" aria-hidden="true"></i>
                                                        C???p nh???t
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