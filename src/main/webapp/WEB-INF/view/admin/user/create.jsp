<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({"display": "block"});
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
                <h3 class="mb-4">Tạo Người Dùng Mới</h3>
                <form:form action="/admin/user/create" method="post" enctype="multipart/form-data"
                           modelAttribute="user">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <!-- Xử lý lỗi cho email -->
                            <label for="email" class="form-label">Email:</label>
                            <form:input path="email"
                                        class="form-control ${not empty errorsEmail ? 'is-invalid': ''}"
                                        type="email" id="email" placeholder="Nhập email"/>
                            <form:errors path="email" cssClass="invalid-feedback"/>
                        </div>

                        <div class="col-md-6">
                            <!-- Xử lý lỗi cho password -->
                            <label for="password" class="form-label">Password:</label>
                            <form:password path="password"
                                           class="form-control ${not empty errorsPassword ? 'is-invalid': ''}"
                                           id="password" placeholder="Nhập mật khẩu"/>
                            <form:errors path="password" cssClass="invalid-feedback"/>
                        </div>
                    </div>

                    <div class="row g-3">
                        <!-- Họ và tên -->
                        <div class="col-md-6">
                            <label for="fullName" class="form-label">Họ và tên</label>
                            <form:input path="fullName" class="form-control" id="fullName"
                                        placeholder="Nhập họ và tên"/>
                            <form:errors path="fullName" cssClass="invalid-feedback"/>
                        </div>

                        <!-- Số điện thoại -->
                        <div class="col-md-6">
                            <label for="phone" class="form-label">Số điện thoại</label>
                            <form:input path="phone" class="form-control" id="phone" placeholder="Nhập số điện thoại"/>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address" class="form-label">Địa chỉ:</label>
                        <form:input path="address" class="form-control" id="address" placeholder="Nhập địa chỉ"/>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="role" class="form-label">Vai trò:</label>
                            <form:select path="role.name" class="form-select" id="role">
                                <form:option value="" label="-- Chọn Vai Trò --"/>
                                <form:option value="ADMIN">ADMIN</form:option>
                                <form:option value="USER">USER</form:option>
                            </form:select>
                        </div>

                        <div class="col-md-6">
                            <label for="avatarFile" class="form-label">Avatar:</label>
                            <input type="file" name="avatarFile" class="form-control" id="avatarFile"
                                   accept=".png, .jpg, .jpeg"/>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-12">
                            <img style="max-height: 250px; display: none;" alt="Avatar Preview" id="avatarPreview"/>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Tạo Người Dùng</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
</body>
</html>
