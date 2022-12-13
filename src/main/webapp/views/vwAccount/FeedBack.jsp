<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="com.example.webapp_tlcn.beans.Product"/>
<jsp:useBean id="userFeedBack" scope="request" type="com.example.webapp_tlcn.beans.User"/>
<jsp:useBean id="userSell" scope="request" type="com.example.webapp_tlcn.beans.User"/>
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
                <form method="post">
                    <div class="form-group">
                        <label for="feedBack">Nhận xét</label>
                        <input type="text" class="form-control" id="feedBack" placeholder="Nhận xét" name="feedBack">
                        <label>
                            <input value="${product.proID}" name="proID" hidden>
                        </label>
                        <label>
                            <input value="${userFeedBack.id}" name="userFbID" hidden>
                        </label>
                        <label>
                            <input value="${userSell.id}" name="userSellID" hidden>
                        </label>
                        <small id="emailHelp" class="form-text text-muted">Nhận xét của bạn sẽ hiện lên trang FeedBack
                            của người bán này.</small>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="happy" id="happy" value="1" checked>
                        <label class="form-check-label" for="happy">
                            Bạn hài lòng
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="happy" id="sad" value="0">
                        <label class="form-check-label" for="sad">
                            Bạn không hài lòng
                        </label>
                    </div>
                    <button type="submit" class="btn btn-primary">Xác nhận</button>
                </form>
            </div>
        </div>
    </jsp:body>
</t:main>