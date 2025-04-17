<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/slidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4 mt-4">
                <h1 class="mt-4">Quản lý người dùng</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Users</li>
                </ol>
                <a href="/admin/user/create" class="btn btn-primary mb-3">Thêm người dùng</a>

                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Họ tên</th>
                        <th>Email</th>
                        <th>Địa chỉ</th>
                        <th>SĐT</th>
                        <th>Role</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.fullName}</td>
                            <td>${user.email}</td>
                            <td>${user.address}</td>
                            <td>${user.phone}</td>
                            <td>${user.role.name}</td>
                            <td>
                                <a href="<c:url value='/admin/user/view/${user.id}'/>"
                                   class="btn btn-sm btn-info">Xem</a>
                                <a href="<c:url value='/admin/user/edit/${user.id}'/>" class="btn btn-sm btn-warning">Sửa</a>

                                <!-- Nút mở modal xóa -->
                                <button type="button" class="btn btn-sm btn-danger"
                                        data-bs-toggle="modal" data-bs-target="#deleteModal${user.id}">
                                    Xóa
                                </button>

                                <!-- Modal xác nhận xóa -->
                                <div class="modal fade" id="deleteModal${user.id}" tabindex="-1"
                                     aria-labelledby="deleteLabel${user.id}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content border-0 rounded-3 shadow-lg">
                                            <div class="modal-header bg-danger text-white">
                                                <h5 class="modal-title" id="deleteLabel${user.id}">Xác nhận xóa</h5>
                                                <button type="button" class="btn-close btn-close-white"
                                                        data-bs-dismiss="modal" aria-label="Đóng"></button>
                                            </div>
                                            <div class="modal-body">
                                                Bạn có chắc chắn muốn xóa người dùng <strong>${user.fullName}</strong>?
                                            </div>
                                            <div class="modal-footer">
                                                <form action="/admin/user/delete/${user.id}" method="post">
                                                    <button type="submit" class="btn btn-danger">Xóa</button>
                                                    <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">Hủy
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>
</html>
