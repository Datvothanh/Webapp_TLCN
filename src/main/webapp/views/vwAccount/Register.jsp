<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"
              integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"
                integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw=="
                crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>

        <script>
            $('#frmRegister').on('submit', function (e) {
                e.preventDefault();
                const username = $('#txtUsername').val(); //Gán vào biến username
                const password = $('#txtPassword').val();
                const passwordConfirm = $('#txtConfirm').val();
                const address = $('#txtAddress').val();
                const email = $('#txtEmail').val();
                const dob = $('#txtDOB').val();
                const name = $('#txtName').val();
                const phone = $('#txtPhone').val();
                if (username.length === 0) {
                    alert('Tên đăng nhập không hợp lệ.')//Nếu không có username thì sẽ hiện thông báo
                    return;
                }
                if (password.length === 0) {
                    alert('Mật khẩu không hợp lệ.')
                    return;
                }
                if (passwordConfirm.length === 0) {
                    alert('Xác nhận mật khẩu không hợp lệ.')
                    return;
                }
                if (name.length === 0) {
                    alert('Tên không hợp lệ.')
                    return;
                }
                if (dob.length === 0) {
                    alert('Ngày tháng năm sinh không hợp lệ.')
                    return;
                }
                if (email.length === 0) {
                    alert('Email không hợp lệ.')
                    return;
                }
                if (address.length === 0) {
                    alert('Địa chỉ không hợp lệ.')
                    return;
                }
                if (phone.length === 0) {
                    alert('Số điện thoại không hợp lệ.')
                    return;
                }
                if (password !== passwordConfirm) {
                    alert('Xác nhận mật khẩu chưa đúng.')
                    return;
                }

                //Thêm các điều kiện khi đăng ký tài khoản


                $.getJSON('${pageContext.request.contextPath}/Account/IsAvailableUserName?user=' + username, function (data1) {//Kiểm tra UserName có tồn tại không
                    if (data1 === true) {
                        <%--$.getJSON('${pageContext.request.contextPath}/Account/IsAvailableEmail?email=' + email, function (data) {//Kiểm tra UserName có tồn tại không--%>
                        <%--    if (data === true) {--%>
                        <%--        $('#frmRegister').off('submit').submit();--%>
                        <%--    } else {--%>
                        <%--        alert('Email đã tồn tại.');--%>
                        <%--    }--%>
                        <%--});--%>
                        $('#frmRegister').off('submit').submit();
                    } else {
                        alert('Tên đăng nhập đã tồn tại.');
                    }
                });


            });
            $('#txtDOB').datetimepicker({
                format: 'd/m/Y',
                timepicker: false,
                mask: true
            });

            $('#txtUsername').select(); // Mạnh hơn autofocus
        </script>
<%--        <script type="text/javascript">--%>
<%--            var onloadCallback = function () {--%>
<%--                grecaptcha.render('html_element', {--%>
<%--                    'sitekey': '6LeFJUohAAAAAJ10jCCry_R9zXg4s97vx3N8u1xD'--%>
<%--                });--%>
<%--            };--%>
<%--        </script>--%>
    </jsp:attribute>

    <jsp:body>
        <form action="" method="post" id="frmRegister">
            <div class="card">
                <h4 class="card-header">
                    Đăng ký tài khoản
                </h4>
                <div class="card-body">
                    <h5>Tài khoản</h5>
                    <div class="form-group">
                        <label for="txtUsername">Tên đăng nhập</label>
                        <input type="text" class="form-control" id="txtUsername" name="username">
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">Mật khẩu</label>
                        <input type="password" class="form-control" id="txtPassword" name="rawpwd">
                    </div>
                    <div class="form-group">
                        <label for="txtConfirm">Xác nhận mật khẩu</label>
                        <input type="password" class="form-control" id="txtConfirm">
                    </div>

                    <h5 class="mt-4">Thông tin cá nhân</h5>
                    <div class="form-group">
                        <label for="txtName">Tên</label>
                        <input type="text" class="form-control" id="txtName" name="name">
                    </div>
                    <div class="form-group">
                        <label for="txtAddress">Địa chỉ</label>
                        <input type="text" class="form-control" id="txtAddress" name="address">
                    </div>
                    <div class="form-group">
                        <label for="txtPhone">Số điện thoại</label>
                        <input type="text" class="form-control" id="txtPhone" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Email</label>
                        <input type="text" class="form-control" id="txtEmail" name="email">
                    </div>
                    <div class="form-group">
                        <label for="txtDOB">Ngày tháng năm sinh</label>
                        <input type="text" class="form-control" id="txtDOB" name="dob">
                    </div>
                    <p style="color:red;">${errorString}</p>
                    <!-- reCAPTCHA -->
                    <div class="g-recaptcha"
                         data-sitekey="6LeFJUohAAAAAJ10jCCry_R9zXg4s97vx3N8u1xD">

                    </div>
                </div>

                <div class="card-footer">

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Register
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:main>