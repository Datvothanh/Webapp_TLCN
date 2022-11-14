<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="categoriesWithDetails" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Category>"/>
<jsp:useBean id="groupCategoriesWithDetails" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.GroupCategory>"/>

<style>
    .topleft-123{
        position: sticky;
        top: 92.2px;
        z-index: 100;
        left: 0;
    }
</style>
<div class="card topleft-123" >
    <h4 class="card-header">
        <i class="bi bi-list"></i>
        Danh mục sản phẩm
    </h4>
    <div class="list-group">
        <c:forEach items="${groupCategoriesWithDetails}" var="g">
            <button type="button" class="list-group-item list-group-item-action active">
                    ${g.grCatName}
            </button>
            <c:forEach items="${categoriesWithDetails}" var="c">
                <c:if test="${g.grCatID == c.grCatID}">
                    <a href="${pageContext.request.contextPath}/Product/ByCat?id=${c.catID}" class="list-group-item list-group-item-action">${c.catName}</a>
                </c:if>
            </c:forEach>


<%--        <button type="button" class="list-group-item list-group-item-action">Morbi leo risus</button>--%>
<%--        <button type="button" class="list-group-item list-group-item-action">Porta ac consectetur ac</button>--%>
<%--        <button type="button" class="list-group-item list-group-item-action" disabled>Vestibulum at eros</button>--%>
        </c:forEach>
    </div>
</div>
