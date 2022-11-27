<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="groupCategories" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.GroupCategory>"/>
<t:admin>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    Sản phẩm mới
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label>Nhóm loại sản phẩm</label>
                        <select class="form-select" aria-label="Default select example" name="GroupCategoryID">
                            <c:forEach items="${groupCategories}" var="g">
                                <option value="${g.grCatID}">${g.grCatName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="txtCatName">Tên loại sản phẩm</label>
                        <input type="text" class="form-control" id="txtCatName" name="CatName" >
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Category/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        Danh sách
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Lưu
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:admin>