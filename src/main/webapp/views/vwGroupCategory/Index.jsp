<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="groupCategories" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.GroupCategory>"/>

<t:admin>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                Nhóm loại sản phẩm
                <div>
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/GroupCategory/Add"
                       role="button">
                        <i class="fa fa-plus" aria-hidden="true"></i>
                        Thêm nhóm loại sản phẩm
                    </a>
                </div>
            </h4>
            <c:choose>
                <c:when test="${groupCategories.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nhóm loại sản phẩm</th>
                                <th scope="col">&nbsp;</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${groupCategories}" var="g">
                                <tr>
                                    <th scope="row">${g.grCatID}</th>
                                    <td>${g.grCatName}</td>
                                    <td class="text-right">
                                        <a class="btn btn-outline-primary"
                                           href="${pageContext.request.contextPath}/Admin/GroupCategory/Edit?id=${g.grCatID}"
                                           role="button">
                                            <i class="bi bi-pencil"></i></a>
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