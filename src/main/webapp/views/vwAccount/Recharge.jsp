<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header d-flex justify-content-between">
                Hướng dẫn nạp tiền
            </h4>
            <div class="card-body" style="text-align: center;">
                <img src="${pageContext.request.contextPath}/public/imgs/recharge/Recharge.png"
                     alt="recharge" title="recharge" class="card-img-top" style="height: 500px ; width: 500px ;">
                <br>
                <br>
                <br>
                <p>Các bạn chuyển tiền vào tài khoản <b> Ngân Hàng </b> hoặc <b> MoMo </b> với lời nhắn là <b> tên đăng
                    nhập </b> của tài khoản mà bạn muốn nạp vào. Chúng tôi sẽ nạp tiền vào tài khoản của bạn chỉ trong
                    vài phút! <br> <br> Mọi thắc mắc xin liên hệ vào <b>số điện thoại</b>: 0792384281.</p>
            </div>
        </div>
    </jsp:body>
</t:main>