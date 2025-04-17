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
                <h2 class="mb-4">Chỉnh sửa người dùng</h2>
                <!-- Sửa modelAttribute và method -->
                <form:form action="/admin/user/edit/${user.id}" method="post" modelAttribute="user"
                           enctype="multipart/form-data">
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
                            <label>Password:</label>
                            <form:password path="password" class="form-control"/>
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
                            <label>Họ và tên:</label>
                            <form:input path="fullName" class="form-control"/>
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
                                <form:option value="">-- Chọn Vai Trò --</form:option>
                                <form:option value="ADMIN">ADMIN</form:option>
                                <form:option value="USER">USER</form:option>
                            </form:select>
                        </div>
                        <div class="col-md-6">
                            <label for="avatarFile">Cập nhật Avatar:</label>
                            <input type="file" name="avatarFile" id="avatarFile" class="form-control"
                                   accept=".jpg,.png,.jpeg"/>
                        </div>

                        <div class="col-12 mt-3">
                            <label>Ảnh hiện tại:</label><br/>
                            <c:if test="${not empty user.avatar}">
                                <img src="/images/avatar/${user.avatar}" id="avatarPreview" alt="Avatar"
                                     style="max-height: 250px;">
                            </c:if>
                            <c:if test="${empty user.avatar}">
                                <img id="avatarPreview" style="max-height: 250px; display: none;" alt="Avatar Preview"/>
                            </c:if>
                        </div>

                        <div class="col-12 mt-3">
                            <button type="submit" class="btn btn-success">Cập nhật</button>
                            <a href="/admin/user" class="btn btn-secondary">Quay lại</a>
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
