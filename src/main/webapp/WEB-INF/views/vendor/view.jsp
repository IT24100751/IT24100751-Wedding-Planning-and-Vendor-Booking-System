<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Vendor Details" />
    <jsp:param name="active" value="vendors" />
</jsp:include>

<div class="row">
    <div class="col-md-8 offset-md-2">
        <div class="vendor-details">
            <div class="vendor-header">
                <h1>${vendor.name}</h1>
                <h5 class="text-muted">${vendor.type}</h5>
            </div>

            <div class="row detail-row">
                <div class="col-md-4 font-weight-bold"><i class="fas fa-dollar-sign"></i> Price:</div>
                <div class="col-md-8">$${vendor.price}</div>
            </div>

            <div class="row detail-row">
                <div class="col-md-4 font-weight-bold"><i class="fas fa-phone"></i> Contact:</div>
                <div class="col-md-8">${vendor.contactInfo}</div>
            </div>

            <div class="row detail-row">
                <div class="col-md-4 font-weight-bold"><i class="fas fa-info-circle"></i> Description:</div>
                <div class="col-md-8">${vendor.description}</div>
            </div>

            <c:choose>
                <c:when test="${vendor.type == 'Photographer'}">
                    <div class="row detail-row">
                        <div class="col-md-4 font-weight-bold"><i class="fas fa-camera-retro"></i> Specialization:</div>
                        <div class="col-md-8">${vendor.specialization}</div>
                    </div>
                    <div class="row detail-row">
                        <div class="col-md-4 font-weight-bold"><i class="fas fa-business-time"></i> Experience:</div>
                        <div class="col-md-8">${vendor.experienceYears} years</div>
                    </div>
                </c:when>
                <c:when test="${vendor.type == 'Caterer'}">
                    <div class="row detail-row">
                        <div class="col-md-4 font-weight-bold"><i class="fas fa-utensils"></i> Cuisine:</div>
                        <div class="col-md-8">${vendor.cuisine}</div>
                    </div>
                    <div class="row detail-row">
                        <div class="col-md-4 font-weight-bold"><i class="fas fa-users"></i> Maximum Capacity:</div>
                        <div class="col-md-8">${vendor.maxCapacity} guests</div>
                    </div>
                </c:when>
                <c:when test="${vendor.type == 'Venue'}">
                    <div class="row detail-row">
                        <div class="col-md-4 font-weight-bold"><i class="fas fa-map-marker-alt"></i> Location:</div>
                        <div class="col-md-8">${vendor.location}</div>
                    </div>
                    <div class="row detail-row">
                        <div class="col-md-4 font-weight-bold"><i class="fas fa-users"></i> Capacity:</div>
                        <div class="col-md-8">${vendor.capacity} guests</div>
                    </div>
                    <div class="row detail-row">
                        <div class="col-md-4 font-weight-bold"><i class="fas fa-tree"></i> Outdoor Option:</div>
                        <div class="col-md-8">${vendor.outdoorOption ? 'Yes' : 'No'}</div>
                    </div>
                </c:when>
            </c:choose>

            <div class="mt-4">
                <a href="${pageContext.request.contextPath}/vendors/${vendor.id}/edit" class="btn btn-primary">
                    <i class="fas fa-edit"></i> Edit
                </a>
                <a href="${pageContext.request.contextPath}/vendors/${vendor.id}/delete" class="btn btn-danger"
                   onclick="return confirm('Are you sure you want to delete this vendor?')">
                    <i class="fas fa-trash"></i> Delete
                </a>
                <a href="${pageContext.request.contextPath}/vendors" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Back to List
                </a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />