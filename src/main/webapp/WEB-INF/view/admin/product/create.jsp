<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script>
        $(document).ready(() => {
            $("#imageFile").change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#imagePreview").attr("src", imgURL).css("display", "block");
            });
        });
    </script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/slidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main class="p-4">
            <div class="container-fluid px-4">
                <h3 class="mb-4">Tạo Sản Phẩm Mới</h3>

                <form:form action="/admin/product/create" method="post" enctype="multipart/form-data"
                           modelAttribute="product">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <c:set var="errorsName">
                                <form:errors path="name" cssClass="invalid-feedback"/>
                            </c:set>
                            <label for="name">Tên sản phẩm:</label>
                            <form:input path="name" id="name"
                                        class="form-control ${not empty errorsName ? 'is-invalid' : ''}"/>
                                ${errorsName}
                        </div>
                        <div class="col-md-6">
                            <c:set var="errorsPrice">
                                <form:errors path="price" cssClass="invalid-feedback"/>
                            </c:set>
                            <label for="price">Giá:</label>
                            <form:input path="price" id="price" type="number" step="0.01"
                                        class="form-control ${not empty errorsPrice ? 'is-invalid' : ''}"/>
                                ${errorsPrice}
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <c:set var="errorsQuantity">
                                <form:errors path="quantity" cssClass="invalid-feedback"/>
                            </c:set>
                            <label for="quantity">Số lượng:</label>
                            <form:input path="quantity" id="quantity" type="number"
                                        class="form-control ${not empty errorsQuantity ? 'is-invalid' : ''}"/>
                                ${errorsQuantity}
                        </div>
                    </div>

                    <div class="mb-3">
                        <c:set var="errorsDetailDesc">
                            <form:errors path="detailDesc" cssClass="invalid-feedback"/>
                        </c:set>
                        <label for="detailDesc">Mô tả chi tiết:</label>
                        <form:textarea path="detailDesc" id="detailDesc"
                                       class="form-control ${not empty errorsDetailDesc ? 'is-invalid' : ''}" rows="4"/>
                            ${errorsDetailDesc}
                    </div>

                    <div class="mb-3">
                        <c:set var="errorsShortDesc">
                            <form:errors path="shortDesc" cssClass="invalid-feedback"/>
                        </c:set>
                        <label for="shortDesc">Mô tả ngắn:</label>
                        <form:textarea path="shortDesc" id="shortDesc"
                                       class="form-control ${not empty errorsShortDesc ? 'is-invalid' : ''}" rows="2"/>
                            ${errorsShortDesc}
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="factory" class="form-label">Nhà sản xuất:</label>
                            <form:select path="factory" id="factory"
                                         class="form-select ${not empty errorsFactory ? 'is-invalid' : ''}">
                                <form:option value="" label="-- Chọn nhà sản xuất --"/>
                                <form:option value="Apple">Apple (Macbook)</form:option>
                                <form:option value="Asus">Asus</form:option>
                                <form:option value="Lenovo">Lenovo</form:option>
                                <form:option value="Dell">Dell</form:option>
                                <form:option value="LG">LG</form:option>
                                <form:option value="Acer">Acer</form:option>
                            </form:select>
                                ${errorsFactory}
                        </div>
                        <div class="col-md-6">
                            <label for="target" class="form-label">Mục đích sử dụng:</label>
                            <form:select path="target" id="target"
                                         class="form-select ${not empty errorsTarget ? 'is-invalid' : ''}">
                                <form:option value="" label="-- Chọn mục đích sử dụng --"/>
                                <form:option value="Gaming">Gaming</form:option>
                                <form:option value="Sinh viên - văn phòng">Sinh viên - văn phòng</form:option>
                                <form:option value="Thiết kế đồ họa">Thiết kế đồ họa</form:option>
                                <form:option value="Mỏng nhẹ">Mỏng nhẹ</form:option>
                                <form:option value="Doanh nhân">Doanh nhân</form:option>
                            </form:select>
                                ${errorsTarget}
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="imageFile" class="form-label">Ảnh sản phẩm:</label>
                            <input type="file" name="imageFile" class="form-control" id="imageFile"
                                   accept=".png, .jpg, .jpeg"/>
                        </div>
                        <div class="col-md-6">
                            <img style="max-height: 250px; display: none;" alt="Image Preview" id="imagePreview"/>
                        </div>
                    </div>

                    <div class="mb-3 text-center">
                        <button type="submit" class="btn btn-primary">Tạo Sản Phẩm</button>
                    </div>
                </form:form>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
</body>
</html>
