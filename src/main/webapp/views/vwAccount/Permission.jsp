<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="userList" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.User>"/>
<t:admin>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                Người dùng
            </h4>
            <c:choose>
                <c:when test="${userList.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Tên</th>
                                <th scope="col">Email</th>
                                <th scope="col">Phân quyền</th>
                                <th scope="col">Tiền khả dụng</th>
                                <th scope="col">Tiền đang đấu giá</th>
                                <th scope="col">Nạp tiền</th>
                                <th scope="col">&nbsp;</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${userList}" var="u">
                                <tr>
                                    <form id="frmDown${u.id}" method="post"
                                          action="${pageContext.request.contextPath}/Account/UpdatePermission" hidden>
                                        <label>
                                            <input value="${u.id}" name="idUser" hidden>
                                        </label>
                                        <label>
                                            <input value="3" name="permission" hidden>
                                        </label>
                                    </form>
                                    <form id="frmUp${u.id}" method="post"
                                          action="${pageContext.request.contextPath}/Account/UpdatePermission" hidden>
                                        <label>
                                            <input value="${u.id}" name="idUser" hidden>
                                        </label>
                                        <label>
                                            <input value="1" name="permission" hidden>
                                        </label>
                                    </form>
                                    <form id="frmDelete${u.id}" method="post"
                                          action="${pageContext.request.contextPath}/Account/Delete" hidden>
                                        <label>
                                            <input value="${u.id}" name="idUser" hidden>
                                        </label>
                                    </form>
                                    <th scope="row">${u.id}</th>
                                    <td>${u.name}</td>
                                    <td>${u.email}</td>
                                    <c:if test="${u.permission == 4}">
                                        <td>Đang chờ xác nhận OTP</td>
                                    </c:if>
                                    <c:if test="${u.permission == 3}">
                                        <td>Người mua</td>
                                    </c:if>
                                    <c:if test="${u.permission == 2}">
                                        <td>Đang chờ xét thành người bán</td>
                                    </c:if>
                                    <c:if test="${u.permission == 1}">
                                        <td>Người bán</td>
                                    </c:if>
                                    <c:if test="${u.permission == 0}">
                                        <td>Admin</td>
                                    </c:if>
                                    <td>${u.money}</td>
                                    <td>${u.moneyAu}</td>
                                    <td >
                                        <form method="post">
                                        <div class="row g-3 align-items-center" style="flex-wrap: nowrap;">
                                                <div class="col-auto">
                                                    <input type="number" name="money" class="form-control" aria-describedby="passwordHelpInline">
                                                    <input type="number" name="id" value="${u.id}" hidden>

                                                </div>
                                                <div class="col-auto">
                                                    <button class="btn mb-2 btn-outline-success" formaction="${pageContext.request.contextPath}/Admin/Permission/AddMoney" type="submit">
                                                        <i class="bi bi-cash-coin" aria-hidden="true"></i>
                                                    </button>
                                                    <button class="btn mb-2 btn-outline-danger" formaction="${pageContext.request.contextPath}/Admin/Permission/MinusMoney" type="submit">
                                                        <i class="bi bi-cash-coin" aria-hidden="true"></i>
                                                    </button>
                                                </div>
                                        </div>
                                        </form>
                                    </td>
                                    <td class="text-right" style="padding-left: 100px;">
                                        <a class="btn btn-outline-danger"
                                           href="javascript:$('#frmDelete${u.id}').submit()" role="button">
                                            <i class="bi bi-x-lg" aria-hidden="true"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:admin>