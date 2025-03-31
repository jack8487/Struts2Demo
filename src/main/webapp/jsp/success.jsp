<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <!-- 引入Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .action-column {
            min-width: 200px;
        }
        .table-header {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card p-4 shadow-sm">
        <h3 class="text-center mb-4">欢迎您，<span class="text-primary">${user.username}</span>！</h3>

        <h2 class="mt-4 mb-3">用户列表</h2>

        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-header">
                <tr>
                    <th>用户ID</th>
                    <th>用户名</th>
                    <th>电子邮箱</th>
                    <th>手机号码</th>
                    <th>注册时间</th>
                    <th class="text-end action-column">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${sessionScope.users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.phoneNumber}</td>
                        <td>${user.registrationDate}</td>
                        <td class="text-end">
                            <a href="/user/addAndupdate.action?method=update&id=${user.id}"
                               class="btn btn-sm btn-primary me-2">
                                <i class="bi bi-pencil"></i> 修改
                            </a>
                            <a href="/user/delete.action?method=delete?id=${user.id}"
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('确定要删除该用户吗？')">
                                <i class="bi bi-trash"></i> 删除
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
            <a href="/jsp/login.jsp" class="btn btn-secondary">返回登录页面</a>
            <a href="/jsp/addUser.jsp" class="btn btn-success">添加新用户</a>
        </div>
    </div>
</div>

<!-- 引入Bootstrap JS和依赖 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<!-- 引入Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</body>
</html>