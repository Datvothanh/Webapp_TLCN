<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="user" scope="request" type="com.example.webapp_tlcn.beans.User"/>
<jsp:useBean id="feedBackAll" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.FeedBack>"/>
<jsp:useBean id="id" scope="request" type="java.lang.Integer"/>

<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex">
                <a href="${pageContext.request.contextPath}/Product/Detail?id=${id}"
                   role="button" style=" margin-right: 27px;">
                    <i class="bi bi-backspace-fill" aria-hidden="true"></i>
                </a>
                <p>Phản hồi từ khách mua </p>
            </h4>
            <div class="card-body">
                <c:forEach items="${feedBackAll}" var="f">
                    <c:if test="${f.userSellID == user.id}">

                            <div class="col-md-8">
                                <div class="d-flex flex-column comment-section">
                                    <div class="bg-white p-2">
                                        <div class="d-flex flex-row user-info">
                                            <img src="${pageContext.request.contextPath}/public/imgs/avatar/user.png"
                                                 alt="Avatar" class="avatar" width="40">
                                            <div class="d-flex flex-column justify-content-start ml-2"><span
                                                    class="d-block font-weight-bold name">${user.name}</span><span
                                                    class="date text-black-50">${f.strDate}</span></div>
                                        </div>
                                        <div class="mt-2">
                                            <p class="comment-text">${f.feedBack}
                                                <c:if test="${f.happy == 0}">
                                                    <i class="bi bi-hand-thumbs-down"></i>
                                                </c:if>
                                                <c:if test="${f.happy == 1}">
                                                    <i class="bi bi-hand-thumbs-up"></i>
                                                </c:if>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <br>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </jsp:body>
</t:main>