<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="idProEnd" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="categories" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Category>"/>

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

        <script>

            $('#txtEndDay').datetimepicker({
                DateTimeFormat: "d/m/Y H:m",
                timepicker: false,
                mask: true
            });
        </script>
        <script>
            $('input[id="ImageMain"]').change(function (e) {
                var fileName = e.target.files[0].name;
                $("#file").val(fileName);

                var reader = new FileReader();
                reader.onload = function (e) {
                    // get loaded data and render thumbnail.
                    document.getElementById("preview").src = e.target.result;
                };
                // read the image file as a data URL.
                reader.readAsDataURL(this.files[0]);
            });
            $('input[id="ImageSub1"]').change(function (e) {
                var fileName = e.target.files[0].name;
                $("#file").val(fileName);

                var reader = new FileReader();
                reader.onload = function (e) {
                    // get loaded data and render thumbnail.
                    document.getElementById("preview1").src = e.target.result;
                };
                // read the image file as a data URL.
                reader.readAsDataURL(this.files[0]);
            });
            $('input[id="ImageSub2"]').change(function (e) {
                var fileName = e.target.files[0].name;
                $("#file").val(fileName);

                var reader = new FileReader();
                reader.onload = function (e) {
                    // get loaded data and render thumbnail.
                    document.getElementById("preview2").src = e.target.result;
                };
                // read the image file as a data URL.
                reader.readAsDataURL(this.files[0]);
            });
            $('input[id="ImageSub3"]').change(function (e) {
                var fileName = e.target.files[0].name;
                $("#file").val(fileName);

                var reader = new FileReader();
                reader.onload = function (e) {
                    // get loaded data and render thumbnail.
                    document.getElementById("preview3").src = e.target.result;
                };
                // read the image file as a data URL.
                reader.readAsDataURL(this.files[0]);
            });

            $('#frmAdd').on('submit', function (e) {
                e.preventDefault();
                const money = $('#money').val();
                const price = $('#numStartingPrice').val();

                if (money < price * 20/100) {
                    alert('S??? ti???n b???n kh??ng ????? ????? t???o s???n ph???m.')
                    return;
                }

                $('#frmAdd').off('submit').submit();


            });
        </script>

    </jsp:attribute>
    <jsp:body>
        <form action="" method="post" enctype="multipart/form-data" id="frmAdd">
            <div class="card">
                <h4 class="card-header d-flex">
                    <a href="${pageContext.request.contextPath}/Account/Profile"
                       role="button" style=" margin-right: 27px;">
                        <i class="bi bi-backspace-fill" aria-hidden="true"></i>
                    </a>
                    <p>T???o s???n ph???m mu???n b??n</p>
                </h4>
                <div class="card-body">
                    <div class="form-group" hidden>
                        <label for="UserSellID">User Sell ID</label>
                        <input type="text" class="form-control" id="UserSellID" name="UserSellID"
                               value="${authUser.id}">
                        <input type="number" id="money" name="money"
                               value="${authUser.money}">
                    </div>
                    <div class="form-group" hidden>
                        <label for="ProID">ProID</label>
                        <input type="text" class="form-control" id="ProID" name="ProID" value="${idProEnd + 1}">
                    </div>
                    <div class="form-group">
                        <label for="txtProName">T??n s???n ph???m</label>
                        <input type="text" class="form-control" id="txtProName" name="ProName" autofocus>
                    </div>
                    <div class="form-row">
                        <div class="col-md-6 mb-3">
                            <label for="ImageMain" class="custom-label">???nh ch??nh</label>
                            <input type="file" class="form-control-file" id="ImageMain" name="ImageMain">
                            <div class="ml-2 col-sm-6">
                                <img src="https://placehold.it/80x80" id="preview" class="img-thumbnail"
                                     style="height: 250px;">
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="ImageSub1" class="custom-label">???nh ph??? 1</label>
                            <input type="file" class="form-control-file" id="ImageSub1" name="ImageSub1">
                            <div class="ml-2 col-sm-6">
                                <img src="https://placehold.it/80x80" id="preview1" class="img-thumbnail"
                                     style="height: 250px;">
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="ImageSub2" class="custom-label">???nh ph??? 2</label>
                            <input type="file" class="form-control-file" id="ImageSub2" name="ImageSub2">
                            <div class="ml-2 col-sm-6">
                                <img src="https://placehold.it/80x80" id="preview2" class="img-thumbnail"
                                     style="height: 250px;">
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="ImageSub3" class="custom-label">???nh ph??? 3</label>
                            <input type="file" class="form-control-file" id="ImageSub3" name="ImageSub3">
                            <div class="ml-2 col-sm-6">
                                <img src="https://placehold.it/80x80" id="preview3" class="img-thumbnail"
                                     style="height: 250px;">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="numStartingPrice">Gi?? kh???i ??i???m</label>
                        <input type="number" class="form-control" id="numStartingPrice" name="StartingPrice">
                    </div>
                    <div class="form-group">
                        <label for="numStepPrice">B?????c gi??</label>
                        <input type="number" class="form-control" id="numStepPrice" name="StepPrice">
                    </div>
                    <div class="form-group">
                        <label>Lo???i s???n ph???m</label>
                        <select class="form-select" aria-label="Default select example" name="CatID">
                            <c:forEach items="${categories}" var="c">
                                <option value="${c.catID}">${c.catName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="txtTinyDes">M?? t??? ng???n</label>
                        <input type="text" class="form-control" id="txtTinyDes" name="TinyDes">
                    </div>
                    <div class="form-group">
                        <label for="txtFullDes">M?? t??? chi ti???t</label>
                        <input type="text" class="form-control" id="txtFullDes" name="FullDes">
                    </div>
                    <div class="form-group">
                        <label for="txtEndDay">Ng??y k???t th??c</label>
                        <input type="text" class="form-control" id="txtEndDay" name="EndDay">
                    </div>
                </div>
                <div class="card-footer">
                    <c:if test="${authUser.permission == 0}">
                        <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Product/"
                           role="button">
                            <i class="fa fa-backward" aria-hidden="true"></i>
                            Danh s??ch s???n ph???m
                        </a>
                    </c:if>
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        L??u
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:main>