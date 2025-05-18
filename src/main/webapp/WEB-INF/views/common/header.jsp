<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${param.title} - Wedding Planner</title>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;700&family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

  <!-- Try multiple paths to find the CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
  <style>
    /* Fallback inline styles in case the CSS file doesn't load */
    body {
      font-family: 'Montserrat', 'Segoe UI', Roboto, sans-serif;
      line-height: 1.6;
      color: #333;
      background-color: #f5f7fa;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }

    h1 {
      font-size: 2.5rem;
      text-align: center;
      margin-bottom: 2rem;
      position: relative;
      font-family: 'Playfair Display', serif;
    }

    h1:after {
      content: '';
      display: block;
      width: 100px;
      height: 3px;
      background: #ff6b6b;
      margin: 10px auto;
    }

    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem 2rem;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      margin-bottom: 2rem;
    }

    .navbar-brand {
      font-size: 1.5rem;
      font-weight: 700;
      color: #ff6b6b;
      text-decoration: none;
    }

    .navbar-nav {
      display: flex;
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .nav-item {
      margin-left: 1.5rem;
    }

    .nav-link {
      color: #333;
      text-decoration: none;
      font-weight: 500;
      transition: all 0.3s ease;
    }

    .nav-link:hover, .nav-link.active {
      color: #ff6b6b;
    }

    .nav-link.active {
      font-weight: 700;
    }

    .btn {
      display: inline-block;
      font-weight: 500;
      text-align: center;
      white-space: nowrap;
      vertical-align: middle;
      user-select: none;
      border: 1px solid transparent;
      padding: 0.5rem 1rem;
      font-size: 1rem;
      line-height: 1.5;
      border-radius: 8px;
      transition: all 0.3s ease;
      cursor: pointer;
      text-decoration: none;
    }

    .btn-primary {
      color: #fff;
      background-color: #ff6b6b;
      border-color: #ff6b6b;
    }

    .btn-secondary {
      color: #fff;
      background-color: #4ecdc4;
      border-color: #4ecdc4;
    }

    .btn-danger {
      color: #fff;
      background-color: #eb4d4b;
      border-color: #eb4d4b;
    }

    .card {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      margin-bottom: 1.5rem;
      overflow: hidden;
    }

    .card-header {
      padding: 1rem;
      background-color: #f9f9f9;
      border-bottom: 1px solid #dfe6e9;
    }

    .card-body {
      padding: 1.5rem;
    }

    .form-group {
      margin-bottom: 1rem;
    }

    .form-control {
      display: block;
      width: 100%;
      padding: 0.5rem 0.75rem;
      font-size: 1rem;
      line-height: 1.5;
      color: #333;
      background-color: #fff;
      border: 1px solid #dfe6e9;
      border-radius: 8px;
      transition: all 0.3s ease;
    }

    .row {
      display: flex;
      flex-wrap: wrap;
      margin-right: -15px;
      margin-left: -15px;
    }

    .col-12, .col-md-4, .col-md-6, .col-md-8 {
      position: relative;
      width: 100%;
      padding-right: 15px;
      padding-left: 15px;
    }

    @media (min-width: 768px) {
      .col-md-4 {
        flex: 0 0 33.333333%;
        max-width: 33.333333%;
      }

      .col-md-6 {
        flex: 0 0 50%;
        max-width: 50%;
      }

      .col-md-8 {
        flex: 0 0 66.666667%;
        max-width: 66.666667%;
      }

      .offset-md-2 {
        margin-left: 16.666667%;
      }
    }

    .bg-Photographer { background-color: #74b9ff !important; }
    .bg-Caterer { background-color: #55efc4 !important; }
    .bg-Venue { background-color: #ffeaa7 !important; color: #2d3436 !important; }
    .bg-Other { background-color: #a29bfe !important; }
  </style>
</head>
<body>
<nav class="navbar">
  <a href="${pageContext.request.contextPath}/" class="navbar-brand">
    <i class="fas fa-heart"></i> Wedding Planner
  </a>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/" class="nav-link ${param.active == 'home' ? 'active' : ''}">Home</a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/vendors" class="nav-link ${param.active == 'vendors' ? 'active' : ''}">Vendors</a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/vendors/register" class="nav-link ${param.active == 'register' ? 'active' : ''}">Add Vendor</a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/vendors/search" class="nav-link ${param.active == 'search' ? 'active' : ''}">Search</a>
    </li>
  </ul>
</nav>

<div class="container fade-in">