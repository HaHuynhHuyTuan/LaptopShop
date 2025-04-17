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
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <c:set var="errorsEmail">
                                <form:errors path="email" cssClass="invalid-feedback"/>
                            </c:set>
                            <label>Email:</label>
                            <form:input path="email"
                                        class="form-control ${not empty errorsEmail ? 'is-invalid': ''}"
                                        type="email"
                            />
                                ${errorsEmail}
                        </div>
                        <div class="col-md-6">
                            <c:set var="errorsPassword">
                                <form:errors path="password" cssClass="invalid-feedback"/>
                            </c:set>
                            <label>Password:</label>
                            <form:password path="password"
                                           class="form-control ${not empty errorsPassword ? 'is-invalid': ''}"
                            />
                                ${errorsPassword}
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <c:set var="errorsPhone">
                                <form:errors path="phone" cssClass="invalid-feedback"/>
                            </c:set>
                            <label>Số điện thoại:</label>
                            <form:input path="phone"
                                        class="form-control ${not empty errorsPhone ? 'is-invalid': ''}"
                            />
                                ${errorsPhone}
                        </div>
                        <div class="col-md-6">
                            <c:set var="errorsFullName">
                                <form:errors path="fullName" cssClass="invalid-feedback"/>
                            </c:set>
                            <label>Họ và tên:</label>
                            <form:input path="fullName"
                                        class="form-control ${not empty errorsFullName ? 'is-invalid': ''}"
                            />
                                ${errorsFullName}
                        </div>
                    </div>
                    <div class="mb-3">
                        <label>Địa chỉ:</label>
                        <form:input path="address" class="form-control"/>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label>Vai trò:</label>
                            <form:select path="role.name" class="form-select">
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
                        <div class="col-12 mb-3">
                            <img style="max-height: 250px; display: none;" alt="Avatar Preview" id="avatarPreview"/>
                        </div>
                        <div class="col-12 mb-3">
                            <button type="submit" class="btn btn-primary">Tạo Người Dùng</button>
                        </div>
                    </div>
                    </form:form>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
</body>
</html>
