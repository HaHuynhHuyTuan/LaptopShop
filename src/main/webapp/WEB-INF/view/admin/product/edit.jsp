<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa người dùng</title>
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
                <h3 class="mb-4">Chỉnh sửa người dùng</h3>

                <form:form action="/admin/user/edit/${user.id}" method="post" enctype="multipart/form-data"
                           modelAttribute="user">

                    <c:if test="${not empty user.avatar}">
                        <div class="mb-3">
                            <label>Avatar hiện tại:</label><br>
                            <img src="/images/avatar/${user.avatar}" style="max-height: 250px;">
                        </div>
                    </c:if>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="email">Email:</label>
                            <form:input path="email" id="email" type="email"
                                        class="form-control ${not empty errors.email ? 'is-invalid' : ''}"/>
                            <form:errors path="email" cssClass="invalid-feedback"/>
                        </div>
                        <div class="col-md-6">
                            <label for="password">Password:</label>
                            <form:password path="password" id="password" class="form-control"/>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="phone">Số điện thoại:</label>
                            <form:input path="phone" id="phone"
                                        class="form-control ${not empty errors.phone ? 'is-invalid' : ''}"/>
                            <form:errors path="phone" cssClass="invalid-feedback"/>
                        </div>
                        <div class="col-md-6">
                            <label for="fullName">Họ và tên:</label>
                            <form:input path="fullName" id="fullName" class="form-control"/>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address">Địa chỉ:</label>
                        <form:input path="address" id="address" class="form-control"/>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="role">Vai trò:</label>
                            <form:select path="role.name" id="role"
                                         class="form-select ${not empty errors.role ? 'is-invalid' : ''}">
                                <form:option value="">-- Chọn Vai Trò --</form:option>
                                <form:option value="ADMIN">ADMIN</form:option>
                                <form:option value="USER">USER</form:option>
                            </form:select>
                            <form:errors path="role" cssClass="invalid-feedback"/>
                        </div>
                        <div class="col-md-6">
                            <label for="avatarFile">Ảnh đại diện mới:</label>
                            <input type="file" name="avatarFile" id="avatarFile" class="form-control"
                                   accept=".jpg,.png,.jpeg"/>
                        </div>
                    </div>

                    <div class="mb-3 text-center">
                        <img id="avatarPreview" style="max-height: 250px; display: none;" alt="Avatar Preview"/>
                    </div>

                    <div class="text-center mt-4">
                        <a href="/admin/user" class="btn btn-secondary me-2">Quay lại danh sách</a>
                        <button type="submit" class="btn btn-primary">Cập nhật người dùng</button>
                    </div>

                </form:form>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>

<!-- Optional JavaScript for avatar preview -->
<script>
    document.getElementById("avatarFile").addEventListener("change", function (e) {
        const [file] = this.files;
        if (file) {
            const preview = document.getElementById("avatarPreview");
            preview.src = URL.createObjectURL(file);
            preview.style.display = "block";
        }
    });
</script>
</body>
</html>
