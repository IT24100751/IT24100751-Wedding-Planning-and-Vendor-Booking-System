<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Vendor List" />
    <jsp:param name="active" value="vendors" />
</jsp:include>

<h1>Wedding Vendors</h1>

<c:if test="${not empty message}">
    <div class="alert alert-success">${message}</div>
</c:if>

<div class="row mb-4">
    <div class="col-md-6">
        <a href="${pageContext.request.contextPath}/vendors/register" class="btn btn-primary">
            <i class="fas fa-plus"></i> Add New Vendor
        </a>
    </div>
    <div class="col-md-6">
        <form action="${pageContext.request.contextPath}/vendors/search" method="get" class="form-inline float-right">
            <input type="text" name="query" class="form-control mr-2" placeholder="Search by name">
            <select name="type" class="form-control mr-2">
                <option value="">All Types</option>
                <option value="Photographer">Photographer</option>
                <option value="Caterer">Caterer</option>
                <option value="Venue">Venue</option>
                <option value="Other">Other</option>
            </select>
            <button type="submit" class="btn btn-outline-primary">
                <i class="fas fa-search"></i> Search
            </button>
        </form>
    </div>
</div>

<div class="row">
    <c:choose>
        <c:when test="${empty vendors}">
            <div class="col-12 text-center">
                <div class="card">
                    <div class="card-body">
                        <p>No vendors found. Add a new vendor to get started.</p>
                        <a href="${pageContext.request.contextPath}/vendors/register" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Add New Vendor
                        </a>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach items="${vendors}" var="vendor">
                <div class="col-md-4">
                    <div class="card vendor-card">
                        <div class="card-header bg-${vendor.type}">
                            <h5 class="mb-0">${vendor.type}</h5>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${vendor.name}</h5>
                            <p class="card-text">
                                <strong><i class="fas fa-dollar-sign"></i> Price:</strong> $${vendor.price}<br>
                                <strong><i class="fas fa-phone"></i> Contact:</strong> ${vendor.contactInfo}
                            </p>
                            <div class="btn-group">
                                <a href="${pageContext.request.contextPath}/vendors/${vendor.id}" class="btn btn-sm btn-outline-primary">
                                    <i class="fas fa-eye"></i> View
                                </a>
                                <a href="${pageContext.request.contextPath}/vendors/${vendor.id}/edit" class="btn btn-sm btn-outline-secondary">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="${pageContext.request.contextPath}/vendors/${vendor.id}/delete" class="btn btn-sm btn-outline-danger"
                                   onclick="return confirm('Are you sure you want to delete this vendor?')">
                                    <i class="fas fa-trash"></i> Delete
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="../common/footer.jsp" />