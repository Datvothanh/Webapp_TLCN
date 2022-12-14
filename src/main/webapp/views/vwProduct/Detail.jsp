<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="com.example.webapp_tlcn.beans.Product"/>
<jsp:useBean id="favourite" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Favourite>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<jsp:useBean id="TopAuctionHighestPrice" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Auction>"/>
<jsp:useBean id="proCat5" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="minute" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="second" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="hour" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="year" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="day" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="month" scope="request" type="java.lang.Integer"/>
<t:main>
    <jsp:attribute name="css">
        <style>
            /* general styling */
            :root {
                --smaller: .75;
            }

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }


            .container {
                color: #333;
                margin: 0 auto;
                padding-left: 0px;
            }

            h1 {
                font-weight: normal;
                letter-spacing: .125rem;
                text-transform: uppercase;
            }

            li {
                display: inline-block;
                font-size: 0.75em;
                list-style-type: none;
                padding: 1em;
                text-transform: uppercase;
            }

            li span {
                display: block;
                font-size: 1rem;
            }


            @media all and (max-width: 768px) {
                h1 {
                    font-size: calc(1.5rem * var(--smaller));
                }

                li {
                    font-size: calc(1.125rem * var(--smaller));
                }

                li span {
                    font-size: calc(3.375rem * var(--smaller));
                }
            }
        </style>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script>

            $('#frmAuction${product.proID}').on('submit', function (e) {
                e.preventDefault();

                const result = confirm("Bạn hãy xác nhận đấu giá !");
                let price = Number($('#numPrice').val());
                let authUserMoney = Number($('#authUserMoney').val());
                let start = Number($('#start').val());
                let presentPrice = Number($('#presentPrice').val());
                let step = Number($('#step').val());
                let highest = Number($('#highest').val());
                if (result) {
                    if (price <= 0 ) {
                        alert('Đấu giá không hợp lệ.');
                    } else {
                        if (highest === 0) {
                            if (price < (start + step)) {
                                alert('Số tiền đấu giá ít nhất phải bằng: ' + (start + step));
                            } else if (authUserMoney < (start * 20 / 100) && presentPrice === 1) {
                                alert('Tài khoản bạn không đủ tiền để đặt cọc');
                            } else {
                                $('#frmAuction${product.proID}').off('submit').submit();
                            }
                        } else {
                            if (price < (highest + step)) {
                                alert('Số tiền đấu giá ít nhất phải bằng: ' + (highest + step));
                            } else if (authUserMoney < (start * 20 / 100) && presentPrice === 1) {
                                alert('Tài khoản bạn không đủ tiền để đặt cọc');
                            } else {
                                $('#frmAuction${product.proID}').off('submit').submit();
                            }
                        }
                    }
                } else {
                    alert("Đã hủy đấu giá.");
                }

            });
            <c:forEach items="${proCat5}" var="p">
            (function () {
                const second = 1000,
                    minute = second * 60,
                    hour = minute * 60,
                    day = hour * 24;

                //end
                const countDown = new Date(${p.year}, ${p.month}-1, ${p.day}, ${p.hour}, ${p.minute}, ${p.second}).getTime(),
                    x = setInterval(function () {

                        const now = new Date().getTime(),
                            distance = countDown - now;

                        document.getElementById("days1${p.proID}").innerText = Math.floor(distance / (day)),
                            document.getElementById("hours1${p.proID}").innerText = Math.floor((distance % (day)) / (hour)),
                            document.getElementById("minutes1${p.proID}").innerText = Math.floor((distance % (hour)) / (minute)),
                            document.getElementById("seconds1${p.proID}").innerText = Math.floor((distance % (minute)) / second);

                        //do something later when date is reached
                        if (distance < 0) {
                            document.getElementById("countdown1${p.proID}").style.display = "none";
                            clearInterval(x);
                        }
                        //seconds
                    }, 0)
            }());
            </c:forEach>
            (function () {
                const second = 1000,
                    minute = second * 60,
                    hour = minute * 60,
                    day = hour * 24;

                <%--setInterval(function () {--%>
                <%--    $.getJSON('${pageContext.request.contextPath}/Product/Detail?id=53')--%>


                <%--},1000)--%>


                const countDown = new Date(${year}, ${month} -1, ${day}, ${hour}, ${minute}, ${second}).getTime(),
                    x = setInterval(function () {

                        const now = new Date().getTime(),
                            distance = countDown - now;

                        document.getElementById("days").innerText = Math.floor(distance / (day)),
                            document.getElementById("hours").innerText = Math.floor((distance % (day)) / (hour)),
                            document.getElementById("minutes").innerText = Math.floor((distance % (hour)) / (minute)),
                            document.getElementById("seconds").innerText = Math.floor((distance % (minute)) / second);

                        //do something later when date is reached
                        if (distance < 0) {
                            document.getElementById("countdown").style.display = "none";
                            clearInterval(x);
                        }
                        //seconds
                    }, 0)
            }());
        </script>
    </jsp:attribute>
    <jsp:body>
        <form id="frmFavourite${product.proID}" method="post"
              action="${pageContext.request.contextPath}/Product/Favourite" hidden>
            <label>
                <input value="${authUser.id}" name="idUser" hidden>
            </label>
            <label>
                <input value="${product.proID}" name="idPro" hidden>
            </label>
            <label>
                <input value="1" name="favourite" hidden>
            </label>
        </form>
        <c:forEach items="${favourite}" var="f">
            <c:if test="${f.userID == authUser.id && f.proID == product.proID}">
                <form id="frmFavourite-Add${product.proID}" method="post"
                      action="${pageContext.request.contextPath}/Product/FavouriteEdit" hidden>
                    <label>
                        <input value="${authUser.id}" name="idUser"
                               hidden>
                    </label>
                    <label>
                        <input value="${product.proID}" name="idPro" hidden>
                    </label>
                    <label>
                        <input value="1" name="favourite" hidden>
                    </label>
                    <label>
                        <input value="${f.faID}" name="idFa" hidden>
                    </label>
                </form>
                <form id="frmFavourite-Delete${product.proID}" method="post"
                      action="${pageContext.request.contextPath}/Product/FavouriteEdit" hidden>
                    <label>
                        <input value="${authUser.id}" name="idUser"
                               hidden>
                    </label>
                    <label>
                        <input value="${product.proID}" name="idPro" hidden>
                    </label>
                    <label>
                        <input value="0" name="favourite" hidden>
                    </label>
                    <label>
                        <input value="${f.faID}" name="idFa" hidden>
                    </label>
                </form>
            </c:if>
        </c:forEach>
        <jsp:include page="../../views/partials/ad.jsp"/>
        <div class="card">
            <input value="${authUser.money}" id="authUserMoney" hidden>
            <h4 class="card-header d-flex justify-content-between">
                    ${product.proName}
            </h4>
            <div class="cardProduct">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <div class="preview col-md-6">

                            <div class="preview-pic tab-content">
                                <div class="tab-pane active" id="pic-1"><img
                                        src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/main.jpg"
                                        style="width:696px;height:533px;"/></div>
                                <div class="tab-pane" id="pic-2"><img
                                        src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/sub1.jpg"
                                        style="width:696px;height:533px;"/></div>
                                <div class="tab-pane" id="pic-3"><img
                                        src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/sub2.jpg"
                                        style="width:696px;height:533px;"/></div>
                                <div class="tab-pane" id="pic-4"><img
                                        src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/sub3.jpg"
                                        style="width:696px;height:533px;"/></div>
                            </div>
                            <ul class="preview-thumbnail nav nav-tabs" style="flex-wrap: nowrap">
                                <li class="active"><a data-target="#pic-1" data-toggle="tab"><img
                                        src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/main.jpg"
                                        style="width:163px;height:158px;"/></a></li>
                                <li><a data-target="#pic-2" data-toggle="tab"><img
                                        src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/sub1.jpg"
                                        style="width:163px;height:158px;"/></a></li>
                                <li><a data-target="#pic-3" data-toggle="tab"><img
                                        src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/sub2.jpg"
                                        style="width:163px;height:158px;"/></a></li>
                                <li><a data-target="#pic-4" data-toggle="tab"><img
                                        src="${pageContext.request.contextPath}/public/imgs/sp/${product.proID}/sub3.jpg"
                                        style="width:163px;height:158px;"/></a></li>
                            </ul>

                        </div>
                        <div class="details col-md-6">
                            <h3 class="product-title">${product.proName}</h3>
                            <p class="product-description">${product.fullDes}</p>
                            <c:set value="0" var="value"/>
                            <c:choose>
                                <c:when test="${product.highestPaidPrice == 0}">
                                    <h4 class="price">Giá khởi điểm: <span><fmt:formatNumber
                                            value="${product.startingPrice}" type="number"/> đ</span></h4>
                                    <c:set value="${product.startingPrice}" var="value"/>
                                </c:when>
                                <c:otherwise>
                                    <h4 class="price">Giá trả cao nhất: <span><fmt:formatNumber
                                            value="${product.highestPaidPrice}" type="number"/> đ</span></h4>
                                    <c:set value="${product.highestPaidPrice}" var="value"/>
                                    <h5 class="card-title text-danger">
                                        <c:forEach items="${user}" var="u">
                                            <c:if test="${u.id == product.userID}">
                                                Người đặt giá: ${u.name}
                                            </c:if>
                                        </c:forEach>
                                    </h5>
                                </c:otherwise>
                            </c:choose>
                            <h6 class="card-title text-dark">
                                <c:forEach items="${user}" var="u">
                                    <c:if test="${u.id == product.userSellID}">
                                        Người bán sản phẩm: ${u.name}
                                        <a href="${pageContext.request.contextPath}/Account/FeedBackSeller?id=${u.id}&idPro=${product.proID}"
                                           role="button">
                                            <i class="fa fa-eye" aria-hidden="true" style="margin-left: 10px;"></i>
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </h6>
                            <p>Số tiền đấu giá tối thiểu: <span><fmt:formatNumber
                                    value="${product.stepPrice + value}" type="number"/> đ </span>(Bước giá:<span><fmt:formatNumber
                                    value="${product.stepPrice }" type="number"/> đ</span>)</p>
                            <p>Số tiền đặt cọc: <span><fmt:formatNumber
                                    value="${product.startingPrice * 20/100}" type="number"/> đ</span></p>
                            <div class="container">
                                <div id="countdown">
                                    <ul>
                                        <li><span id="days"></span>Ngày</li>
                                        <li><span id="hours"></span>Tiếng</li>
                                        <li><span id="minutes"></span>Phút</li>
                                        <li><span id="seconds"></span>Giây</li>
                                    </ul>
                                </div>
                            </div>
                            <c:if test="${auth}">
                                <div class="action">
                                    <c:choose>
                                        <c:when test="${auth == true && product.userSellID != authUser.id}">
                                            <form id="frmAuction${product.proID}" method="post"
                                                  action="${pageContext.request.contextPath}/Product/Auction">
                                                <label>
                                                    <input value="${authUser.id}" name="idUser" hidden>
                                                </label>
                                                <label>
                                                    <input value="${product.proID}" name="idPro" hidden>
                                                </label>
                                                <label>
                                                    <input value="${product.countAuction}" name="countAuction" hidden>
                                                </label>
                                                <label>
                                                    <input value="${product.highestPaidPrice}" id="highest" hidden>
                                                </label>
                                                <label>
                                                    <input value="${product.stepPrice}" id="step" hidden>
                                                </label>
                                                <label>
                                                    <input value="${product.startingPrice}" id="start" hidden>
                                                </label>
                                                <label>
                                                    <input name="price" id="numPrice" type="number">
                                                </label>
                                            </form>
                                            <a class="add-to-cart btn btn-default" style="background-color: #e8de24;  margin-top: 18px;"
                                               href="javascript:$('#frmAuction${product.proID}').submit()">
                                                <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                Đấu giá
                                            </a>
                                            <c:set var="Test" scope="session" value="${1}"/>

                                            <c:forEach items="${favourite}" var="f">
                                                <c:if test="${f.userID == authUser.id && f.proID == product.proID && f.favourite == 0}">
                                                    <a class="card-action" style=" margin: 7px 560px 7px 7px;"
                                                       href="javascript:$('#frmFavourite-Add${product.proID}').submit()">
                                                        <i class="fa fa-heart"></i>
                                                        <c:set var="Test" scope="session" value="${0}"/>
                                                    </a>
                                                </c:if>
                                                <c:if test="${f.userID == authUser.id && f.proID == product.proID && f.favourite == 1 }">
                                                    <a class="card-action-off" style=" margin: 7px 560px 7px 7px;"
                                                       href="javascript:$('#frmFavourite-Delete${product.proID}').submit()">
                                                        <i class="fa fa-heart"></i>
                                                        <c:set var="Test" scope="session" value="${0}"/>
                                                    </a>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${Test == 1 }">
                                                <a class="card-action" style=" margin: 7px 560px 7px 7px;"
                                                   href="javascript:$('#frmFavourite${product.proID}').submit()">
                                                    <i class="fa fa-heart"></i>
                                                </a>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <form method="post">
                                                <label>
                                                    <input name="price">
                                                </label>
                                            </form>
                                            <a class="add-to-cart btn btn-default" style="background-color: #e8de24;  margin-top: 18px;"
                                               data-toggle="modal" data-target="#exampleModal3">
                                                <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                                Đấu giá
                                            </a>
                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal3" tabindex="-1"
                                                 aria-labelledby="exampleModalLabel3" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel3">Thông
                                                                báo</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Bạn không thể đấu giá sản phẩm mà bạn đăng!
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Close
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:set var="Test" scope="session" value="${1}"/>

                                            <c:forEach items="${favourite}" var="f">
                                                <c:if test="${f.userID == authUser.id && f.proID == product.proID && f.favourite == 0}">
                                                    <a class="card-action" style=" margin: 7px 560px 7px 7px;"
                                                       href="javascript:$('#frmFavourite-Add${product.proID}').submit()">
                                                        <i class="fa fa-heart"></i>
                                                        <c:set var="Test" scope="session" value="${0}"/>
                                                    </a>
                                                </c:if>
                                                <c:if test="${f.userID == authUser.id && f.proID == product.proID && f.favourite == 1 }">
                                                    <a class="card-action-off" style=" margin: 7px 560px 7px 7px;"
                                                       href="javascript:$('#frmFavourite-Delete${product.proID}').submit()">
                                                        <i class="fa fa-heart"></i>
                                                        <c:set var="Test" scope="session" value="${0}"/>
                                                    </a>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${Test == 1 }">
                                                <a class="card-action" style=" margin: 7px 560px 7px 7px;"
                                                   href="javascript:$('#frmFavourite${product.proID}').submit()">
                                                    <i class="fa fa-heart"></i>
                                                </a>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:if>

                            <c:if test="${!auth}">
                                <div class="action">
                                    <a class="add-to-cart btn btn-default" style="background-color: #e8de24;  margin-top: 18px;"
                                       data-toggle="modal" data-target="#exampleModal1">
                                        <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                        Đấu giá
                                    </a>
                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModal1" tabindex="-1"
                                         aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel1">Thông báo</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    Hãy đăng nhập để có thể đấu giá sản phẩm!
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="card-action" style=" margin: 7px 560px 7px 7px;"
                                       data-toggle="modal" data-target="#exampleModal">
                                        <i class="fa fa-heart"></i>
                                    </a>
                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModal" tabindex="-1"
                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    Hãy đăng nhập để có thể thêm vào danh sách yêu thích!
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <div style="padding-top: 45px;">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Thời gian</th>
                                        <th scope="col">Tên</th>
                                        <th scope="col">Giá</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="STT" scope="session" value="0"/>
                                        <c:set value="0" var="testAu"/>
                                    <c:forEach items="${TopAuctionHighestPrice}" var="a">
                                    <c:forEach items="${user}" var="u">
                                    <c:choose>
                                    <c:when test="${product.proID == a.proID && a.userID == u.id}">
                                    <tr>
                                        <th scope="row">${STT+1}</th>
                                        <td>${a.strDate}</td>
                                        <td>${u.name}</td>
                                        <td><span><fmt:formatNumber
                                                value="${a.price}" type="number"/> đ</span></td>

                                        <c:set var="STT" scope="session" value="${STT + 1}"/>

                                    </tr>
                                    <c:if test="${a.userID != authUser.id}">
                                        <c:set value="1" var="testAu"/>
                                    </c:if>
                                    </c:when>
                                    </c:choose>
                                    </c:forEach>
                                    </c:forEach>
                                    <c:if test="${STT == 0}">
                                        <c:set value="1" var="testAu"/>
                                    </c:if>
                                    <input value="${testAu}" id="presentPrice" hidden>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


            <h4 class="card-header">
                5 sản phẩm khác cùng loại
            </h4>
            <c:choose>
                <c:when test="${proCat5.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <ul class="list-group" style="padding-right: 280px;">
                            <div class="container" style="margin-top:50px; margin-bottom: 50px">
                                <div class="row" style="flex-wrap: unset">
                                    <c:forEach items="${proCat5}" var="p">
                                        <a href="${pageContext.request.contextPath}/Product/Detail?id=${p.proID}">
                                            <div class="col-md-3" style="margin-bottom: 30px;">
                                                <div class="card-sl">
                                                    <form id="frmFavourite${p.proID}" method="post"
                                                          action="${pageContext.request.contextPath}/Product/Favourite"
                                                          hidden>
                                                        <label>
                                                            <input value="${authUser.id}" name="idUser">
                                                        </label>
                                                        <label>
                                                            <input value="${p.proID}" name="idPro">
                                                        </label>
                                                        <label>
                                                            <input value="1" name="favourite">
                                                        </label>
                                                    </form>
                                                    <c:forEach items="${favourite}" var="f">
                                                        <c:if test="${f.userID == authUser.id && f.proID == p.proID}">
                                                            <form id="frmFavourite-Add${p.proID}" method="post"
                                                                  action="${pageContext.request.contextPath}/Product/FavouriteEdit"
                                                                  hidden>
                                                                <label>
                                                                    <input value="${authUser.id}" name="idUser"
                                                                           hidden>
                                                                </label>
                                                                <label>
                                                                    <input value="${p.proID}" name="idPro">
                                                                </label>
                                                                <label>
                                                                    <input value="1" name="favourite">
                                                                </label>
                                                                <label>
                                                                    <input value="${f.faID}" name="idFa">
                                                                </label>
                                                            </form>
                                                            <form id="frmFavourite-Delete${p.proID}" method="post"
                                                                  action="${pageContext.request.contextPath}/Product/FavouriteEdit"
                                                                  hidden>
                                                                <label>
                                                                    <input value="${authUser.id}" name="idUser"
                                                                    >
                                                                </label>
                                                                <label>
                                                                    <input value="${p.proID}" name="idPro">
                                                                </label>
                                                                <label>
                                                                    <input value="0" name="favourite">
                                                                </label>
                                                                <label>
                                                                    <input value="${f.faID}" name="idFa">
                                                                </label>
                                                            </form>
                                                        </c:if>
                                                    </c:forEach>
                                                    <div class="card-image">
                                                        <c:set var="test" scope="session" value="0"/>
                                                        <c:if test="${p.userSellID == authUser.id}">
                                                            <span class="card-notify-badge">Sản phẩm đang bán</span>
                                                        </c:if>
                                                        <c:if test="${p.userID == authUser.id}">
                                                            <span class="card-notify-badge"
                                                                  style="background: #f17236;">Sản phẩm đang đấu giá thắng</span>
                                                            <c:set var="test" value="1"/>
                                                        </c:if>
                                                        <c:forEach items="${auction}" var="a">
                                                            <c:if test="${a.proID == p.proID && a.userID == authUser.id && test == 0}">
                                                                <span class="card-notify-badge">Sản phẩm đang đấu giá</span>
                                                            </c:if>
                                                        </c:forEach>
                                                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${p.proID}/main.jpg"
                                                             alt="${p.proName}" title="${p.proName}"/>
                                                    </div>

                                                    <c:if test="${auth}">
                                                        <c:set var="Test" scope="session" value="${1}"/>
                                                        <c:forEach items="${favourite}" var="f">
                                                            <c:if test="${f.userID == authUser.id && f.proID == p.proID && f.favourite == 0}">
                                                                <a class="card-action"
                                                                   href="javascript:$('#frmFavourite-Add${p.proID}').submit()">
                                                                    <i class="fa fa-heart"></i>
                                                                    <c:set var="Test" scope="session" value="${0}"/>
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${f.userID == authUser.id && f.proID == p.proID && f.favourite == 1 }">
                                                                <a class="card-action-off"
                                                                   href="javascript:$('#frmFavourite-Delete${p.proID}').submit()">
                                                                    <i class="fa fa-heart"></i>
                                                                    <c:set var="Test" scope="session" value="${0}"/>
                                                                </a>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:if test="${Test == 1 }">
                                                            <a class="card-action"
                                                               href="javascript:$('#frmFavourite${p.proID}').submit()">
                                                                <i class="fa fa-heart"></i>
                                                            </a>
                                                        </c:if>
                                                    </c:if>
                                                    <c:if test="${!auth}">
                                                        <a class="card-action"
                                                           data-toggle="modal" data-target="#exampleModal2">
                                                            <i class="fa fa-heart"></i>
                                                        </a>
                                                    </c:if>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="exampleModal2" tabindex="-1"
                                                         aria-labelledby="exampleModalLabel2" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel2">
                                                                        Thông báo</h5>
                                                                    <button type="button" class="close"
                                                                            data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    Hãy đăng nhập để có thể thêm vào danh sách yêu
                                                                    thích!
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary"
                                                                            data-dismiss="modal">Close
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-heading">
                                                            ${p.proName}
                                                    </div>
                                                    <div class="container">
                                                        <div id="countdown1${p.proID}">
                                                            <ul>
                                                                <li><span id="days1${p.proID}"></span>Ngày</li>
                                                                <li><span id="hours1${p.proID}"></span>Tiếng</li>
                                                                <li><span id="minutes1${p.proID}"></span>Phút</li>
                                                                <li><span id="seconds1${p.proID}"></span>Giây</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-text"
                                                         style="border-bottom-left-radius: 20px ; border-bottom-right-radius: 20px">
                                                        <c:choose>
                                                            <c:when test="${p.highestPaidPrice == 0}">
                                                                <h5 class="card-title text-danger">
                                                                    Giá khởi điểm:
                                                                    <span class="text-danger font-weight-bold"><fmt:formatNumber
                                                                            value="${p.startingPrice}"
                                                                            type="number"/> đ</span>
                                                                </h5>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <h5 class="card-title text-danger">
                                                                    Giá trả cao nhất:
                                                                    <span class="text-danger font-weight-bold"><fmt:formatNumber
                                                                            value="${p.highestPaidPrice}"
                                                                            type="number"/> đ</span>
                                                                </h5>
                                                                <h6 class="card-title text-danger">
                                                                    <c:forEach items="${user}" var="u">
                                                                        <c:if test="${u.id == p.userID}">
                                                                            Người đặt giá: ${u.name}
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </h6>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <p style="color:#4723D9">
                                                            Số lượt ra giá hiện tại:${p.countAuction}
                                                        </p>
                                                            ${p.tinyDes}
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>

                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:main>