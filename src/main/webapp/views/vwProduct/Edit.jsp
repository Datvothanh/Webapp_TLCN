<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="product" scope="request" type="com.example.webapp_tlcn.beans.Product"/>
<jsp:useBean id="categories" scope="request" type="java.util.List<com.example.webapp_tlcn.beans.Category>"/>
<t:admin>
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

    </jsp:attribute>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    Sản phẩm
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtProID">#</label>
                        <input type="text" class="form-control" id="txtProID" name="ProID" readonly
                               value="${product.proID}">
                    </div>
                    <div class="form-group">
                        <label for="txtProName">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="txtProName" name="ProName" autofocus
                               value="${product.proName}">
                    </div>
                        <%--                    <div class="custom-file mb-4">--%>
                        <%--                        <label for="ImageMain" class="custom-file-label">Ảnh chính</label>--%>
                        <%--                        <input type="file" class="custom-file-input" id="ImageMain" name="ImageMain" value="${product.proName}>--%>
                        <%--                    </div>--%>
                        <%--                    <div class="custom-file mb-4">--%>
                        <%--                        <label for="ImageSub1" class="custom-file-label">Ảnh phụ 1</label>--%>
                        <%--                        <input type="file" class="custom-file-input" id="ImageSub1" name="ImageSub1" value="${product.proName}>--%>
                        <%--                    </div>--%>
                        <%--                    <div class="custom-file mb-4">--%>
                        <%--                        <label for="ImageSub2" class="custom-file-label">Ảnh phụ 2</label>--%>
                        <%--                        <input type="file" class="custom-file-input" id="ImageSub2" name="ImageSub2">--%>
                        <%--                    </div>--%>
                        <%--                    <div class="custom-file mb-4">--%>
                        <%--                        <label for="ImageSub3" class="custom-file-label">Ảnh phụ 3</label>--%>
                        <%--                        <input type="file" class="custom-file-input" id="ImageSub3" name="ImageSub3">--%>
                        <%--                    </div>--%>
                    <div class="form-group">
                        <label for="numStartingPrice">Giá khởi điểm</label>
                        <input type="number" class="form-control" id="numStartingPrice" name="StartingPrice"
                               value="${product.startingPrice}">
                    </div>
                    <div class="form-group">
                        <label for="numStepPrice">Bước giá</label>
                        <input type="number" class="form-control" id="numStepPrice" name="StepPrice"
                               value="${product.stepPrice}">
                    </div>
                    <div class="form-group">
                        <label>Loại sản phẩm</label>
                        <select class="form-select" aria-label="Default select example" name="CatID">
                            <c:forEach items="${categories}" var="c">
                                <c:if test="${c.catID == product.catID}">
                                    <option value="${c.catID}">${c.catName}</option>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${categories}" var="c">
                                <c:if test="${c.catID != product.catID}">
                                    <option value="${c.catID}">${c.catName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="txtTinyDes">Mô tả ngắn</label>
                        <input type="text" class="form-control" id="txtTinyDes" name="TinyDes"
                               value="${product.tinyDes}">
                    </div>
                    <div class="form-group">
                        <label for="txtFullDes">Mô tả chi tiết</label>
                        <input type="text" class="form-control" id="txtFullDes" name="FullDes"
                               value="${product.fullDes}">
                    </div>
                    <div class="form-group">
                        <label for="txtEndDay">Ngày kết thúc (${product.endDay})</label>
                        <input type="text" class="form-control" id="txtEndDay" name="EndDay">
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Product/"
                       role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        Danh sách sản phẩm
                    </a>
                    <button type="submit" class="btn btn-danger"
                            formaction="${pageContext.request.contextPath}/Admin/Product/Delete">
                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                        Xóa
                    </button>
                    <button type="submit" class="btn btn-primary"
                            formaction="${pageContext.request.contextPath}/Admin/Product/Update">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Lưu
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:admin>