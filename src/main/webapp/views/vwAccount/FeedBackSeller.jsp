<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="user" scope="request" type="com.example.webapp_tlcn.beans.User"/>
<jsp:useBean id="feedBackAll" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.FeedBack>"/>

<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                FeedBack
                <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Account/SuccessList"
                   role="button">
                    <i class="bi bi-backspace-fill" aria-hidden="true"></i>
                    Trở về
                </a>
            </h4>
            <div class="card-body">
                <c:forEach items="${feedBackAll}" var="f">
                    <c:if test="${f.userSellID == user.id}">
                        <div class="frame">
                            <div class="avatar">
                                <img src="${pageContext.request.contextPath}/public/imgs/avatar/${user.id}/main.jpg" alt="Avatar" class="avatar">
                                    ${user.name}
                            </div>
                            <div class="stt">
                                    ${f.feedBack}
                                    <c:if test="${f.happy == 0}">
                                        <i class="bi bi-hand-thumbs-down"></i>
                                    </c:if>
                                        <c:if test="${f.happy == 1}">
                                            <i class="bi bi-hand-thumbs-up"></i>
                                        </c:if>
                            </div>
                        </div>
                        <br>
                        <style>

                            .stt{
                                margin: 0 10px;
                            }
                            .avatar{
                                margin-left: 3px;
                                display: flex;
                                width: fit-content;
                                align-items: center;
                            }
                            .frame{
                                position: relative;
                                display: flex;
                                align-items: center;
                                border: 1px solid #333333;
                                width: fit-content;
                                padding: 10px;
                                border-radius: 5px;
                            }
                            .avatar::after{
                                content: "";
                                border-left: 1px solid #333333;
                                height: 100%;
                                margin-left: 10px;
                            }
                        </style>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </jsp:body>
</t:main>