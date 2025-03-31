<%@ page import="com.example.model.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="zh-CN">
<%
    String userId = request.getParameter("id");
    User user = new User();
    // 建议做空值检查
    if(userId != null) {
        // 业务逻辑处理
        List<User> users = (List<User>) session.getAttribute("users");
        if (users != null){
            user = users.get(Integer.parseInt(userId));
        }
    }
%>
<head>
    <meta charset="UTF-8">
    <title>Enhanced Login Page</title>
    <!-- 引入Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            opacity: 0.95; /* 半透明效果 */
        }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center" style="height: 100vh;">
<div class="card p-4 shadow-sm" style="max-width: 400px; width: 100%;">
    <h2 class="text-center mb-4">Login</h2>
    <form action="/user/addAndupdate.action?method=addAndupdate" method="post">
        <!-- CSRF Token -->
        <input type="hidden" name="_csrf" value="{{csrfToken}}">
        <input type="hidden" id="id" name="user.id" value="<%= user.getId()%>">
        <div class="mb-3">
            <label for="username" class="form-label">Username:</label>
            <input type="text" class="form-control" id="username" name="user.username" value="<%= user.getUsername()%>" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password:</label>
            <input type="password" class="form-control" id="password" name="user.password"  required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">email:</label>
            <input type="email" class="form-control" id="email" name="user.email" value="<%= user.getEmail()%>" required>
        </div>
        <div class="mb-3">
            <label for="phoneNumber" class="form-label">phoneNumber:</label>
            <input type="text" class="form-control" id="phoneNumber" name="user.phoneNumber" value="<%= user.getPhoneNumber()%>" required>
        </div>
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="remember-me" name="rememberMe">
            <label class="form-check-label" for="remember-me">Remember me</label>
        </div>
        <button type="submit" class="btn btn-primary w-100">Login</button>
        <a href="#" class="d-block mt-2 text-center text-decoration-none">Forgot Password?</a>
    </form>
</div>

<!-- 引入Bootstrap JS和依赖（Popper.js） -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>