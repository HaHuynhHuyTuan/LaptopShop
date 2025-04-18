<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h3 class="mb-4">Chi tiết người dùng</h3>
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>ID:</strong> ${user.id}</p>
                        <p><strong>Họ tên:</strong> ${user.fullName}</p>
                        <p><strong>Email:</strong> ${user.email}</p>
                        <p><strong>Địa chỉ:</strong> ${user.address}</p>
                        <p><strong>SĐT:</strong> ${user.phone}</p>
                        <p><strong>Role:</strong> ${user.role.name}</p>
                    </div>
                    <%--                    <div class="col-md-6">--%>
                    <%--                        <c:if test="${not empty user.avatar}">--%>
                    <%--                            <img src="${pageContext.request.contextPath}/resources/images/avatar/${user.avatar}"--%>
                    <%--                                 alt="Ảnh người dùng" class="img-fluid"--%>
                    <%--                                 style="max-width: 300px; max-height: 300px;">--%>

                    <%--                        </c:if>--%>
                    <%--                    </div>--%>
                </div>
                <a href="/admin/user" class="btn btn-secondary mt-3">Quay lại danh sách</a>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
</body>
</html>
