<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Account</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #3b82f6; /* blue background */
        }

        .card {
            border: none;
            border-radius: 12px;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn-primary {
            background-color: #2563eb;
            border: none;
            border-radius: 8px;
        }

        .btn-primary:hover {
            background-color: #1d4ed8;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<div class="container d-flex align-items-center justify-content-center min-vh-100">
    <div class="card shadow p-4" style="width: 100%; max-width: 500px;">
        <h4 class="text-center mb-4">Create Account</h4>
        <form action="RegisterServlet" method="post">
            <div class="row g-3">
                <div class="col-md-6">
                    <input type="text" class="form-control" name="firstName" placeholder="First name" required>
                </div>
                <div class="col-md-6">
                    <input type="text" class="form-control" name="lastName" placeholder="Last name" required>
                </div>
                <div class="col-12">
                    <input type="email" class="form-control" name="email" placeholder="Email address" required>
                </div>
                <div class="col-md-6">
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                </div>
                <div class="col-md-6">
                    <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password"
                           required>
                </div>
                <div class="col-12 d-grid">
                    <button type="submit" class="btn btn-primary">Create Account</button>
                </div>
            </div>
        </form>
        <div class="login-link text-muted">
            <small>Have an account? <a href="login.jsp">Go to login</a></small>
        </div>
    </div>
</div>

<!-- Bootstrap JS (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 