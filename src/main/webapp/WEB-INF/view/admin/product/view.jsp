<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/slidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main class="p-4">
            <div class="container-fluid px-4">
                <h3 class="mb-4">Chi tiết sản phẩm</h3>
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Tên sản phẩm:</strong> ${product.name}</p>
                        <p><strong>Giá:</strong> ${product.price}</p>
                        <p><strong>Số lượng:</strong> ${product.quantity}</p>
                        <p><strong>Nhà sản xuất:</strong> ${product.factory}</p>
                        <p><strong>Mục đích sử dụng:</strong> ${product.target}</p>
                        <p><strong>Mô tả ngắn:</strong> ${product.shortDesc}</p>
                        <p><strong>Mô tả chi tiết:</strong> ${product.detailDesc}</p>
                    </div>
                    <div class="col-md-6">
                        <c:if test="${not empty product.image}">
                            <img src="/images/product/${product.image}" alt="Ảnh sản phẩm" class="img-fluid">
                        </c:if>
                    </div>
                </div>
                <a href="/admin/product" class="btn btn-secondary mt-3">Quay lại danh sách</a>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
</body>
</html>
