<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #3b82f6; /* màu xanh giống ảnh */
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .login-form {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .login-form h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-form .form-control {
            margin-bottom: 15px;
        }

        .login-form .signup-link {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<form class="login-form" method="post" action="/login">
    <h2>Login</h2>
    <c:if test="${param.error != null}">
        <div class="my-2" style="color: red;">Invalid email or password.</div>
    </c:if>
    <c:if test="${param.logout != null}">
        <div class="my-2" style="color: green;">Logout Successfully!.</div>
    </c:if>
    <input name="username" type="email" class="form-control" placeholder="Email address">
    <input name="password" type="password" class="form-control" placeholder="Password" required>
    <div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </div>
    <button type="submit" class="btn btn-primary w-100">Login</button>
    <div class="signup-link">
        <small>Need an account? Sign up <a href="/register">Go to login</a></small>
    </div>
</form>

</body>
</html>
