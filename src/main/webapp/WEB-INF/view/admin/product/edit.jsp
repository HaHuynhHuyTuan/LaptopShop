<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/slidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main class="p-4">
            <div class="container-fluid px-4">
                <h3 class="mb-4">Chỉnh sửa sản phẩm</h3>

                <form:form action="/admin/product/edit/${product.id}" method="post" enctype="multipart/form-data"
                           modelAttribute="product">

                    <c:if test="${not empty product.image}">
                        <div class="mb-3">
                            <label>Ảnh hiện tại:</label><br>
                            <img src="/images/product/${product.image}" style="max-height: 250px;">
                        </div>
                    </c:if>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="name">Tên sản phẩm:</label>
                            <form:input path="name" id="name"
                                        class="form-control ${not empty errors.name ? 'is-invalid' : ''}"/>
                            <form:errors path="name" cssClass="invalid-feedback"/>
                        </div>
                        <div class="col-md-6">
                            <label for="price">Giá:</label>
                            <form:input path="price" id="price" type="number" step="0.01"
                                        class="form-control ${not empty errors.price ? 'is-invalid' : ''}"/>
                            <form:errors path="price" cssClass="invalid-feedback"/>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="quantity">Số lượng:</label>
                            <form:input path="quantity" id="quantity" type="number"
                                        class="form-control ${not empty errors.quantity ? 'is-invalid' : ''}"/>
                            <form:errors path="quantity" cssClass="invalid-feedback"/>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="detailDesc">Mô tả chi tiết:</label>
                        <form:textarea path="detailDesc" id="detailDesc" rows="4"
                                       class="form-control ${not empty errors.detailDesc ? 'is-invalid' : ''}"/>
                        <form:errors path="detailDesc" cssClass="invalid-feedback"/>
                    </div>

                    <div class="mb-3">
                        <label for="shortDesc">Mô tả ngắn:</label>
                        <form:textarea path="shortDesc" id="shortDesc" rows="2"
                                       class="form-control ${not empty errors.shortDesc ? 'is-invalid' : ''}"/>
                        <form:errors path="shortDesc" cssClass="invalid-feedback"/>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="factory">Nhà sản xuất:</label>
                            <form:select path="factory" id="factory"
                                         class="form-select ${not empty errors.factory ? 'is-invalid' : ''}">
                                <form:option value="" label="-- Chọn nhà sản xuất --"/>
                                <form:option value="Apple">Apple (Macbook)</form:option>
                                <form:option value="Asus">Asus</form:option>
                                <form:option value="Lenovo">Lenovo</form:option>
                                <form:option value="Dell">Dell</form:option>
                                <form:option value="LG">LG</form:option>
                                <form:option value="Acer">Acer</form:option>
                            </form:select>
                            <form:errors path="factory" cssClass="invalid-feedback"/>
                        </div>

                        <div class="col-md-6">
                            <label for="target">Mục đích sử dụng:</label>
                            <form:select path="target" id="target"
                                         class="form-select ${not empty errors.target ? 'is-invalid' : ''}">
                                <form:option value="" label="-- Chọn mục đích sử dụng --"/>
                                <form:option value="Gaming">Gaming</form:option>
                                <form:option value="Sinh viên - văn phòng">Sinh viên - văn phòng</form:option>
                                <form:option value="Thiết kế đồ họa">Thiết kế đồ họa</form:option>
                                <form:option value="Mỏng nhẹ">Mỏng nhẹ</form:option>
                                <form:option value="Doanh nhân">Doanh nhân</form:option>
                            </form:select>
                            <form:errors path="target" cssClass="invalid-feedback"/>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="imageFile">Ảnh sản phẩm:</label>
                            <input type="file" name="imageFile" class="form-control" id="imageFile"
                                   accept=".png, .jpg, .jpeg"/>
                        </div>
                        <div class="col-md-6">
                            <img style="max-height: 250px; display: none;" alt="Image Preview" id="imagePreview"/>
                        </div>
                    </div>

                    <div class="text-center mt-4">
                        <a href="/admin/product" class="btn btn-secondary me-2">Quay lại danh sách</a>
                        <button type="submit" class="btn btn-primary">Cập nhật sản phẩm</button>
                    </div>

                </form:form>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>

<!-- Optional JavaScript for image preview -->
<script>
    document.getElementById("imageFile").addEventListener("change", function (e) {
        const [file] = this.files;
        if (file) {
            const preview = document.getElementById("imagePreview");
            preview.src = URL.createObjectURL(file);
            preview.style.display = "block";
        }
    });
</script>
</body>
</html>
