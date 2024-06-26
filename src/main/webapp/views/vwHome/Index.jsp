<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="listTop5HighestPrice" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="listTop5HighestCountAuction" scope="request"
             type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="listTop5End" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Product>"/>
<jsp:useBean id="favourite" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Favourite>"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<jsp:useBean id="auction" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Auction>"/>
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
            $('#frmLike').on('submit', function (e) {
                e.preventDefault();
                alert('Bạn cần đăng nhập để thêm vào danh sách yêu thích.');
            });
            <c:forEach items="${listTop5End}" var="p">
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

                        document.getElementById("days2${p.proID}").innerText = Math.floor(distance / (day)),
                            document.getElementById("hours2${p.proID}").innerText = Math.floor((distance % (day)) / (hour)),
                            document.getElementById("minutes2${p.proID}").innerText = Math.floor((distance % (hour)) / (minute)),
                            document.getElementById("seconds2${p.proID}").innerText = Math.floor((distance % (minute)) / second);

                        //do something later when date is reached
                        if (distance < 0) {
                            document.getElementById("countdown2${p.proID}").style.display = "none";
                            clearInterval(x);
                        }
                        //seconds
                    }, 0)
            }());
            </c:forEach>
            <c:forEach items="${listTop5HighestCountAuction}" var="p">
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

                        document.getElementById("days${p.proID}").innerText = Math.floor(distance / (day)),
                            document.getElementById("hours${p.proID}").innerText = Math.floor((distance % (day)) / (hour)),
                            document.getElementById("minutes${p.proID}").innerText = Math.floor((distance % (hour)) / (minute)),
                            document.getElementById("seconds${p.proID}").innerText = Math.floor((distance % (minute)) / second);

                        //do something later when date is reached
                        if (distance < 0) {
                            document.getElementById("countdown1${p.proID}").style.display = "none";
                            clearInterval(x);
                        }
                        //seconds
                    }, 0)
            }());
            </c:forEach>
            <c:forEach items="${listTop5HighestPrice}" var="p">
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

        </script>

    </jsp:attribute>
    <jsp:body>
        <div class="card" style="background: #FEFBF6">
            <jsp:include page="../../views/partials/ad.jsp"/>
            <div class="card-body">

                <ul class="list-group" style="padding-right: 321px;">
                    <h3>Sản phẩm sắp kết thúc đấu giá <span class="badge badge-secondary"
                                                            style="background-color: #DC3535;">  Top 5</span>
                    </h3>
                    <c:choose>
                        <c:when test="${listTop5End.size() == 0}">
                            <div class="card-body">
                                <p class="card-text">Không có dữ liệu.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="container" style="margin-top:50px; margin-bottom: 50px">
                                <div class="row" style="flex-wrap: nowrap">
                                    <c:forEach items="${listTop5End}" var="p">
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
                                                        <c:set var="test" value="0"/>
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
                                                                <span class="card-notify-badge" style="background: #2d9abc;">Sản phẩm đang đấu giá</span>
                                                            </c:if>
                                                        </c:forEach>
                                                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${p.proID}/main.jpg"
                                                             alt="${p.proName}" title="${p.proName}"
                                                             style="width: 254px ; height: 268px"/>
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
                                                           data-toggle="modal" data-target="#exampleModal">
                                                            <i class="fa fa-heart"></i>
                                                        </a>
                                                    </c:if>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="exampleModal" tabindex="-1"
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
                                                        <div id="countdown2${p.proID}">
                                                            <ul>
                                                                <li><span id="days2${p.proID}"></span>Ngày</li>
                                                                <li><span id="hours2${p.proID}"></span>Tiếng</li>
                                                                <li><span id="minutes2${p.proID}"></span>Phút</li>
                                                                <li><span id="seconds2${p.proID}"></span>Giây</li>
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
                                                                            type="number"/></span>
                                                                </h5>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <h5 class="card-title text-danger">
                                                                    Giá trả cao nhất:
                                                                    <span class="text-danger font-weight-bold"><fmt:formatNumber
                                                                            value="${p.highestPaidPrice}"
                                                                            type="number"/></span>
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
                                                            Số người tham gia đấu giá:${p.countAuction}
                                                        </p>
                                                            ${p.tinyDes}
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <ul class="list-group" style="padding-right: 321px;">
                    <h3>Sản phẩm có số người tham gia đấu giá cao nhất <span class="badge badge-secondary"
                                                                             style="background-color: #DC3535;">  Top 5</span>
                    </h3>
                    <c:choose>
                        <c:when test="${listTop5HighestCountAuction.size() == 0}">
                            <div class="card-body">
                                <p class="card-text">Không có dữ liệu.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="container" style="margin-top:50px; margin-bottom: 50px">
                                <div class="row" style="flex-wrap: nowrap">
                                    <c:forEach items="${listTop5HighestCountAuction}" var="p">
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
                                                        <c:set var="test" value="0"/>
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
                                                                <span class="card-notify-badge" style="background: #2d9abc;">Sản phẩm đang đấu giá</span>
                                                            </c:if>
                                                        </c:forEach>
                                                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${p.proID}/main.jpg"
                                                             alt="${p.proName}" title="${p.proName}"
                                                             style="width: 254px ; height: 268px"/>
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
                                                           data-toggle="modal" data-target="#exampleModal">
                                                            <i class="fa fa-heart"></i>
                                                        </a>
                                                    </c:if>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="exampleModal" tabindex="-1"
                                                         aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel1">
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
                                                        <div id="countdown${p.proID}">
                                                            <ul>
                                                                <li><span id="days${p.proID}"></span>Ngày</li>
                                                                <li><span id="hours${p.proID}"></span>Tiếng</li>
                                                                <li><span id="minutes${p.proID}"></span>Phút</li>
                                                                <li><span id="seconds${p.proID}"></span>Giây</li>
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
                                                                            type="number"/></span>
                                                                </h5>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <h5 class="card-title text-danger">
                                                                    Giá trả cao nhất:
                                                                    <span class="text-danger font-weight-bold"><fmt:formatNumber
                                                                            value="${p.highestPaidPrice}"
                                                                            type="number"/></span>
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
                                                            Số người tham gia đấu giá:${p.countAuction}
                                                        </p>
                                                            ${p.tinyDes}
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <ul class="list-group" style="padding-right: 321px;">
                    <h3>Sản phẩm đang có giá tiền cao nhất <span class="badge badge-secondary"
                                                                 style="background-color: #DC3535;">  Top 5</span></h3>
                    <c:choose>
                        <c:when test="${listTop5HighestPrice.size() == 0}">
                            <div class="card-body">
                                <p class="card-text">Không có dữ liệu.</p>
                            </div>
                        </c:when>
                        <c:otherwise>

                            <div class="container" style="margin-top:50px; margin-bottom: 50px">
                                <div class="row" style="flex-wrap: nowrap">
                                    <c:forEach items="${listTop5HighestPrice}" var="p">
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
                                                        <c:set var="test" value="0"/>
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
                                                                <span class="card-notify-badge" style="background: #2d9abc;">Sản phẩm đang đấu giá</span>
                                                            </c:if>
                                                        </c:forEach>
                                                        <img src="${pageContext.request.contextPath}/public/imgs/sp/${p.proID}/main.jpg"
                                                             alt="${p.proName}" title="${p.proName}"
                                                             style="width: 254px ; height: 268px"/>
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
                                                           data-toggle="modal" data-target="#exampleModal">
                                                            <i class="fa fa-heart"></i>
                                                        </a>
                                                    </c:if>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="exampleModal" tabindex="-1"
                                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Thông
                                                                        báo</h5>
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
                                                                            type="number"/></span>
                                                                </h5>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <h5 class="card-title text-danger">
                                                                    Giá trả cao nhất:
                                                                    <span class="text-danger font-weight-bold"><fmt:formatNumber
                                                                            value="${p.highestPaidPrice}"
                                                                            type="number"/></span>
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
                                                            Số người tham gia đấu giá:${p.countAuction}
                                                        </p>
                                                            ${p.tinyDes}
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>

                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </jsp:body>
</t:main>