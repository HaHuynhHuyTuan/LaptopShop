<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <title>Dashboard - Sản phẩm</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/slidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Quản lý Sản Phẩm</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Sản phẩm</li>
                </ol>

                <a href="/admin/product/create" class="btn btn-primary mb-3">Thêm sản phẩm</a>

                <table class="table table-bordered table-striped align-middle">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Nhà sản xuất</th>
                        <%--                        <th>Ảnh</th>--%>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.name}</td>
                            <td>${product.price}</td>
                            <td>${product.factory}</td>
                                <%--                            <td>--%>
                                <%--                                <c:if test="${not empty product.image}">--%>
                                <%--                                    <img src="/uploads/product/${product.image}" alt="Product Image"--%>
                                <%--                                         style="height: 60px; object-fit: cover;">--%>
                                <%--                                </c:if>--%>
                                <%--                            </td>--%>
                            <td>
                                <a href="/admin/product/view?id=${product.id}" class="btn btn-sm btn-info">Xem</a>
                                <a href="/admin/product/edit?id=${product.id}" class="btn btn-sm btn-warning">Sửa</a>
                                <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal"
                                        data-bs-target="#deleteModal${product.id}">
                                    Xóa
                                </button>

                                <!-- Modal xác nhận xóa -->
                                <div class="modal fade" id="deleteModal${product.id}" tabindex="-1"
                                     aria-labelledby="deleteLabel${product.id}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header bg-danger text-white">
                                                <h5 class="modal-title" id="deleteLabel${product.id}">Xác nhận xóa</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Đóng"></button>
                                            </div>
                                            <div class="modal-body">
                                                Bạn có chắc chắn muốn xóa sản phẩm
                                                <strong>${product.name}</strong>?
                                            </div>
                                            <div class="modal-footer">
                                                <a href="/admin/product/delete?id=${product.id}"
                                                   class="btn btn-danger">Xóa</a>
                                                <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Hủy
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Kết thúc modal -->
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

<!-- Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>
</html>
