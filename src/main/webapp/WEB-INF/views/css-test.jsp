<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CSS Test</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="container">
    <h1>CSS Test Page</h1>
    <p>If you can see this page with styling, the CSS is working!</p>

    <div class="card">
        <div class="card-header">
            <h3>Test Card</h3>
        </div>
        <div class="card-body">
            <p>This is a test card to verify CSS styling.</p>
            <button class="btn btn-primary">Primary Button</button>
            <button class="btn btn-secondary">Secondary Button</button>
            <button class="btn btn-danger">Danger Button</button>
        </div>
    </div>
</div>
</body>
</html>