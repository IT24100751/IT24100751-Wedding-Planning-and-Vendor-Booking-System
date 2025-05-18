<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Search Vendors" />
    <jsp:param name="active" value="search" />
</jsp:include>

<h1>Search Vendors</h1>

<div class="search-form">
    <form action="${pageContext.request.contextPath}/vendors/search" method="get">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="query"><i class="fas fa-search"></i> Search by Name:</label>
                    <input type="text" id="query" name="query" class="form-control" placeholder="Enter vendor name" value="${searchType == 'name' ? searchValue : ''}">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="type"><i class="fas fa-filter"></i> Filter by Type:</label>
                    <select id="type" name="type" class="form-control">
                        <option value="">All Types</option>
                        <option value="Photographer" ${searchType == 'type' && searchValue == 'Photographer' ? 'selected' : ''}>Photographer</option>
                        <option value="Caterer" ${searchType == 'type' && searchValue == 'Caterer' ? 'selected' : ''}>Caterer</option>
                        <option value="Venue" ${searchType == 'type' && searchValue == 'Venue' ? 'selected' : ''}>Venue</option>
                        <option value="Other" ${searchType == 'type' && searchValue == 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label>&nbsp;</label>
                    <button type="submit" class="btn btn-primary btn-block">
                        <i class="fas fa-search"></i> Search
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>

<div class="row mb-4">
    <div class="col-md-6">
        <a href="${pageContext.request.contextPath}/vendors" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back to All Vendors
        </a>
    </div>
</div>

<c:if test="${not empty searchType}">
    <div class="alert alert-info">
        <c:choose>
            <c:when test="${searchType == 'name'}">
                <i class="fas fa-info-circle"></i> Showing results for vendors with name containing: <strong>${searchValue}</strong>
            </c:when>
            <c:when test="${searchType == 'type'}">
                <i class="fas fa-info-circle"></i> Showing results for vendor type: <strong>${searchValue}</strong>
            </c:when>
        </c:choose>
    </div>
</c:if>

<div class="row">
    <c:choose>
        <c:when test="${empty vendors}">
            <div class="col-12 text-center">
                <div class="card">
                    <div class="card-body">
                        <p>No vendors found matching your search criteria.</p>
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