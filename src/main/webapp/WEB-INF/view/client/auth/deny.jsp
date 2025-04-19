<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Access Denied</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">

<div class="text-center">
    <div class="card shadow p-4 border-danger" style="max-width: 400px;">
        <h1 class="text-danger">403</h1>
        <h4 class="mb-3">Bạn không có quyền truy cập trang này!</h4>
        <p class="text-muted">Vui lòng kiểm tra lại quyền truy cập hoặc đăng nhập bằng tài khoản khác.</p>
        <a href="/" class="btn btn-primary mt-3">🔙 Quay về trang chủ</a>
    </div>
</div>

</body>
</html>
