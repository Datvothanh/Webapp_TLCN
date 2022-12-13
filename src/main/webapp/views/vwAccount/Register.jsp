<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Web App</title>
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/public/imgs/login/logo.svg"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"
          integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <style>
        <%@include file="../../css/login.css" %>
    </style>
</head>
<body>
<main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
        <div class="card login-card">
            <div class="row no-gutters">
                <div class="col-md-5">
                    <img src="${pageContext.request.contextPath}/public/imgs/register/register.jpg" alt="login"
                         class="login-card-img">
                </div>
                <div class="col-md-7">
                    <div class="card-body">
                        <a class="brand-wrapper" href="${pageContext.request.contextPath}/Home">
                            <img src="${pageContext.request.contextPath}/public/imgs/login/logo.svg" alt="logo"
                                 class="logo">
                        </a>
                        <p class="login-card-description">Đăng ký tài khoản mới</p>
                        <form action="" method="post" id="frmRegister">
                            <div class="form-group ">
                                <label for="txtName">Tên</label>
                                <input type="text" class="form-control" id="txtName" name="name">
                            </div>

                            <div class="form-group mb-4">
                                <label for="txtUsername">Tên đăng nhập</label>
                                <input type="text" class="form-control" id="txtUsername" name="username">
                            </div>
                            <div class="form-group mb-4">
                                <label for="txtPassword">Mật khẩu</label>
                                <input type="password" class="form-control" id="txtPassword" name="rawpwd">
                            </div>
                            <div class="form-group mb-4">
                                <label for="txtConfirm">Xác nhận mật khẩu</label>
                                <input type="password" class="form-control" id="txtConfirm">
                            </div>
                            <div class="form-group mb-4">
                                <label for="txtAddress">Địa chỉ</label>
                                <input type="text" class="form-control" id="txtAddress" name="address">
                            </div>
                            <div class="form-group mb-4">
                                <label for="txtPhone">Số điện thoại</label>
                                <input type="text" class="form-control" id="txtPhone" name="phone">
                            </div>
                            <div class="form-group mb-4">
                                <label for="txtEmail">Email</label>
                                <input type="text" class="form-control" id="txtEmail" name="email">
                            </div>
                            <div class="form-group mb-4">
                                <label for="txtDOB">Ngày tháng năm sinh</label>
                                <input type="text" class="form-control" id="txtDOB" name="dob">
                            </div>
                            <p style="color:red;">${errorString}</p>
                            <!-- reCAPTCHA -->
                            <div class="g-recaptcha mb-4"
                                 data-sitekey="6LeFJUohAAAAAJ10jCCry_R9zXg4s97vx3N8u1xD">

                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1"> <a  data-toggle="modal" data-target="#staticBackdrop" >Đồng ý với điều kiện của chúng tôi</a></label>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content" style="width: 150%;">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel"><strong>Nội quy và chính sách</strong></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>
                                            Chúng tôi cam kết cung cấp một thị trường an toàn và công bằng cho người mua và người bán của chúng tôi. Để hỗ trợ cam kết này, chúng tôi đã đưa ra các quy tắc và chính sách chi phối kỳ vọng của chúng tôi đối với người mua và người bán, các hành động chúng tôi sẽ thực hiện để giữ an toàn cho bạn và cách chúng tôi sẽ bảo vệ bạn nếu có sự cố xảy ra.
                                                <br/>
                                                <strong>Các mặt hàng bị cấm và hạn chế:</strong>
                                                <br/>
                                            -Các mặt hàng người lớn.
                                                <br/>
                                            -Vũ khí.
                                                <br/>
                                            -Rượu, bia, chất kích thích.
                                                <br/>
                                            -Các sản phẩm về động vật.
                                                <br/>
                                            -Các sản phẩm mạ vàng hay vàng thỏi.
                                                <br/>
                                            -Tiền sưu tầm.
                                                <br/>
                                            -Mỹ phẩm đã qua sử dụng.
                                                <br/>
                                            -Hàng giả.
                                                <br/>
                                            -Phiếu giảm giá, vé số, tem.
                                                <br/>
                                            -Thực phẩm không đảm bảo an toàn vệ sinh.
                                                <br/>
                                            -Các chất hóa học.
                                                <br/>
                                            -Thông tin cá nhân.
                                                <br/>
                                            -Thực vật có nguy cơ tuyệt chủng.
                                                <br/>
                                            -Có sử dụng thông tin của trẻ vị thành niên.
                                                <br/>
                                            -Các sản phẩm đồ chơi mô phỏng vũ khí.
                                                <br/>
                                            -Bất động sản.
                                                <br/>
                                            -Các dụng cụ đánh bạc.
                                                <br/>
                                            -Phim, ảnh không có bản quyền hoặc chứa nội dung bạo lực.
                                                <br/>
                                            -Tiền ảo.
                                                <br/>
                                            -Thuốc lá hoặc thuốc lá điện tử.
                                                <br/>
                                            -Thuốc men.
                                                <br/>
                                                <strong>Chính sách về nội dung</strong>
                                                <br/>
                                            -Không sử dụng hình ảnh của cá nhân, tổ chức khác khi không được cho phép.
                                                <br/>
                                            -Kích thước ảnh vượt mức tối đa.
                                                <br/>
                                            -Chất lượng ảnh kém, bị mờ.
                                                <br/>
                                            -Cấm sử dụng nội dung xúc phạm, nói xấu.
                                                <br/>
                                            -Cấm sử dụng nội dung bịa đặt.
                                                <br/>
                                            -Cấm sử dụng nội dung khiêu dâm.
                                                <br/>
                                            -Cấm sử dụng nội dung phân biệt chủng tộc, giới tính.
                                                <br/>
                                            -Cấm sử dụng nội dung tuyên truyền chính trị, thúc đẩy tham gia vào một tổ chức bất kì.
                                                <br/>
                                            -Cấm sử dụng nội dung hướng người dùng ra khỏi trang web hay kêu gọi mọi người tham gia trang web khác.
                                            Báo cáo vi phạm
                                                <br/>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input class="btn btn-block login-btn mb-4" name="register" id="register" type="submit"
                                   value="Đăng ký">
                        </form>
                        <p class="login-card-footer-text">Bạn đã sẵn sàng đăng nhập ? <a
                                href="${pageContext.request.contextPath}/Account/Login" class="text-reset">Đăng nhập ở
                            đây</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"
        integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
<script>
    const validateEmail = (email) => {
        return String(email)
            .toLowerCase()
            .match(
                /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
            );
    };
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
        const elm = document.getElementById('exampleCheck1');
        if ( elm.checked === false) {
            alert('Bạn cần đồng ý với điều khoản của chúng tôi!')
            return;
        }
        if (name.length === 0) {
            alert('Tên không hợp lệ.')
            return;
        }
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
        if (password !== passwordConfirm) {
            alert('Xác nhận mật khẩu chưa đúng.')
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
        if (!validateEmail(email)) {
            alert('Email không hợp lệ.')
            return;
        }
        if (dob.length === 0) {
            alert('Ngày tháng năm sinh không hợp lệ.')
            return;
        }

        $.getJSON('${pageContext.request.contextPath}/Account/IsAvailableUserName?user=' + username, function (data1) {//Kiểm tra UserName có tồn tại không
            if (data1 === true) {
                $.getJSON('${pageContext.request.contextPath}/Account/IsAvailableEmail?email=' + email, function (data) {//Kiểm tra UserName có tồn tại không
                    // if (data === true) {
                    //     $('#frmRegister').off('submit').submit();
                    // } else {
                    //     alert('Email đã tồn tại.');
                    // }
                        $('#frmRegister').off('submit').submit();
                });
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
</body>
</html>
