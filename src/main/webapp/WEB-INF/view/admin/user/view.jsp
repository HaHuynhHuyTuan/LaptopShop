<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết người dùng</title>
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
                <h2 class="mb-4">Chi tiết người dùng</h2>
                <ul class="list-group">
                    <li class="list-group-item"><strong>ID:</strong> ${user.id}</li>
                    <li class="list-group-item"><strong>Họ tên:</strong> ${user.fullName}</li>
                    <li class="list-group-item"><strong>Email:</strong> ${user.email}</li>
                    <li class="list-group-item"><strong>Địa chỉ:</strong> ${user.address}</li>
                    <li class="list-group-item"><strong>SĐT:</strong> ${user.phone}</li>
                    <!-- Thêm dòng này để hiển thị role -->
                    <li class="list-group-item"><strong>Role:</strong> ${user.role.name}</li>

                    <!-- Hiển thị ảnh người dùng -->
                    <li class="list-group-item">
                        <strong>Ảnh người dùng:</strong>
                        <img src="/uploads/images/${user.avatar}" alt="Ảnh người dùng" class="img-fluid"
                             style="max-width: 200px; max-height: 200px;"/>
                    </li>
                </ul>
                <a href="/admin/user" class="btn btn-secondary mt-3">Quay lại</a>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
</body>
</html>
